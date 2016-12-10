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
	
	@Override
	public void insertGrade(GradeVO vo) throws Exception {
		System.out.println(vo.getM_id());
		dao.createScorehouse(vo);
		dao.updateScorehouse(vo);
		dao.updaterGrade(vo);
	}
}
