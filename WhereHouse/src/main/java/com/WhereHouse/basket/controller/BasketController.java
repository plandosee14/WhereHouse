package com.WhereHouse.basket.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.WhereHouse.basket.domain.BasketVO;
import com.WhereHouse.basket.service.BasketService;

@RestController
@RequestMapping("/baskets")
public class BasketController {
	
	@Inject
	private BasketService service;
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ResponseEntity<String> insertBasket(int h_no, HttpSession session){
		System.out.println("들어간다아아아~!!!!");
		ResponseEntity<String> entity = null;
		
		BasketVO vo = new BasketVO();
		String m_id = (String) session.getAttribute("m_id");
		vo.setH_no(h_no);
		vo.setM_id(m_id);
		System.out.println(h_no);
		System.out.println(m_id);
		
		try {
			service.read(vo);
			entity =  new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	public ResponseEntity<String> deleteBasket(@RequestBody int b_no) {
		return null;
	}
	
}
