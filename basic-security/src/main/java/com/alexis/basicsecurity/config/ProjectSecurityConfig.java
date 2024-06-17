package com.alexis.basicsecurity.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class ProjectSecurityConfig {

    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {

        http.authorizeHttpRequests((request) -> request
                        .requestMatchers("/account","/cards","/loans","/balance").authenticated()
                        .requestMatchers("/contact","/notices").permitAll())
                 .formLogin(Customizer.withDefaults())
                 .httpBasic(Customizer.withDefaults());

        return http.build();
    }

}