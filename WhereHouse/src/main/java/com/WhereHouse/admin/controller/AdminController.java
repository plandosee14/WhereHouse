package com.WhereHouse.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class AdminController {
	
	@RequestMapping("/admin")
	public String admin(){
		return "/admin";
	}

}
