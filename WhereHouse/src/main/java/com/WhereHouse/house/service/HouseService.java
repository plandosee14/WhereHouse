package com.WhereHouse.house.service;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.option.domain.HouseOptionVO;

public interface HouseService {
	
	public void insertHouse(HouseVO vo)throws Exception;
	
	public HouseVO selectHouseByHno(int h_no)throws Exception;
	
	//최근 등록한 하우스 찾기(option테이블에 넣을 h_no찾기)
	public int selectNewHouseById(String m_id)throws Exception;
	
	//하우스 옵션 등록
	public void insertHouseOption(HouseOptionVO hoption)throws Exception;
	

}
