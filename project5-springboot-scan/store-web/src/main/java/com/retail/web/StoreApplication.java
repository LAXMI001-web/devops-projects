package com.retail.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class StoreApplication {
    public static void main(String[] args) { SpringApplication.run(StoreApplication.class, args); }
    @GetMapping("/") public String home() { return "store-web is running"; }
    @GetMapping("/health") public String health() { return "OK"; }
}
