package com.WhereHouse.comment.domain;

import java.util.Date;

public class CommentVO {
	private int c_no;
	private int m_no;
	private String m_name;
	private String h_no;
	private String c_content;
	private Date c_regdate;
	private Date c_modifydate;
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getH_no() {
		return h_no;
	}
	public void setH_no(String h_no) {
		this.h_no = h_no;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Date getC_regdate() {
		return c_regdate;
	}
	public void setC_regdate(Date c_regdate) {
		this.c_regdate = c_regdate;
	}
	public Date getC_modifydate() {
		return c_modifydate;
	}
	public void setC_modifydate(Date c_modifydate) {
		this.c_modifydate = c_modifydate;
	}
	@Override
	public String toString() {
		return "CommentVO [c_no=" + c_no + ", m_no=" + m_no + ", m_name=" + m_name + ", h_no=" + h_no + ", c_content="
				+ c_content + ", c_regdate=" + c_regdate + ", c_modifydate=" + c_modifydate + "]";
	}
	
}
