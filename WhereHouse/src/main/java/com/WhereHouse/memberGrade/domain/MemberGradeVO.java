package com.WhereHouse.memberGrade.domain;

public class MemberGradeVO {
	private int r_no;
	private String m_id;
	private int g_score;
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getG_score() {
		return g_score;
	}
	public void setG_score(int g_score) {
		this.g_score = g_score;
	}
	@Override
	public String toString() {
		return "MemberGradeVO [r_no=" + r_no + ", m_id=" + m_id + ", g_score=" + g_score + "]";
	}
	
	
	

}
