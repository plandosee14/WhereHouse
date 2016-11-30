package com.WhereHouse.mypage.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.mypage.domain.MyBasketVO;

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MyBasketVO> selectMyBasket(String m_id) throws Exception {
		
		return sqlSession.selectList("mypage.selectMyBasket", m_id);
	}

	@Override
	public MemberVO read(int m_no) throws Exception {
		return sqlSession.selectOne("mypage.selectMember", m_no);
	}
	
	@Override
	public void delete(int m_no) throws Exception {
		
		sqlSession.delete("mypage.deleteMember", m_no);
	}
	@Override
	public void update(MemberVO member) throws Exception {
		
		sqlSession.update("mypage.modifyMember", member);
	}



}
