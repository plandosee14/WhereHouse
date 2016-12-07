package com.WhereHouse.mypage.persistence;

import com.WhereHouse.member.domain.MemberVO;

public interface MyPassDAO {

	public int selectPass(MemberVO vo)throws Exception;
}
