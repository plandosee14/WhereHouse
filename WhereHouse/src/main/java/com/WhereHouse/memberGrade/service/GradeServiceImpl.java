package com.WhereHouse.memberGrade.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.WhereHouse.memberGrade.domain.GradeVO;
import com.WhereHouse.memberGrade.persistence.GradeDAO;

@Service
public class GradeServiceImpl implements GradeService {

	@Inject
	private GradeDAO dao;
	
	@Transactional
	@Override
	public void updateGrade(GradeVO vo) throws Exception {
		dao.updateScorehouse(vo);
		dao.createScorehouse(vo);
		dao.allScorehouse(vo);
	}

}
