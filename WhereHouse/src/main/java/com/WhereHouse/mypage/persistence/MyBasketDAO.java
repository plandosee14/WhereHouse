package com.WhereHouse.mypage.persistence;

import java.util.List;

import com.WhereHouse.mypage.domain.MyBasketVO;

public interface MyBasketDAO {
	public List<MyBasketVO> selectMyBasket(String m_id)throws Exception;
	public void deleteBasket(int b_no)throws Exception;
}
