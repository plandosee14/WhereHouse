package com.WhereHouse.admin.persistence;

import java.util.List;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.member.domain.MemberVO;

public interface AdminDAO {
	public List<MemberVO> selectAllMember()throws Exception;
	public List<HouseVO> selectHouse()throws Exception;

}
