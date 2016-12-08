package com.WhereHouse.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/house")
public class ReservationController {
	
	@RequestMapping("/testCalender")
	public void CalcTest(){
		
	}
	
	@RequestMapping("/reservationHouse")
	public void reservationHouse(@RequestParam("h_no") int h_no,Model model)throws Exception{
		
	}

}
