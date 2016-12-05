package com.WhereHouse.member.persistence;

import java.util.List;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.domain.HousedistanceVO;
import com.WhereHouse.house.domain.locationVO;
import com.WhereHouse.member.domain.MemberVO;

public interface MemberDAO {
public MemberVO login(MemberVO vo)throws Exception;//로그인
public void register(MemberVO vo)throws Exception;//회원가입
public String findID(MemberVO vo)throws Exception;//아이디찾기
public String findPass(String m_id)throws Exception;//비번찾기
public void updatePass(MemberVO vo)throws Exception;//비번 바꾸기
public String passupdateselect(MemberVO vo)throws Exception;//비번 바꿀 아이디 찾기
public List<HouseVO> searchHouse(HouseVO vo)throws Exception;//집검색
public List<HousedistanceVO> searchnearHouse(locationVO vo)throws Exception;//주변집검색

}
