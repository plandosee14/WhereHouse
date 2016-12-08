package com.WhereHouse.house.service;

import com.WhereHouse.house.domain.HouseVO;

public interface HouseService {
	
	public void insertHouse(HouseVO vo)throws Exception;
	
	public HouseVO selectHouseByHno(int h_no)throws Exception;

}
