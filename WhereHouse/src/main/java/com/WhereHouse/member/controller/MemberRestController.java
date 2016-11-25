package com.WhereHouse.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.member.service.MemberService;

@RestController
@RequestMapping("/member")
public class MemberRestController {

	@Inject
	private MemberService service;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(MemberVO vo) throws Exception {
		System.out.println("restcontroller=" + vo.toString());
		try {
			service.register(vo);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	@RequestMapping(value = "/checkid", method = RequestMethod.POST)
	public String checkID(String m_id) throws Exception {
		System.out.println("restcontroller=" + m_id);
		return service.checkID(m_id);
	}

	@RequestMapping(value = "/findid", method = RequestMethod.POST)
	public String findID(MemberVO vo) throws Exception {
		System.out.println("restcontroller=" + vo.toString());
		return service.findID(vo);
	}

	@RequestMapping(value = "/findpass", method = RequestMethod.POST)
	public String findPass(MemberVO vo) throws Exception {
		System.out.println("restcontroller=" + vo.toString());
		return service.findPass(vo);
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(MemberVO vo, HttpSession session) throws Exception {
		System.out.println("restcontroller=" + vo.toString());
		if (service.login(vo) == null || service.login(vo).getM_id().equals("")
				|| service.login(vo).getM_name().equals("")) {
			MemberVO m = service.login(vo);
			session.setAttribute("m_id", m.getM_id());
			session.setAttribute("m_id", m.getM_no());
			session.setAttribute("m_id", m.getM_name());
		}
	}

}
