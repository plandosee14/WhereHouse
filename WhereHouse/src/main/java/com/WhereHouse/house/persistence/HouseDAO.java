package com.WhereHouse.house.persistence;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.reservation.domain.ReservationVO;

public interface HouseDAO {
	//�Ͽ콺�б�
	public HouseVO selectHouseByHno(int h_no)throws Exception;
	
	//�Ͽ콺���
	public void insertHouse(HouseVO vo)throws Exception;
	
	//�ֱ� ����� �Ͽ콺 ã��(option���̺� ���� h_noã��)
	public int selectNewHouseById(String m_id)throws Exception;

	//�Ͽ콺 �Ⱓ(�����) ������Ʈ
	public void updateHouseDays(ReservationVO reservation)throws Exception;
}
