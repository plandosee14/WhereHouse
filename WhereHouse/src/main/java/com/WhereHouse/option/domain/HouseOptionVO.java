package com.WhereHouse.option.domain;

public class HouseOptionVO {
	private int o_no;
	private int h_no;
	private String o_name;
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public int getH_no() {
		return h_no;
	}
	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	@Override
	public String toString() {
		return "HouseOptionVO [o_no=" + o_no + ", h_no=" + h_no + ", o_name=" + o_name + "]";
	}
	
	

}
