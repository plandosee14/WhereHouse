package com.WhereHouse.house.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.house.domain.HouseVO;

@Repository
public class HouseDetailDAOImpl implements HouseDetailDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public HouseVO read(int h_no) throws Exception {
		return sqlSession.selectOne("house.selectHouseByHno", h_no);
	}

}
