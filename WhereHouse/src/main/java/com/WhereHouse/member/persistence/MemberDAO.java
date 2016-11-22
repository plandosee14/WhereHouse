package com.WhereHouse.member.persistence;

import com.WhereHouse.member.domain.MemberVO;

public interface MemberDAO {
public MemberVO login(MemberVO vo)throws Exception;//로그인
public void register(MemberVO vo)throws Exception;//회원가입
public String findID()throws Exception;//아이디찾기
public void findPass()throws Exception;//비밀번호찾기
}
