package com.WhereHouse.option.persistence;

import java.util.List;

import com.WhereHouse.option.domain.HouseOptionVO;

public interface HouseOptionDAO {
	//하우스옵션추가
	public void insertHouseOption(HouseOptionVO hoption) throws Exception;

	//하우스옵션리스트
	public List<String> selectHouseOption(int h_no) throws Exception;

}
