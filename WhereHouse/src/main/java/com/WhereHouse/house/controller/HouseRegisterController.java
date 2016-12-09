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
import com.WhereHouse.option.domain.HouseOptionVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@RequestMapping("/house")
@Controller
public class HouseRegisterController {
	
	@Inject
	HouseService hservice;

	//�����
	@RequestMapping("registerForm")
	public void RegisterForm(){
		
	}
	
	@RequestMapping("test")
	public void test(){
		
	}
	
	//���
	@RequestMapping("/register")
	public @ResponseBody void Register(HttpServletRequest request, HttpSession session, HouseVO house, MultipartFile file){
		System.out.println("����� ������: "+house);
		System.out.println("����� ����: "+file);
		
		UUID uid = UUID.randomUUID();
		
		String saveName = uid.toString()+"_"+file.getOriginalFilename();
		
		
	    
	    
		System.out.println("�� ���� �����̴�?: "+saveName);
		String uploadpath = request.getSession().getServletContext().getRealPath("/resources/img/house"); 
		
	    File target = new File(uploadpath, saveName);
        try {
			FileCopyUtils.copy(file.getBytes(), target);
			
			
			
			house.setH_thumnail(saveName);
			
			System.out.println(house.toString());
			//hservice.insertHouse(house);
			
			//�� �ɼ� ��������
			String[] h_option = request.getParameterValues("h_option"); 
			
		   /* for (int i = 0; i < h_option.length; i++) {
		    	
		    	HouseOptionVO hoption = new HouseOptionVO();
		    	hoption.setH_no(hservice.selectNewHouseById(house.getM_id()));
		    	hoption.setO_name(h_option[i]);
		    	
		    	hservice.insertHouseOption(hoption);;
  	
			}*/
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

		
	
	

}
