package com.WhereHouse.basket.domain;

public class BasketVO {
	private int b_no;
	private int h_no;
	private String m_id;
	
	public BasketVO() {
		// TODO Auto-generated constructor stub
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
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

	@Override
	public String toString() {
		return "BasketVO [b_no=" + b_no + ", h_no=" + h_no + ", m_id=" + m_id + "]";
	}
	
	
}
