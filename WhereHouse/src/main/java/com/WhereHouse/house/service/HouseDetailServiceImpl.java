package com.WhereHouse.house.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.persistence.HouseDetailDAO;

@Service
public class HouseDetailServiceImpl implements HouseDetailService {

	@Inject
	private HouseDetailDAO dao;
	
	@Override
	public HouseVO read(int h_no) throws Exception {
		return dao.read(h_no);
	}

	@Override
	public boolean grade(String m_id, int h_no) throws Exception {
		return dao.selectHouseReservation(m_id,h_no);
	}

}
