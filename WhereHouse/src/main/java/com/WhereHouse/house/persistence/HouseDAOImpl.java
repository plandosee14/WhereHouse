package com.WhereHouse.house.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.house.domain.HouseVO;

@Repository
public class HouseDAOImpl implements HouseDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insertHouse(HouseVO vo) throws Exception {
		sqlSession.insert("house.insertHouse", vo);
		
	}
	@Override
	public HouseVO selectHouseByHno(int h_no) throws Exception {
		return sqlSession.selectOne("house.selectHouseByHno", h_no);
	}
	
	
	@Override
	public int selectNewHouseById(String m_id) throws Exception {
		
		return sqlSession.selectOne("house.selectNewHouseById", m_id);
	}

}
