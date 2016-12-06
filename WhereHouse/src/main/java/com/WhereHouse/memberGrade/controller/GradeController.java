package com.WhereHouse.memberGrade.controller;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.WhereHouse.memberGrade.service.GradeService;

@RestController
@RequestMapping("/grades")
public class GradeController {

	@Inject
	private GradeService service;

	
}
