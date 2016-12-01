package com.WhereHouse.mypage.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.mypage.domain.MyReservationVO;

@Repository
public class MyReservationDAOImpl implements MyReservaionDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MyReservationVO> selectMyReservation(String m_id) throws Exception {
		System.out.println("´Ù¿À m_id="+m_id);
		return sqlSession.selectList("mypage.selectReservationById",m_id);
	}

}
