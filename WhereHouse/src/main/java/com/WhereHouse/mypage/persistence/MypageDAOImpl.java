package com.WhereHouse.mypage.persistence;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.memberGrade.domain.MemberGradeVO;
import com.WhereHouse.mypage.domain.MyBasketVO;

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Inject
	private SqlSession sqlSession;


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
	public void insertGrade(MemberGradeVO grade) throws Exception {
		sqlSession.insert("mypage.insertGrade", grade);
		
	}

	@Override
	public boolean selectGrade(int r_no) throws Exception {
		int cnt = sqlSession.selectOne("mypage.selectGrade",r_no);
		if(cnt>0){
			return true;
		}
		return false;
	}



}
