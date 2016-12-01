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
		sqlSession.insert("house.insert", vo);
		
	}
	@Override
	public void selectHouseByHno(int h_no) throws Exception {
		sqlSession.selectOne("house.selectHouseByHno", h_no);
	}



}
