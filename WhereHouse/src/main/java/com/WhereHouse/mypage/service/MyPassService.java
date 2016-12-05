package com.WhereHouse.mypage.service;

import com.WhereHouse.member.domain.MemberVO;

public interface MyPassService {
	public MemberVO selectPassword(MemberVO vo)throws Exception;
}
