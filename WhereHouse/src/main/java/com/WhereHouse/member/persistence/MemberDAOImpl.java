package com.WhereHouse.member.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.member.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sqlSession.selectOne("member.login", vo);
	}

	@Override
	public void register(MemberVO vo) throws Exception {
		sqlSession.insert("member.registerAccount", vo);
	}

	@Override
	public String findID(MemberVO vo) throws Exception {
		return sqlSession.selectOne("member.findID", vo);
	}

	@Override
	public String findPass(String m_id) throws Exception {
		return sqlSession.selectOne("member.findPass", m_id);
	}

	@Override
	public void updatePass(MemberVO vo) throws Exception {
		sqlSession.update("member.updatePass", vo);
	}

}
