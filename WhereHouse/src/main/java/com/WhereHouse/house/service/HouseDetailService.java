package com.WhereHouse.house.service;

import java.util.List;

import com.WhereHouse.house.domain.HouseVO;

public interface HouseDetailService {
	public HouseVO read(int h_no) throws Exception;
	public boolean grade(String m_id, int h_no) throws Exception;
	
	//�Ͽ콺�ɼǸ���Ʈ
	public List<String> selectHouseOption(int h_no) throws Exception;
}
