package com.WhereHouse.reservation.persistence;

import com.WhereHouse.reservation.domain.ReservationVO;

public interface ReservationDAO {

	//�����ϱ�
	public void insertReservation() throws Exception;

	//���� ���డ������
	public ReservationVO selectReservation(int h_no) throws Exception;
}
