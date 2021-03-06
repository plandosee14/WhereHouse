package com.WhereHouse.house.persistence;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.reservation.domain.ReservationVO;

public interface HouseDAO {
	//하우스읽기
	public HouseVO selectHouseByHno(int h_no)throws Exception;
	
	//하우스등록
	public void insertHouse(HouseVO vo)throws Exception;
	
	//최근 등록한 하우스 찾기(option테이블에 넣을 h_no찾기)
	public int selectNewHouseById(String m_id)throws Exception;

	//하우스 기간(예약시) 업데이트
	public void updateHouseDays(ReservationVO reservation)throws Exception;
}
