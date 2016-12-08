package com.WhereHouse.memberGrade.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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

	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String update(GradeVO vo, HttpSession session) {
		System.out.println("vo1"+vo);
		String m_id = (String) session.getAttribute("m_id");
		vo.setM_id(m_id);
		System.out.println("vo2"+vo);
		try {
			service.insertGrade(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
}
