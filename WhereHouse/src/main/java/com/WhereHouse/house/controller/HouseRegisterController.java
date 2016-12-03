package com.WhereHouse.house.controller;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
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
	public void Register(HttpServletRequest request, HttpSession session, HouseVO house, MultipartFile file){
		System.out.println("등록폼 데이터: "+house);
		
		String saveName = file.getOriginalFilename();
		
		String uploadpath = request.getSession().getServletContext().getRealPath("/resources/upload"); 
		
	    File target = new File(uploadpath, saveName);
        try {
			FileCopyUtils.copy(file.getBytes(), target);
			house.setH_thumnail(saveName);
			System.out.println(house.toString());
			//hservice.insertHouse(house);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
		
	
	

}
