package com.WhereHouse.member.service;

import com.WhereHouse.member.domain.MemberVO;

public interface MemberService {
	public MemberVO login(MemberVO vo)throws Exception;//로그인
	public void register(MemberVO vo)throws Exception;//회원가입
	public String findID(MemberVO vo)throws Exception;//아이디찾기
	public String findPass(MemberVO vo)throws Exception;//비번찾기
	public String checkID(String m_id)throws Exception;//이메일 체크(인증)
}
