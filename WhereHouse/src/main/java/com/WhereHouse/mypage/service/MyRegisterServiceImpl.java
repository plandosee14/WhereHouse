package com.WhereHouse.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.mypage.domain.MyRegisterVO;
import com.WhereHouse.mypage.persistence.MyRegisterDAO;

@Service
public class MyRegisterServiceImpl implements MyRegisterService{

	@Inject
	private MyRegisterDAO dao;
	
	@Override
	public List<MyRegisterVO> listAllById(String m_id) throws Exception {
		return dao.selectMyRegister(m_id);
	}

	@Override
	public List<MyRegisterVO> listEstimateById(String m_id) throws Exception {
		return dao.selectMyEstimate(m_id);
	}

	@Override
	public void modifyScore(MemberVO member) throws Exception {
		dao.updateScore(member);
	}

	@Override
	public List<HouseVO> listHouseById(String m_id) throws Exception {
		return dao.selectMyHouse(m_id);
	}

	
}
