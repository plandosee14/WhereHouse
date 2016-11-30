package com.WhereHouse.house.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.persistence.HouseDetailDAO;

public interface HouseDetailService {
	public HouseVO read(int h_no) throws Exception;
}
