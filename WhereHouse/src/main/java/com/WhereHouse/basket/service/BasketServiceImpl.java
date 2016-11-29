package com.WhereHouse.basket.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.basket.domain.BasketVO;
import com.WhereHouse.basket.persistence.BasketDAO;

@Service
public class BasketServiceImpl implements BasketService{
	
	@Inject
	private BasketDAO dao;

	@Override
	public void read(BasketVO vo) throws Exception {
		dao.insertBasket(vo);
	}


	@Override
	public void remove(int b_no) throws Exception {
		dao.deleteBasket(b_no);
		
	}

	@Override
	public List<BasketVO> listAllById(String m_id) throws Exception {
		return dao.listBasketById(m_id);
	}


	@Override
	public List<BasketVO> listAll() throws Exception {
		return dao.listAllBasket();
	}


}
