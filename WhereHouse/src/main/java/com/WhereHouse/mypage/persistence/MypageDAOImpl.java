package com.WhereHouse.mypage.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.mypage.domain.MyBasketVO;

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MyBasketVO> selectMyBasket(String m_id) throws Exception {
		
		return sqlSession.selectList("mypage.selectMyBasket", m_id);
	}

}
