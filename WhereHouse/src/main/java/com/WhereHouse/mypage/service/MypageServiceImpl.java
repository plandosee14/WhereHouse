package com.WhereHouse.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.mypage.domain.MyBasketVO;
import com.WhereHouse.mypage.persistence.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Inject
	private MypageDAO dao;

	@Override
	public List<MyBasketVO> listAllById(String m_id) throws Exception {
		return dao.selectMyBasket(m_id);
	}

	@Override
	public MemberVO read(int m_no) throws Exception {
		return dao.read(m_no);
	}
	
	@Override
	public void modify(MemberVO member) throws Exception {
		dao.update(member);
		
	}

	@Override
	public void remove(int m_no) throws Exception {
		dao.delete(m_no);
	}


 
 
}
