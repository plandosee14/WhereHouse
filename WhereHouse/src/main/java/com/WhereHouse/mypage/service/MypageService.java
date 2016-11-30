package com.WhereHouse.mypage.service;

import java.util.List;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.mypage.domain.MyBasketVO;

public interface MypageService {
   public List<MyBasketVO> listAllById(String m_id)throws Exception;
   public MemberVO read(int m_no)throws Exception;
   public void modify(MemberVO member)throws Exception; 
   public void remove(int m_no)throws Exception;
}