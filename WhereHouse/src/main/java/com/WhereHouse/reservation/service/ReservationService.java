package com.WhereHouse.reservation.service;

import java.util.Date;
import java.util.List;

import com.WhereHouse.reservation.domain.ReservationVO;

public interface ReservationService {
	
	//�����ϱ�
	public void insertReservation(ReservationVO reservation) throws Exception;
	//����Ұ����� ��¥ ��������
	public List<String> selectReservationImPossibleDate(int h_no) throws Exception;

}
