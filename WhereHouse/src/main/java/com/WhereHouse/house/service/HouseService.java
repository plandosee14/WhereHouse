package com.WhereHouse.house.service;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.option.domain.HouseOptionVO;

public interface HouseService {
	
	public void insertHouse(HouseVO vo)throws Exception;
	
	public HouseVO selectHouseByHno(int h_no)throws Exception;
	
	//�ֱ� ����� �Ͽ콺 ã��(option���̺� ���� h_noã��)
	public int selectNewHouseById(String m_id)throws Exception;
	
	//�Ͽ콺 �ɼ� ���
	public void insertHouseOption(HouseOptionVO hoption)throws Exception;
	

}
