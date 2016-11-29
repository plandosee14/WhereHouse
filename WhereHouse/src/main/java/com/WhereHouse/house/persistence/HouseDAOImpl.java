package com.WhereHouse.house.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class HouseDAOImpl implements HouseDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void selectHouseByHno(int h_no) throws Exception {
		sqlSession.selectOne("house.selectHouseByHno", h_no);
	}

}
