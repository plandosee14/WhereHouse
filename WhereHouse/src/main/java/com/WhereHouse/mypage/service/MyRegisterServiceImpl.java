package com.WhereHouse.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.mypage.domain.MyRegisterVO;
import com.WhereHouse.mypage.persistence.MyRegisterDAO;

@Service
public class MyRegisterServiceImpl implements MyRegisterService{

	@Inject
	private MyRegisterDAO dao;
	
	@Override
	public List<MyRegisterVO> listAllById(String m_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectMyRegister(m_id);
	}

	
}
