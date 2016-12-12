package com.WhereHouse.reservation.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.service.HouseService;
import com.WhereHouse.reservation.domain.ReservationVO;
import com.WhereHouse.reservation.service.ReservationService;

@Controller
@RequestMapping("/house")
public class ReservationController {
	
	@Inject
	HouseService hservice;
	
	@Inject
	ReservationService rservice;
	
	@RequestMapping("/testCalender")
	public void CalcTest(){
		
	}
	
	@RequestMapping("/reservationHouse")
	public void reservationHouse(@RequestParam("h_no") int h_no,Model model)throws Exception{
		HouseVO house  = hservice.selectHouseByHno(h_no);
		
		model.addAttribute(house);
		System.out.println(rservice.selectReservationImPossibleDate(h_no).toString());
		model.addAttribute("dateList", rservice.selectReservationImPossibleDate(h_no));
		
		
	}
	
	@RequestMapping("/regervation")
	public void reservation(ReservationVO reservation, Model model)throws Exception{
		
		
	}

}
