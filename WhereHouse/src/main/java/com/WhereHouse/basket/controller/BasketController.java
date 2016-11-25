package com.WhereHouse.basket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BasketController {
	
	@RequestMapping("/")
    public String sayHello(){ 
		return "mypage";
    }
}
