package com.WhereHouse.memberGrade.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.memberGrade.domain.GradeVO;
import com.WhereHouse.memberGrade.persistence.GradeDAO;

@Service
public class GradeServiceImpl implements GradeService {

	@Inject
	private GradeDAO dao;
	
	@Override
	public void updateGrade(GradeVO vo) throws Exception {
		dao.updateScore(vo);
	}

}
