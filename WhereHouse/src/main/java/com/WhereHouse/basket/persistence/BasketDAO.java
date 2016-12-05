package com.WhereHouse.basket.persistence;

import java.util.List;

import com.WhereHouse.basket.domain.BasketVO;
import com.WhereHouse.mypage.domain.MyBasketVO;

public interface BasketDAO {
	public void insertBasket(BasketVO vo)throws Exception;
	public void deleteBasket(int b_no)throws Exception;
	public List<MyBasketVO> listBasketById(String m_id)throws Exception;
	public List<BasketVO> listAllBasket()throws Exception;
}
