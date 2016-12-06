package com.WhereHouse.reservation.persistence;

import com.WhereHouse.reservation.domain.ReservationVO;

public interface ReservationDAO {

	//예약하기
	public void insertReservation() throws Exception;

	//집의 예약가져오기
	public ReservationVO selectReservation(int h_no) throws Exception;
}
