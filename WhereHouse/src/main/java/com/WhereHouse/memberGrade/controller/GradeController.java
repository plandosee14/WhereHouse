package com.WhereHouse.memberGrade.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.WhereHouse.memberGrade.domain.GradeVO;
import com.WhereHouse.memberGrade.service.GradeService;

@RestController
@RequestMapping("/grades")
public class GradeController {

	@Inject
	private GradeService service;

	@RequestMapping(value="/{h_no}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("h_no") int h_no, @RequestBody GradeVO vo) {
		vo.setH_no(h_no);
		ResponseEntity<String> entity = null;
		
		try {
			service.updateGrade(vo);
			entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
