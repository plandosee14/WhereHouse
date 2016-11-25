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
		return service.checkID(m_id);
	}

	@RequestMapping(value = "/findid", method = RequestMethod.POST)
	public String findID(MemberVO vo) throws Exception {
		return service.findID(vo);
	}

	@RequestMapping(value = "/findpass", method = RequestMethod.POST)
	public String findPass(MemberVO vo) throws Exception {
		return service.findPass(vo);
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public MemberVO login(MemberVO vo, HttpSession session) throws Exception {
		MemberVO m = new MemberVO();
		m = service.login(vo);
		if (m==null) {
			 return null;
		}else {
			session.setAttribute("m_id", m.getM_id());
			session.setAttribute("m_no", m.getM_no());
			session.setAttribute("m_name", m.getM_name());
			 return m;
		}
		
	}

}
