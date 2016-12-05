package com.WhereHouse.basket.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.basket.domain.BasketVO;
import com.WhereHouse.basket.persistence.BasketDAO;
import com.WhereHouse.mypage.domain.MyBasketVO;

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
	public List<MyBasketVO> listAllById(String m_id) throws Exception {
		for(int i=0; i<dao.listBasketById(m_id).size();i++){
			
			System.out.println("service ¸®½ºÆ®" + dao.listBasketById(m_id).get(i));
		}
		return dao.listBasketById(m_id);
	}


	@Override
	public List<BasketVO> listAll() throws Exception {
		return dao.listAllBasket();
	}


}
