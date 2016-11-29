package com.WhereHouse.admin.service;

import java.util.List;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.member.domain.MemberVO;

public interface AdminService {
	
	public List<MemberVO> selectAllMember()throws Exception;
	public List<HouseVO> selectHouse()throws Exception;
}
