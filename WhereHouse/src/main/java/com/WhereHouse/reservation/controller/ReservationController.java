package com.WhereHouse.reservation.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
	public void reservationHouse(int h_no,Model model)throws Exception{
		HouseVO house  = hservice.selectHouseByHno(h_no);
		
		model.addAttribute("startDate", "\""+house.getH_startdate()+"\"");
		model.addAttribute("endDate", "\""+house.getH_enddate()+"\"");
		model.addAttribute(house);
		System.out.println(rservice.selectReservationImPossibleDate(h_no).toString());
		model.addAttribute("dateList", rservice.selectReservationImPossibleDate(h_no));
		
		
	}
	
/*	@RequestMapping("/reservationForm")
	public void reservation(@RequestParam("h_no") int h_no,ReservationVO reservation, Model model)throws Exception{
		System.out.println("안들어오니?"); 
		rservice.insertReservation(reservation);
		 HouseVO house  = hservice.selectHouseByHno(h_no);
			
			model.addAttribute("startDate", "\""+house.getH_startdate()+"\"");
			model.addAttribute("endDate", "\""+house.getH_enddate()+"\"");
			model.addAttribute(house);
			model.addAttribute("dateList", rservice.selectReservationImPossibleDate(h_no));
			model.addAttribute("reservation", reservation);
			
			
	}*/
	
	@RequestMapping("/reservationForm")
	public void test2(int h_no,Model model,HttpServletRequest request)throws Exception{
		ReservationVO reservation = new ReservationVO();
		System.out.println(h_no);
		String r_startday = request.getParameter("startdate");
		String r_endday = request.getParameter("enddate");
		String r_peoplecnt = request.getParameter("peoplecnt");
		HouseVO house  = hservice.selectHouseByHno(h_no);
		
		System.out.println(r_startday);
		System.out.println(r_endday);
		model.addAttribute("startDate", "\""+house.getH_startdate()+"\"");
		model.addAttribute("endDate", "\""+house.getH_enddate()+"\"");
		model.addAttribute(house);
		System.out.println(rservice.selectReservationImPossibleDate(h_no).toString());
		model.addAttribute("dateList", rservice.selectReservationImPossibleDate(h_no));
		model.addAttribute("r_startdate", "\""+r_startday+"\"");
		model.addAttribute("r_enddate", "\""+r_endday+"\"");
		model.addAttribute("r_peoplecnt", r_peoplecnt);
		model.addAttribute(reservation);
	}

}
