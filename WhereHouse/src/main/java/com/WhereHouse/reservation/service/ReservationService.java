package com.WhereHouse.reservation.service;

import java.util.Date;
import java.util.List;

public interface ReservationService {
	
	//�����ϱ�
	public void insertReservation() throws Exception;
	//����Ұ����� ��¥ ��������
	public List<String> selectReservationImPossibleDate(int h_no) throws Exception;

}
