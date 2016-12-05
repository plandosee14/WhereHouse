package com.WhereHouse.house.service;

import com.WhereHouse.house.domain.HouseVO;

public interface HouseDetailService {
	public HouseVO read(int h_no) throws Exception;
	public boolean grade(String m_id, int h_no) throws Exception;
}
