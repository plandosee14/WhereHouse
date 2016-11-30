package com.WhereHouse.house.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.WhereHouse.comment.domain.Criteria;
import com.WhereHouse.house.service.HouseDetailService;

@Controller
@RequestMapping("/")
public class HouseDetailController {
	private static final Logger logger = LoggerFactory.getLogger(HouseDetailController.class);

	@Inject
	private HouseDetailService service;
	
	@RequestMapping("/read")
	public void read(int h_no, Model model) throws Exception{
		model.addAttribute(service.read(h_no));
	}
	
	@RequestMapping("/detail")
	public String readPage(int h_no, Model model, @ModelAttribute("cri") Criteria cri) throws Exception{
		model.addAttribute(service.read(h_no));
		return "house/detailHouse";
	}
	
}
