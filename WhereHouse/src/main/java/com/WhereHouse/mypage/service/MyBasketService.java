package com.WhereHouse.mypage.service;

import java.util.List;

import com.WhereHouse.mypage.domain.MyBasketVO;

public interface MyBasketService {
	public List<MyBasketVO> listAllById(String m_id)throws Exception;
	public void removeBasket(int b_no)throws Exception;
}
