package com.WhereHouse.mypage.service;

import java.util.List;

import com.WhereHouse.mypage.domain.MyReservationVO;

public interface MyReservationService {
	public List<MyReservationVO> listAllById(String m_id)throws Exception;
}
