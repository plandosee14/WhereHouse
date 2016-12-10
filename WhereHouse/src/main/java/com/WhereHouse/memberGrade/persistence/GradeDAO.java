package com.WhereHouse.memberGrade.persistence;

import com.WhereHouse.memberGrade.domain.GradeVO;

public interface GradeDAO {
	public void createScorehouse(GradeVO vo)throws Exception;
	public void updateScorehouse(GradeVO vo)throws Exception;
	public void updaterGrade(GradeVO vo)throws Exception;
}
