package com.WhereHouse.basket.service;

import java.util.List;

import com.WhereHouse.basket.domain.BasketVO;
import com.WhereHouse.mypage.domain.MyBasketVO;

public interface BasketService {

	public void read(BasketVO vo)throws Exception;
	public void remove(int b_no)throws Exception;
	public List<BasketVO> listAll()throws Exception;
	public List<MyBasketVO> listAllById(String m_id)throws Exception;
}
