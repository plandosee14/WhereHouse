package com.WhereHouse.mypage.domain;

import java.util.Date;

public class MyRegisterVO {
	
	private String h_thumnail;
	private String m_id;
	private String m_name;
	private String m_phone;
	private Date r_startdate;
	private Date r_enddate;
	private int r_peoplecnt;
	private int r_no;
	private int h_no;

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
	public String getH_thumnail() {
		return h_thumnail;
	}
	public void setH_thumnail(String h_thumnail) {
		this.h_thumnail = h_thumnail;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public Date getR_startdate() {
		return r_startdate;
	}
	public void setR_startdate(Date r_startdate) {
		this.r_startdate = r_startdate;
	}
	public Date getR_enddate() {
		return r_enddate;
	}
	public void setR_enddate(Date r_enddate) {
		this.r_enddate = r_enddate;
	}
	public int getR_peoplecnt() {
		return r_peoplecnt;
	}
	public void setR_peoplecnt(int r_peoplecnt) {
		this.r_peoplecnt = r_peoplecnt;
	}
	@Override
	public String toString() {
		return "MyRegisterVO [h_thumnail=" + h_thumnail + ", m_id=" + m_id + ", m_name=" + m_name + ", m_phone="
				+ m_phone + ", r_startdate=" + r_startdate + ", r_enddate=" + r_enddate + ", r_peoplecnt=" + r_peoplecnt
				+ ", r_no=" + r_no + ", h_no=" + h_no + "]";
	}
	
	
}
