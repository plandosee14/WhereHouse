package com.WhereHouse.reservation.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.reservation.domain.ReservationDateVO;
import com.WhereHouse.reservation.domain.ReservationVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	
	@Inject
	private SqlSession sqlSession;
	//예약하기
	@Override
	public void insertReservation() throws Exception {
		// TODO Auto-generated method stub

	}

	//하우스의 예약목록 가져오기
	@Override
	public List<ReservationVO> selectReservation(int h_no) throws Exception {
		
		return sqlSession.selectList("reservation.selectReservationByHno",h_no);
	}

	//하우스의 예약불가능한 날짜 가져오기
	@Override
	public List<ReservationDateVO> selectReservationDate(int h_no) throws Exception {
		
		return sqlSession.selectList("reservation.selectReservationDate", h_no);
	}
	


}
