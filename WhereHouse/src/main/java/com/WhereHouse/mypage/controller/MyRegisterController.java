package com.WhereHouse.mypage.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.WhereHouse.mypage.service.MyRegisterService;

@Controller
@RequestMapping("/mypage")
public class MyRegisterController {
	
	@Inject
	private MyRegisterService regService;

	@RequestMapping("/reginfo")
	public String regInfo(Model model, HttpServletRequest request, RedirectAttributes attr)throws Exception{
		String m_id = (String) request.getSession().getAttribute("m_id");
		model.addAttribute("regList", regService.listAllById(m_id));
		return "/mypage/mypageReginfo";
	}
}
