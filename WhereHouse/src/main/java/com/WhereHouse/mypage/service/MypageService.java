package com.WhereHouse.mypage.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.mypage.domain.MyBasketVO;

public interface MypageService {
   
   public MemberVO read(String m_id)throws Exception;
   public void modify(MemberVO member)throws Exception; 
   public void remove(String m_id)throws Exception;
   public void removeBasket(int b_no)throws Exception;
}