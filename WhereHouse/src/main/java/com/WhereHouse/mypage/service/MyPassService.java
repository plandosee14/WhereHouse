package com.WhereHouse.mypage.service;

import com.WhereHouse.member.domain.MemberVO;

public interface MyPassService {
	public int selectPassword(MemberVO vo)throws Exception;
}
