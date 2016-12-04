package com.WhereHouse.mypage.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.mypage.domain.MyRegisterVO;

@Repository
public class MyRegisterDAOImpl implements MyRegisterDAO{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<MyRegisterVO> selectMyRegister(String m_id) throws Exception {
		return sqlSession.selectList("mypage.selectRegisterById",m_id);
	}
}
