package com.WhereHouse.memberGrade.persistence;

import com.WhereHouse.memberGrade.domain.GradeVO;

public interface GradeDAO {
	public void updateScore(GradeVO vo)throws Exception;
}
