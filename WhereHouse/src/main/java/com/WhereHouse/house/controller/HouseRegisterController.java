package com.WhereHouse.house.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.service.HouseService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	public @ResponseBody void Register(HttpServletRequest request, HttpSession session, HouseVO house, MultipartFile file){
		System.out.println("등록폼 데이터: "+house);
		System.out.println("등록폼 파일: "+file);
		
		UUID uid = UUID.randomUUID();
		
		String saveName = uid.toString()+"_"+file.getOriginalFilename();
		
		
		
		System.out.println("넌 무슨 네임이니?: "+saveName);
		String uploadpath = request.getSession().getServletContext().getRealPath("/resources/img/house"); 
		
	    File target = new File(uploadpath, saveName);
        try {
			FileCopyUtils.copy(file.getBytes(), target);
			
			
			
			house.setH_thumnail(saveName);
			
			System.out.println(house.toString());
			hservice.insertHouse(house);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	@RequestMapping("/register2")
	public @ResponseBody void Register2(HttpServletRequest request, HttpSession session, HouseVO house){
		System.out.println(house.toString());
		int maxSize=15*1024*1024; //크기
		String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/img/house");
		try {
			//디렉토리설정
			MultipartRequest mr =  new MultipartRequest(request,saveDirectory,maxSize,"UTF-8",
							new DefaultFileRenamePolicy());
			//사진저장
			
			String filename = mr.getFilesystemName("file");
			//사진이름 얻어오기
			
			System.out.println("파일이름: "+filename);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
	}
		
	
	

}
