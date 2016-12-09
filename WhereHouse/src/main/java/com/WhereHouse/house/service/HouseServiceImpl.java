package com.WhereHouse.house.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.persistence.HouseDAO;
import com.WhereHouse.option.domain.HouseOptionVO;
import com.WhereHouse.option.persistence.HouseOptionDAO;

@Service
public class HouseServiceImpl implements HouseService {

	@Inject
	HouseDAO dao;
	
	@Inject
	HouseOptionDAO odao;
	
	@Override
	public void insertHouse(HouseVO vo)throws Exception{
		dao.insertHouse(vo);

	}

	@Override
	public HouseVO selectHouseByHno(int h_no)throws Exception{
		return dao.selectHouseByHno(h_no);
	}

	@Override
	public int selectNewHouseById(String m_id) throws Exception {
		
		return dao.selectNewHouseById(m_id);
	}

	@Override
	public void insertHouseOption(HouseOptionVO hoption) throws Exception {
		odao.insertHouseOption(hoption);
		
	}
	
	

}
