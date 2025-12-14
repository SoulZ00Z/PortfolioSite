package com.portfolio;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

/**
 * Spring Boot site entry point.
 * Begins Spring Boot site.
 * @ServletComponentScan lets Spring find & register @WebServlet classes
 * so existing Servlets will continue to work with Spring controllers.
 */
@SpringBootApplication
@ServletComponentScan  // Looks for @WebServlet annotations (Ex. LoginServlet, SignupServlet, etc.)
public class PortfolioSBEx {

    public static void main(String[] args) {
        SpringApplication.run(PortfolioSBEx.class, args);
    }
}

