package com.WhereHouse.memberGrade.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.memberGrade.domain.GradeVO;

@Repository
public class GradeDAOImpl implements GradeDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void createScorehouse(GradeVO vo) throws Exception {
		sqlSession.insert("house.gradescoreHouse", vo);
	}

	@Override
	public void updateScorehouse(GradeVO vo) throws Exception {
		sqlSession.update("house.updatescoreHouse", vo);		
	}

	@Override
	public void allScorehouse(GradeVO vo) throws Exception {
		sqlSession.update("house.allscoreHouse", vo);
	}

}
