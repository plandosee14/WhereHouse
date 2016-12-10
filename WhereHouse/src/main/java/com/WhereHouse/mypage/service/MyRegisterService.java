package com.WhereHouse.mypage.service;

import java.util.List;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.mypage.domain.MyRegisterVO;

public interface MyRegisterService {
	public List<MyRegisterVO> listAllById(String m_id)throws Exception;
	public List<MyRegisterVO> listEstimateById(String m_id)throws Exception;
	public void modifyScore(MemberVO member)throws Exception;
	public List<HouseVO> listHouseById(String m_id)throws Exception;
}
