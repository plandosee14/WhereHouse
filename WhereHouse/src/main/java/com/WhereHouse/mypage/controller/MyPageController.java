package com.WhereHouse.mypage.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.WhereHouse.basket.domain.BasketVO;
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
    public String listBasket(Model model, HttpServletRequest request) throws Exception{
		String m_id = (String) request.getSession().getAttribute("m_id");
		System.out.println("Session üũ : "+m_id);
		model.addAttribute("list",service.listAllById(m_id));
		return "/mypage/mypage";
    }

}
