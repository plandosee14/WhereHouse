package com.WhereHouse.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.mypage.domain.MyReservationVO;
import com.WhereHouse.mypage.persistence.MyReservaionDAO;

@Service
public class MyReservationServiceImpl implements MyReservationService{

	@Inject
	private MyReservaionDAO dao;
	
	@Override
	public List<MyReservationVO> listAllById(String m_id) throws Exception {
		System.out.println("¼­ºñ½º m_id="+m_id);
		return dao.selectMyReservation(m_id);
	}

}
