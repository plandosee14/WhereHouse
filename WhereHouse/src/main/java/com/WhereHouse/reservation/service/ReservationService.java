package com.WhereHouse.reservation.service;

public interface ReservationService {
	
	//�����ϱ�
	public void insertReservation() throws Exception;
	//����Ұ����� ��¥ ��������
	public void selectReservationImPossibleDate(int h_no) throws Exception;

}
