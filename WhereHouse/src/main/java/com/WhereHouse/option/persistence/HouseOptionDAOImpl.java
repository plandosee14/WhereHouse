package com.WhereHouse.option.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.option.domain.HouseOptionVO;

@Repository
public class HouseOptionDAOImpl implements HouseOptionDAO {

	
	SqlSession sqlSession;
	

	@Override
	public void insertHouseOption(HouseOptionVO hoption) throws Exception {
		sqlSession.insert("hoption.insertHouseOption", hoption);		
	}


	@Override
	public List<String> selectHouseOption(int h_no) throws Exception {
		
		return sqlSession.selectList("hoption.insertHouseOption", h_no);
	}




}
