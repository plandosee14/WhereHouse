package com.WhereHouse.mypage.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.mypage.persistence.MyPassDAO;

@Service
public class MyPassServiceImpl implements MyPassService{

	@Inject
	private MyPassDAO dao;

	@Override
	public MemberVO selectPassword(MemberVO vo) throws Exception {
		return dao.selectPass(vo);
	}





	
}	
