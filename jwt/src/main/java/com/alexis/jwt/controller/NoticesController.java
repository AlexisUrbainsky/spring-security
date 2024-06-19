package com.alexis.jwt.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/notices")
public class NoticesController {

    @GetMapping()
    public String getNoticesDetails(){
        return "Very soon you are going to have notices of us";
    }
}
