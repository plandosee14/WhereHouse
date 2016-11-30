package com.WhereHouse.mypage.persistence;

import java.util.List;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.mypage.domain.MyBasketVO;

public interface MypageDAO {

	public List<MyBasketVO> selectMyBasket(String m_id)throws Exception;
	public MemberVO read(int m_no)throws Exception;
	public void update(MemberVO member)throws Exception;
	public void delete(int m_no)throws Exception;
}
