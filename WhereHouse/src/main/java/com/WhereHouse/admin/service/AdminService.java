package com.WhereHouse.admin.service;

import java.util.List;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.reservation.domain.ReservationVO;

public interface AdminService {
	
	public List<MemberVO> selectAllMember()throws Exception;
	public List<HouseVO> selectHouse()throws Exception;
	public List<ReservationVO> selectReservation()throws Exception;
}
