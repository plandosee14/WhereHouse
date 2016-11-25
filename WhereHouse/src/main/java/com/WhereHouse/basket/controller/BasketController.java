package com.WhereHouse.basket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class BasketController {
	
	@RequestMapping("/basket")
    public String sayHello(){ 
		return "mypage/mypage";
    }
}
