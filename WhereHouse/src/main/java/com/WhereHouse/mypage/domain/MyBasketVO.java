package com.WhereHouse.mypage.domain;

public class MyBasketVO {
	private int h_no;
	private int h_fare;
	private String h_type;
	private String h_livetype;
	private String h_thumnail;
	private int b_no;
	
	public int getH_no() {
		return h_no;
	}
	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
	public int getH_fare() {
		return h_fare;
	}
	public void setH_fare(int h_fare) {
		this.h_fare = h_fare;
	}
	public String getH_type() {
		return h_type;
	}
	public void setH_type(String h_type) {
		this.h_type = h_type;
	}
	public String getH_livetype() {
		return h_livetype;
	}
	public void setH_livetype(String h_livetype) {
		this.h_livetype = h_livetype;
	}
	public String getH_thumnail() {
		return h_thumnail;
	}
	public void setH_thumnail(String h_thumnail) {
		this.h_thumnail = h_thumnail;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	@Override
	public String toString() {
		return "MypageVO [h_no=" + h_no + ", h_fare=" + h_fare + ", h_type=" + h_type + ", h_livetype=" + h_livetype
				+ ", h_thumnail=" + h_thumnail + ", b_no=" + b_no + "]";
	}
	
	
}