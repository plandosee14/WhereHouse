package com.WhereHouse.member.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.domain.HousedistanceVO;
import com.WhereHouse.house.domain.locationVO;
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

	@Override
	public String passupdateselect(MemberVO vo) throws Exception {
		return sqlSession.selectOne("member.passupdateselect", vo);
	}

	@Override
	public List<HouseVO> searchHouse(HouseVO vo) throws Exception {
		return sqlSession.selectList("member.selectHouse", vo);
	}

	@Override
	public List<HousedistanceVO> searchnearHouse(locationVO vo) throws Exception {
		return sqlSession.selectList("member.selectnearHouse", vo);
	}


	

}
