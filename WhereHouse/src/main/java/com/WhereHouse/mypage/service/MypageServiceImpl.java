package com.WhereHouse.mypage.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.memberGrade.domain.MemberGradeVO;
import com.WhereHouse.mypage.domain.MyBasketVO;
import com.WhereHouse.mypage.persistence.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Inject
	private MypageDAO dao;

	@Override
	public MemberVO read(String m_id) throws Exception {
		return dao.read(m_id);
	}
	
	@Override
	public void modify(MemberVO member) throws Exception {
		dao.update(member);
		
	}

	@Override
	public void remove(String m_id) throws Exception {
		dao.delete(m_id);
	}

	@Override
	public void insertGrade(MemberGradeVO grade) throws Exception {
		dao.insertGrade(grade);
		
	}

	@Override
	public boolean selectGrade(int r_no) throws Exception {
		
		return dao.selectGrade(r_no);
	}

 
}
