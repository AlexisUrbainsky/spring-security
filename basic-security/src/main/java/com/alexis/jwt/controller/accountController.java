package com.alexis.jwt.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/account")
public class accountController {

    @GetMapping()
    public String getAccountDetails(){
        return "Description about Account Details";
    }

}
