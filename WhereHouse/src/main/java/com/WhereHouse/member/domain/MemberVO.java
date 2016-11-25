package com.WhereHouse.member.domain;

import java.util.Date;

public class MemberVO {
	private String m_id;
	private int m_no;
	private String m_name;
	private String m_pass;
	private String m_phone;
	private int m_score;
	private Date m_regdate;
	private Date m_dropdate;
	private int m_scorecnt;
	
	public MemberVO() {
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public int getM_score() {
		return m_score;
	}
	public void setM_score(int m_score) {
		this.m_score = m_score;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	public Date getM_dropdate() {
		return m_dropdate;
	}
	public void setM_dropdate(Date m_dropdate) {
		this.m_dropdate = m_dropdate;
	}
	public int getM_scorecnt() {
		return m_scorecnt;
	}
	public void setM_scorecnt(int m_scorecnt) {
		this.m_scorecnt = m_scorecnt;
	}
	public MemberVO(String m_id, int m_no, String m_name, String m_pass, String m_phone, int m_score, Date m_regdate,
			Date m_dropdate, int m_scorecnt) {
		super();
		this.m_id = m_id;
		this.m_no = m_no;
		this.m_name = m_name;
		this.m_pass = m_pass;
		this.m_phone = m_phone;
		this.m_score = m_score;
		this.m_regdate = m_regdate;
		this.m_dropdate = m_dropdate;
		this.m_scorecnt = m_scorecnt;
	}
	@Override
	public String toString() {
		return "MemberVO [m_id=" + m_id + ", m_no=" + m_no + ", m_name=" + m_name + ", m_pass=" + m_pass + ", m_phone="
				+ m_phone + ", m_score=" + m_score + ", m_regdate=" + m_regdate + ", m_dropdate=" + m_dropdate
				+ ", m_scorecnt=" + m_scorecnt + "]";
	}

	
}
