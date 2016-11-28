package com.WhereHouse.basket.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.WhereHouse.basket.service.BasketService;

@Controller
public class BasketController {
	
	@Inject
	private BasketService service;
	
	
}
