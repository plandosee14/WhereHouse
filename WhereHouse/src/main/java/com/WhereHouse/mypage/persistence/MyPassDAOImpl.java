package com.WhereHouse.mypage.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.member.domain.MemberVO;

@Repository
public class MyPassDAOImpl implements MyPassDAO{

	@Inject
	private SqlSession sqlSession;

	@Override
	public int selectPass(MemberVO vo) throws Exception {
		return sqlSession.selectOne("mypage.selectPassword", vo);
	}




}
