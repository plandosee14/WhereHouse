package com.WhereHouse.reservation.domain;

import java.util.Date;

public class ReservationDateVO {
	private Date r_startdate;
	private Date r_enddate;
	private int r_during;
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
	public int getR_during() {
		return r_during;
	}
	public void setR_during(int r_during) {
		this.r_during = r_during;
	}

	
	

}
