package com.WhereHouse.mypage.persistence;

import java.util.List;

import com.WhereHouse.mypage.domain.MyRegisterVO;

public interface MyRegisterDAO {
	public List<MyRegisterVO> selectMyRegister(String m_id)throws Exception;
}
