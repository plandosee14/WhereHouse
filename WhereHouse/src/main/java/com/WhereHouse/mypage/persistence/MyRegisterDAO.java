package com.WhereHouse.mypage.persistence;

import java.util.List;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.mypage.domain.MyRegisterVO;

public interface MyRegisterDAO {
	public List<MyRegisterVO> selectMyRegister(String m_id)throws Exception;
	public List<MyRegisterVO> selectMyEstimate(String m_id)throws Exception;
	public void updateScore(MemberVO member)throws Exception;
}
