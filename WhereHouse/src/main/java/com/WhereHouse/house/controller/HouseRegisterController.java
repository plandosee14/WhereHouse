package com.WhereHouse.house.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.service.HouseService;

@RequestMapping("/house")
@Controller
public class HouseRegisterController {
	
	@Inject
	HouseService hservice;

	@RequestMapping("registerForm")
	public void RegisterForm(){
		
	}
	@RequestMapping("test")
	public void test(){
		
	}
	
	@RequestMapping("/register")
	public void Register(HttpSession session, HouseVO house, MultipartFile file){
		System.out.println("등록폼 데이터: "+house);
		try {
			hservice.insertHouse(house);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	

}
