package com.WhereHouse.mypage.domain;

import java.util.Date;

public class MyReservationVO {
	private int r_no;
	private int h_no;
	private String m_id;
	private Date r_startdate;
	private Date r_enddate;
	private int r_fare;
	private int r_peoplecnt;
	private String h_thumnail;
	private String m_phone;
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getH_no() {
		return h_no;
	}
	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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
	public int getR_fare() {
		return r_fare;
	}
	public void setR_fare(int r_fare) {
		this.r_fare = r_fare;
	}
	public int getR_peoplecnt() {
		return r_peoplecnt;
	}
	public void setR_peoplecnt(int r_peoplecnt) {
		this.r_peoplecnt = r_peoplecnt;
	}
	public String getH_thumnail() {
		return h_thumnail;
	}
	public void setH_thumnail(String h_thumnail) {
		this.h_thumnail = h_thumnail;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	@Override
	public String toString() {
		return "MyReservationVO [r_no=" + r_no + ", h_no=" + h_no + ", m_id=" + m_id + ", r_startdate=" + r_startdate
				+ ", r_enddate=" + r_enddate + ", r_fare=" + r_fare + ", r_peoplecnt=" + r_peoplecnt + ", h_thumnail="
				+ h_thumnail + ", m_phone=" + m_phone + "]";
	}
	
	
	
}
