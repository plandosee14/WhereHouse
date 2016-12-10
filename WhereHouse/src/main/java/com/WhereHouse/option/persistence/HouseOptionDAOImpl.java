package com.WhereHouse.option.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.option.domain.HouseOptionVO;

@Repository
public class HouseOptionDAOImpl implements HouseOptionDAO {

	@Inject
	SqlSession sqlSession;
	
	//하우스옵션 넣기
	@Override
	public void insertHouseOption(HouseOptionVO hoption) throws Exception {
		sqlSession.insert("hoption.insertHouseOption", hoption);		
	}


	//하우스옵션 불러오기
	@Override
	public List<String> selectHouseOption(int h_no) throws Exception {
		return sqlSession.selectList("hoption.selectHouseOption", h_no);
	}




}
