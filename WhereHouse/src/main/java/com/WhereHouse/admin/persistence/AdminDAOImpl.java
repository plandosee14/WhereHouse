package com.WhereHouse.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.reservation.domain.ReservationVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemberVO> selectAllMember() throws Exception {
		return sqlSession.selectList("admin.selectAllMember");
	}

	@Override
	public List<HouseVO> selectHouse() throws Exception {
		return sqlSession.selectList("admin.selectHouse");
	}

	@Override
	public List<ReservationVO> selectReservation() throws Exception {
		return sqlSession.selectList("admin.selectReservation");
	}

}
