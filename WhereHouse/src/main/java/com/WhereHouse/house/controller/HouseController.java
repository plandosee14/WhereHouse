package com.WhereHouse.house.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HouseController {
	@RequestMapping("/detail")
	public String main() {
		return "house/detailHouse";
	}
}
