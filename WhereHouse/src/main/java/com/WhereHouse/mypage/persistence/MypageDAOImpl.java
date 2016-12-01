package com.WhereHouse.mypage.persistence;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	public MemberVO read(String m_id) throws Exception {
		return sqlSession.selectOne("mypage.selectMember", m_id);
	}
	
	@Override
	public void delete(String m_id) throws Exception {
		
		sqlSession.delete("mypage.deleteMember", m_id);
	}
	@Override
	public void update(MemberVO member) throws Exception {
		
		sqlSession.update("mypage.modifyMember", member);
	}

	@Override
	public void deleteBasket(int b_no) throws Exception {
		sqlSession.delete("mypage.deleteMyBasket", b_no);
		
	}



}
