package com.WhereHouse.reservation.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.persistence.HouseDAO;
import com.WhereHouse.reservation.domain.ReservationVO;
import com.WhereHouse.reservation.persistence.ReservationDAO;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Inject
	ReservationDAO rdao;
	


	@Override
	public void insertReservation() throws Exception {
		

	}

	@Override
	public void selectReservationImPossibleDate(int h_no) throws Exception {
		
		

	}

}
