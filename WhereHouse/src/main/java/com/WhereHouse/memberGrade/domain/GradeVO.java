package com.WhereHouse.memberGrade.domain;

public class GradeVO {
	private int h_no;
	private int r_no;
	private int g_rightscore;
	private int g_cleanscore;
	private int g_checkscore;
	private int g_commuscore;
	private String m_id;
	
	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public GradeVO() {
	}
	
	public int getH_no() {
		return h_no;
	}
	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getG_rightscore() {
		return g_rightscore;
	}
	public void setG_rightscore(int g_rightscore) {
		this.g_rightscore = g_rightscore;
	}
	public int getG_cleanscore() {
		return g_cleanscore;
	}
	public void setG_cleanscore(int g_cleanscore) {
		this.g_cleanscore = g_cleanscore;
	}
	public int getG_checkscore() {
		return g_checkscore;
	}
	public void setG_checkscore(int g_checkscore) {
		this.g_checkscore = g_checkscore;
	}
	public int getG_commuscore() {
		return g_commuscore;
	}
	public void setG_commuscore(int g_commuscore) {
		this.g_commuscore = g_commuscore;
	}

	@Override
	public String toString() {
		return "GradeVO [h_no=" + h_no + ", r_no=" + r_no + ", g_rightscore=" + g_rightscore + ", g_cleanscore="
				+ g_cleanscore + ", g_checkscore=" + g_checkscore + ", g_commuscore=" + g_commuscore + ", m_id=" + m_id
				+ "]";
	}

	public GradeVO(int h_no, int r_no, int g_rightscore, int g_cleanscore, int g_checkscore, int g_commuscore,
			String m_id) {
		super();
		this.h_no = h_no;
		this.r_no = r_no;
		this.g_rightscore = g_rightscore;
		this.g_cleanscore = g_cleanscore;
		this.g_checkscore = g_checkscore;
		this.g_commuscore = g_commuscore;
		this.m_id = m_id;
	}
	
	
}
