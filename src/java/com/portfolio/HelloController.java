package com.portfolio;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Spring Boot REST Controller
 * 
 * http://localhost:8080/hello?name=Josh
 * 
 * Simple versus Servlet.
 */
@RestController
public class HelloController {

    @GetMapping("/hello")
    public String hello(@RequestParam(defaultValue = "World") String name) {
        return "Hello, " + name + "! Spring Boot endpoint works.";
    }
}

