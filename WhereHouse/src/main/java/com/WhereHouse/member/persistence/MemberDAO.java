package com.WhereHouse.member.persistence;

import com.WhereHouse.member.domain.MemberVO;

public interface MemberDAO {
public MemberVO login(MemberVO vo)throws Exception;//로그인
public void register(MemberVO vo)throws Exception;//회원가입
public String findID(MemberVO vo)throws Exception;//아이디찾기
public String findPass(String m_id)throws Exception;//비번찾기
public void updatePass(MemberVO vo)throws Exception;//비번 바꾸기
}
