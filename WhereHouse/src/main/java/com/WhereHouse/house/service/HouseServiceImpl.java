package com.WhereHouse.house.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.persistence.HouseDAO;

@Service
public class HouseServiceImpl implements HouseService {

	@Inject
	HouseDAO dao;
	
	@Override
	public void insertHouse(HouseVO vo)throws Exception{
		dao.insertHouse(vo);

	}

	@Override
	public HouseVO selectHouseByHno(int h_no)throws Exception{
		return dao.selectHouseByHno(h_no);
	}

}
