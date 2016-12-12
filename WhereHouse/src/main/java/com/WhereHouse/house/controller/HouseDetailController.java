package com.WhereHouse.house.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.WhereHouse.comment.domain.Criteria;
import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.service.HouseDetailService;
import com.WhereHouse.house.service.HouseService;
import com.WhereHouse.reservation.service.ReservationService;

@Controller
@RequestMapping("/house")
public class HouseDetailController {
	private static final Logger logger = LoggerFactory.getLogger(HouseDetailController.class);

	@Inject
	private HouseDetailService service;
	
	@Inject
	private ReservationService rservice;
	
	@Inject
	private HouseService hservice;
	
	
	@RequestMapping("/read")
	public void read(int h_no, Model model) throws Exception{
		model.addAttribute(service.read(h_no));
	}
	
	@RequestMapping("/detail")
	public String readPage(int h_no, Model model, @ModelAttribute("cri") Criteria cri, HttpSession session) throws Exception{
		String m_id = (String) session.getAttribute("m_id");
		
		HouseVO house = service.read(h_no);
		
		model.addAttribute(house);
		model.addAttribute("oList",service.selectHouseOption(h_no));
		boolean checkGrade = false;
		if(m_id != null){
			checkGrade = service.grade(m_id, h_no);
		}
		model.addAttribute("checkGrade", checkGrade);
		
		model.addAttribute("startDate", "\""+house.getH_startdate()+"\"");
		model.addAttribute("endDate", "\""+house.getH_enddate()+"\"");

		System.out.println(rservice.selectReservationImPossibleDate(h_no).toString());
		model.addAttribute("dateList", rservice.selectReservationImPossibleDate(h_no));
		
		return "house/detailHouse";
	}
	

}
