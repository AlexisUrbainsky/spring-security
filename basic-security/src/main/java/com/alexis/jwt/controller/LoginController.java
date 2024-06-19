package com.alexis.jwt.controller;

import com.alexis.jwt.model.Customer;
import com.alexis.jwt.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/login")
@RestController
public class LoginController {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private CustomerRepository customerRepository;

    @PostMapping("/register")
    public ResponseEntity<String> registerUser(@RequestBody Customer customer){
        Customer savedCustomer = null;
        ResponseEntity<String> response = null;

        try{
            customer.setPwd(passwordEncoder.encode(customer.getPwd()));
            savedCustomer = customerRepository.save(customer);
            if(savedCustomer.getId() > 0){
                response = ResponseEntity.status(HttpStatus.CREATED)
                        .body("Giver user details are successfully registered");
            }
        }catch (Exception ex){
            response = ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An exception occurred due to " + ex.getMessage());
        }

        return response;
    }



}
