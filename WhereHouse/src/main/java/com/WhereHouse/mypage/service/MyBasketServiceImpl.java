package com.WhereHouse.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.mypage.domain.MyBasketVO;
import com.WhereHouse.mypage.persistence.MyBasketDAO;

@Service
public class MyBasketServiceImpl implements MyBasketService{

	@Inject
	private MyBasketDAO dao;
	
	@Override
	public List<MyBasketVO> listAllById(String m_id) throws Exception {
		
		return dao.selectMyBasket(m_id);
	}

	@Override
	public void removeBasket(int b_no) throws Exception {
		dao.deleteBasket(b_no);
		
	}

}
