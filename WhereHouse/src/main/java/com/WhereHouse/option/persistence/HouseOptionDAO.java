package com.WhereHouse.option.persistence;

import java.util.List;

import com.WhereHouse.option.domain.HouseOptionVO;

public interface HouseOptionDAO {
	//�Ͽ콺�ɼ��߰�
	public void insertHouseOption(HouseOptionVO hoption) throws Exception;

	//�Ͽ콺�ɼǸ���Ʈ
	public List<String> selectHouseOption(int h_no) throws Exception;

}
