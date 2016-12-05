package com.WhereHouse.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.WhereHouse.admin.service.AdminService;
import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.member.domain.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	AdminService service;
	
	
	@RequestMapping("")
	public String admin(Model model)throws Exception{
	
		List<MemberVO> list = service.selectAllMember();
		List<HouseVO> houselist = service.selectHouse(); 
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println(list.get(i).toString());
//		}
		model.addAttribute("list",service.selectAllMember());
		model.addAttribute("houselist",service.selectHouse());
		model.addAttribute("reservationlist",service.selectReservation());

		return "admin/main";
	}
	
	@RequestMapping("/member_admin")
	public String memberadmin(Model model)throws Exception{
	
		List<MemberVO> memberlist = service.selectAllMember();
		for (int i = 0; i < memberlist.size(); i++) {
			System.out.println(memberlist.get(i).toString());
		}
		model.addAttribute("memberlist",service.selectAllMember());
		//System.out.println(service.selectAllMember());
		return "admin/member_admin";
	}
	
	@RequestMapping("/house_admin")
	public String houseAdmin(Model model)throws Exception{
		List<HouseVO> houselist = service.selectHouse(); 
		for (int i = 0; i < houselist.size(); i++) {
			System.out.println(houselist.get(i).toString());
		}
		model.addAttribute("houselist",service.selectHouse());
		return "admin/house_admin";
	}

	 

}
