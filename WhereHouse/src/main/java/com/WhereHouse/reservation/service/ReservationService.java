package com.WhereHouse.reservation.service;

public interface ReservationService {
	
	//예약하기
	public void insertReservation() throws Exception;
	//예약불가능한 날짜 가져오기
	public void selectReservationImPossibleDate(int h_no) throws Exception;

}
