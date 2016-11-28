package com.WhereHouse.mypage.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.WhereHouse.basket.service.BasketService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Inject
	private BasketService service;
	
	@RequestMapping("")
    public String mypage(Model model, HttpSession session) throws Exception{
		
		
		
		
		return "/mypage/mypage";
    }
	@RequestMapping("/basket")
    public String listBasket(Model model, HttpSession session) throws Exception{
		model.addAttribute("list", service.listAllById(session.getId()
				));
		return "/mypage/mypage";
    }

}
