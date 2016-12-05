package com.WhereHouse.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.admin.persistence.AdminDAO;
import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.reservation.domain.ReservationVO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	AdminDAO adminDAO;

	@Override
	public List<MemberVO> selectAllMember() throws Exception {
		return adminDAO.selectAllMember();
	}

	@Override
	public List<HouseVO> selectHouse() throws Exception {
		return adminDAO.selectHouse();
	}

	@Override
	public List<ReservationVO> selectReservation() throws Exception {
		return adminDAO.selectReservation();
	}
	
	

}
