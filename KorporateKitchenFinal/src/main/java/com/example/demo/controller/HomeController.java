package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index() {
        return "index"; // renders /WEB-INF/jsp/index.jsp
    }

    @GetMapping("/login")
    public String login() {
        return "login"; // renders /WEB-INF/jsp/login.jsp
    }

    @GetMapping("/register")
    public String register() {
        return "register"; // renders /WEB-INF/jsp/register.jsp
    }
}
