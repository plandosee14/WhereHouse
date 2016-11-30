package com.WhereHouse.mypage.service;

import java.util.List;

import com.WhereHouse.mypage.domain.MyBasketVO;

public interface MypageService {
   public List<MyBasketVO> listAllById(String m_id)throws Exception;
   
}
