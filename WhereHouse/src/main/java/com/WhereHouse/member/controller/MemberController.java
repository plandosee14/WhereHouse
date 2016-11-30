package com.WhereHouse.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/google")
	public String google(){
		return "googleMap";
	}
	
	@RequestMapping("/google2")
	public String google2(){
		return "googleMap2";
	}
	
	@RequestMapping("/google3")
	public String google3(){
		return "googleMap3";
	}
}
