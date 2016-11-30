package com.WhereHouse.house.persistence;

import com.WhereHouse.house.domain.HouseVO;

public interface HouseDAO {
	public void selectHouseByHno(int h_no)throws Exception;
	
	public void insertHouse(HouseVO vo)throws Exception;
	
}
