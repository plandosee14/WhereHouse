package com.WhereHouse.reservation.persistence;

import java.util.List;

import com.WhereHouse.reservation.domain.ReservationDateVO;
import com.WhereHouse.reservation.domain.ReservationVO;

public interface ReservationDAO {

	//�����ϱ�
	public void insertReservation(ReservationVO reservation) throws Exception;

	//���� ���డ������
	public List<ReservationVO> selectReservation(int h_no) throws Exception;
	
	//����Ұ����� ��¥ ��������
	public List<ReservationDateVO> selectReservationDate(int h_no) throws Exception;
}
