package com.WhereHouse.reservation.domain;

import java.util.Date;

public class ReservationDateVO {
	private Date r_starddate;
	private Date r_enddate;
	private int r_during;
	public Date getR_starddate() {
		return r_starddate;
	}
	public void setR_starddate(Date r_starddate) {
		this.r_starddate = r_starddate;
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
	@Override
	public String toString() {
		return "ReservationDateVO [r_starddate=" + r_starddate + ", r_enddate=" + r_enddate + ", r_during=" + r_during
				+ "]";
	}
	
	
	

}
