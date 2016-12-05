package com.WhereHouse.admin.persistence;

import java.util.List;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.reservation.domain.ReservationVO;

public interface AdminDAO {
	public List<MemberVO> selectAllMember()throws Exception;
	public List<HouseVO> selectHouse()throws Exception;
	public List<ReservationVO> selectReservation()throws Exception;

}
