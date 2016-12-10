package com.WhereHouse.house.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.service.HouseService;
import com.WhereHouse.option.domain.HouseOptionVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@RequestMapping("/house")
@Controller
public class HouseRegisterController {
	
	@Inject
	HouseService hservice;

	//등록폼
	@RequestMapping("registerForm")
	public void RegisterForm(){
		
	}
	
	@RequestMapping("test")
	public void test(){
		
	}
	
	//등록
	@RequestMapping("/register")
	public @ResponseBody void Register(HttpServletRequest request, HttpSession session, HouseVO house, MultipartFile file){
		System.out.println("등록폼 데이터: "+house);
		System.out.println("등록폼 파일: "+file);
		
		UUID uid = UUID.randomUUID();
		
		String saveName = uid.toString()+"_"+file.getOriginalFilename();
		
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		System.out.println("h_startdate: "+startdate);
		System.out.println("h_endtdate: "+enddate);

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date h_startdate =  transFormat.parse(startdate);
			Date h_enddate =  transFormat.parse(enddate);
			house.setH_startdate( new java.sql.Date(h_startdate.getTime()));
			house.setH_enddate( new java.sql.Date(h_enddate.getTime()));
		} catch (ParseException e1) {
			
			e1.printStackTrace();
		}
		
		//핸드폰 번호 가져오기
		String m_phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
		
		//Date date = new Date(year, month, date)
	    
	    
		System.out.println("넌 무슨 네임이니?: "+saveName);
		String uploadpath = request.getSession().getServletContext().getRealPath("/resources/img/house"); 
		System.out.println(uploadpath);
		//String uploadpath = application.getRealPath("/resources/img/house");
	    File target = new File(uploadpath, saveName);
        try {
			FileCopyUtils.copy(file.getBytes(), target);
			
			
			house.setM_phone(m_phone);
			house.setH_thumnail(saveName);
			
			System.out.println(house.toString());
			hservice.insertHouse(house); 
			
			//집 옵션 가져오기
			String[] h_option = request.getParameterValues("h_option"); 
			
		    for (int i = 0; i < h_option.length; i++) {
		    	
		    	HouseOptionVO hoption = new HouseOptionVO();
		    	hoption.setH_no(hservice.selectNewHouseById(house.getM_id()));
		    	hoption.setO_name(h_option[i]);
		    	
		    	System.out.println("h_option: "+hoption.toString());
		    	hservice.insertHouseOption(hoption);
  	
			}
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

		
	
	

}
