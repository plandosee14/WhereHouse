package com.WhereHouse.mypage.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.mypage.domain.MyRegisterVO;

@Repository
public class MyRegisterDAOImpl implements MyRegisterDAO{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<MyRegisterVO> selectMyRegister(String m_id) throws Exception {
		return sqlSession.selectList("mypage.selectRegisterById",m_id);
	}

	@Override
	public List<MyRegisterVO> selectMyEstimate(String m_id) throws Exception {
		return sqlSession.selectList("mypage.selectEstimateById", m_id);
	}

	@Override
	public void updateScore(MemberVO member) throws Exception {
		sqlSession.update("mypage.modifyScore", member);
		
	}
}
