package com.WhereHouse.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.mypage.domain.MyBasketVO;
import com.WhereHouse.mypage.persistence.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Inject
	private MypageDAO dao;

	@Override
	public List<MyBasketVO> listAllById(String m_id) throws Exception {
		return dao.selectMyBasket(m_id);
	}


 
}
