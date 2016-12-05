package com.WhereHouse.basket.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.basket.domain.BasketVO;
import com.WhereHouse.mypage.domain.MyBasketVO;

@Repository
public class BasketDAOImpl implements BasketDAO{
	
	@Inject
	private SqlSession sqlSession;

	//장바구니 insert
	@Override
	public void insertBasket(BasketVO vo) throws Exception {
		sqlSession.insert("basket.insertBasket", vo);
	}

	@Override
	public void deleteBasket(int b_no) throws Exception {
		sqlSession.delete("basket.deleteBasket",b_no );
		
	}

	@Override
	public List<MyBasketVO> listBasketById(String m_id) throws Exception {
      for(int i=0; i<sqlSession.selectList("basket.listBasketById", m_id).size();i++){
			
			System.out.println("service 리스트" + sqlSession.selectList("basket.listBasketById", m_id).get(i));
		}
	
		return sqlSession.selectList("basket.listBasketById", m_id);
	}

	@Override
	public List<BasketVO> listAllBasket() throws Exception {
		System.out.println("혹시 여기로 오니???");
		return sqlSession.selectList("basket.listAllBasket");
	}


}
