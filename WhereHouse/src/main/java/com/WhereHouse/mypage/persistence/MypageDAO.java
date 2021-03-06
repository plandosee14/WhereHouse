package com.WhereHouse.mypage.persistence;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.memberGrade.domain.MemberGradeVO;
import com.WhereHouse.mypage.domain.MyBasketVO;

public interface MypageDAO {

	public MemberVO read(String m_id)throws Exception;
	public void update(MemberVO member)throws Exception;
	public void delete(String m_id)throws Exception;
	public void insertGrade(MemberGradeVO grade)throws Exception;
	public boolean selectGrade(int r_no)throws Exception;

}
