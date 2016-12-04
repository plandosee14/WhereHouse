package com.WhereHouse.mypage.service;

import java.util.List;

import com.WhereHouse.mypage.domain.MyRegisterVO;

public interface MyRegisterService {
	public List<MyRegisterVO> listAllById(String m_id)throws Exception;
}
