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
	public void updateScore(GradeVO vo) throws Exception {
		sqlSession.update("house.updatescore", vo);
	}

}
