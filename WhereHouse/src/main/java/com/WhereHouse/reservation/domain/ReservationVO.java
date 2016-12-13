package com.WhereHouse.reservation.domain;

import java.sql.Date;

public class ReservationVO {

	private int r_no;  	      
	private int h_no;  	      
	private String m_id;
	private Date r_startdate;
	private Date r_enddate;
	private int r_fare;  	      
	private int r_peoplecnt;  	      
	private int r_state;  	      
	private Date r_sysdate;
	
	
	
	public ReservationVO() {
	}

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

	public int getR_state() {
		return r_state;
	}

	public void setR_state(int r_state) {
		this.r_state = r_state;
	}

	public Date getR_sysdate() {
		return r_sysdate;
	}

	public void setR_sysdate(Date r_sysdate) {
		this.r_sysdate = r_sysdate;
	}

	@Override
	public String toString() {
		return "ReservationVO [r_no=" + r_no + ", h_no=" + h_no + ", m_id=" + m_id + ", r_startdate=" + r_startdate
				+ ", r_enddate=" + r_enddate + ", r_fare=" + r_fare + ", r_peoplecnt=" + r_peoplecnt + ", r_state="
				+ r_state + ", r_sysdate=" + r_sysdate + "]";
	}
	
	
	
	
	

}
