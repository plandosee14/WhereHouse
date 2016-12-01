package com.WhereHouse.mypage.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.WhereHouse.mypage.service.MyReservationService;



@Controller
@RequestMapping("/mypage")
public class MyReservationController {

	@Inject
	private MyReservationService rService;

	@RequestMapping("/payinfo")
	public String payInfo(Model model, HttpServletRequest request, RedirectAttributes attr)throws Exception{
		String m_id = (String) request.getSession().getAttribute("m_id");
		model.addAttribute("rList", rService.listAllById(m_id));
		return "/mypage/mypage2";
	}
}
