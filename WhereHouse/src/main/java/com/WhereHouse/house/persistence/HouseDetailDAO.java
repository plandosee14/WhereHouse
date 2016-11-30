package com.WhereHouse.house.persistence;

import com.WhereHouse.house.domain.HouseVO;

public interface HouseDetailDAO {
	public HouseVO read(int h_no) throws Exception;
}
