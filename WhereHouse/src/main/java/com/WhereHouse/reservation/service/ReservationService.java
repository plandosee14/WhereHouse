package com.WhereHouse.reservation.service;

import java.util.Date;
import java.util.List;

public interface ReservationService {
	
	//예약하기
	public void insertReservation() throws Exception;
	//예약불가능한 날짜 가져오기
	public List<String> selectReservationImPossibleDate(int h_no) throws Exception;

}
