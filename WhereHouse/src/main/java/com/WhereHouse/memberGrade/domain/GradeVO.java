package com.WhereHouse.memberGrade.domain;

public class GradeVO {
	private int h_no;
	private int r_no;
	private int rightscore;
	private int cleanscore;
	private int checkscore;
	private int commuscore;
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
	public int getRightscore() {
		return rightscore;
	}
	public void setRightscore(int rightscore) {
		this.rightscore = rightscore;
	}
	public int getCleanscore() {
		return cleanscore;
	}
	public void setCleanscore(int cleanscore) {
		this.cleanscore = cleanscore;
	}
	public int getCheckscore() {
		return checkscore;
	}
	public void setCheckscore(int checkscore) {
		this.checkscore = checkscore;
	}
	public int getCommuscore() {
		return commuscore;
	}
	public void setCommuscore(int commuscore) {
		this.commuscore = commuscore;
	}
	@Override
	public String toString() {
		return "GradeVO [h_no=" + h_no + ", r_no=" + r_no + ", rightscore=" + rightscore + ", cleanscore=" + cleanscore
				+ ", checkscore=" + checkscore + ", commuscore=" + commuscore + "]";
	}
	
	
}
