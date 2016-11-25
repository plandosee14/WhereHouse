package com.WhereHouse.basket.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.basket.domain.BasketVO;

@Repository
public class BasketDAOImpl implements BasketDAO{
	
	@Inject
	private SqlSession sqlSession;

	//장바구니 insert
	@Override
	public void insertBasket(BasketVO vo) throws Exception {
		sqlSession.insert("basket.insertBasket", vo);
	}

}
