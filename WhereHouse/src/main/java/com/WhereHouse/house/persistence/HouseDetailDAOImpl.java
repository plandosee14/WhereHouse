package com.WhereHouse.house.persistence;

import java.util.HashMap;
import java.util.Map;

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
	@Override
	public boolean selectHouseReservation(String m_id, int h_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("h_no", h_no);
		int cnt = sqlSession.selectOne("house.selectHouseReservation", map);
		if(cnt==0){
			return true;
		}else{
			return false;
		}
		
	}
	@Override
	public void updateScore(int h_no) throws Exception {
		sqlSession.update("house.updatescoreHouse", h_no);
	}



}
