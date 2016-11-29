package com.WhereHouse.mypage.persistence;

import java.util.List;

import com.WhereHouse.mypage.domain.MyBasketVO;

public interface MypageDAO {

	public List<MyBasketVO> selectMyBasket(String m_id)throws Exception;
}
