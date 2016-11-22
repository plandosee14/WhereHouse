package com.WhereHouse.member.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.member.service.MemberService;

@RestController
@RequestMapping("/member")
public class MemberRestController {

	@Inject
	private MemberService service;

	@RequestMapping(value = "/register")
	public String register(MemberVO vo) throws Exception {
		System.out.println(vo.toString());
		try {
			service.register(vo);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
}
