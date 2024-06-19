package com.alexis.basicsecurity.config;

import com.alexis.basicsecurity.filter.AuthoritiesLoggingAfterFilter;
import com.alexis.basicsecurity.filter.AuthoritiesLoggingAtFilter;
import com.alexis.basicsecurity.filter.CsrfCookieFilter;
import com.alexis.basicsecurity.filter.RequestValidationBeforeFilter;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.csrf.CsrfTokenRequestAttributeHandler;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;

import java.util.Collections;

@Configuration
public class ProjectSecurityConfig {


    @Bean
    public SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {

        CsrfTokenRequestAttributeHandler requestHandler = new CsrfTokenRequestAttributeHandler();
        requestHandler.setCsrfRequestAttributeName("_csrf");

        http.securityContext((context) -> context.requireExplicitSave(false))
            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.ALWAYS))
            .cors(corsCustomizer -> corsCustomizer.configurationSource(new CorsConfigurationSource() {
            @Override
            public CorsConfiguration getCorsConfiguration(HttpServletRequest request) {
                CorsConfiguration config = new CorsConfiguration();
                config.setAllowedOrigins(Collections.singletonList("http://localhost:4200"));
                config.setAllowedMethods(Collections.singletonList("*"));
                config.setAllowCredentials(true);
                config.setAllowedHeaders(Collections.singletonList("*"));
                config.setMaxAge(3600L);
                return config;
            }
        })).csrf((csrf) -> csrf.csrfTokenRequestHandler(requestHandler).ignoringRequestMatchers("/contact", "/login/*")
                        .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse()))
                        .addFilterAfter(new CsrfCookieFilter(), BasicAuthenticationFilter.class)
                        .addFilterBefore(new RequestValidationBeforeFilter(), BasicAuthenticationFilter.class)
                        .addFilterAt(new AuthoritiesLoggingAtFilter(), BasicAuthenticationFilter.class)
                        .addFilterAfter(new AuthoritiesLoggingAfterFilter(), BasicAuthenticationFilter.class)
                        .authorizeHttpRequests((requests)->requests
                        /*.requestMatchers("/account").hasAuthority("VIEWACCOUNT")
                        .requestMatchers("/balance").hasAnyAuthority("VIEWACCOUNT","VIEWBALANCE")
                        .requestMatchers("/loans").hasAuthority("VIEWLOANS")
                        .requestMatchers("/cards").hasAuthority("VIEWCARDS")*/
                        .requestMatchers("/account").hasRole("USER")
                        .requestMatchers("/balance").hasAnyRole("USER","ADMIN")
                        .requestMatchers("/loans").hasRole("USER")
                        .requestMatchers("/cards").hasRole("XUSER")
                        //.requestMatchers("/user").authenticated()
                .requestMatchers("/notices","/contact","/login/*").permitAll())
                .formLogin(Customizer.withDefaults())
                .httpBasic(Customizer.withDefaults());
        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
}