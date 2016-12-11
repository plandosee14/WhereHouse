package com.WhereHouse.reservation.persistence;

import java.util.List;

import com.WhereHouse.reservation.domain.ReservationDateVO;
import com.WhereHouse.reservation.domain.ReservationVO;

public interface ReservationDAO {

	//예약하기
	public void insertReservation(ReservationVO reservation) throws Exception;

	//집의 예약가져오기
	public List<ReservationVO> selectReservation(int h_no) throws Exception;
	
	//예약불가능한 날짜 가져오기
	public List<ReservationDateVO> selectReservationDate(int h_no) throws Exception;
}
