package com.WhereHouse.mypage.persistence;

import java.util.List;

import com.WhereHouse.mypage.domain.MyReservationVO;

public interface MyReservaionDAO {
	public List<MyReservationVO> selectMyReservation(String m_id)throws Exception;
}
