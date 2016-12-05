package com.WhereHouse.house.domain;

import java.util.Date;

public class HousedistanceVO {
	private int h_no;  	      
	private String m_id; 
	private String m_name; 	
	private String m_phone; 	
	private String h_title;
	private String h_zip;
	private String h_address;
	private String h_pi_x;
	private String h_pi_y;	
	private Integer h_fare;
	private Date h_startdate;
	private Date h_enddate;	
	private String h_info;		
	private Integer h_peoplecnt;
	private String h_type;
	private String h_livetype;
	private String h_checktime;
	private Integer h_sale;
	private Integer h_salefare;
	private String h_rule;
	private String h_thumnail;
	private int h_state;
	private int h_scorecnt;
	private int h_avgscore;
	private int h_rightscore;
	private int h_cleanscore;
	private int h_checkscore;
	private int h_commuscore;
	private String distance;
	
	public HousedistanceVO() {
	}
	public HousedistanceVO(int h_no, String m_id, String m_name, String m_phone, String h_title, String h_zip,
			String h_address, String h_pi_x, String h_pi_y, Integer h_fare, Date h_startdate, Date h_enddate,
			String h_info, Integer h_peoplecnt, String h_type, String h_livetype, String h_checktime, Integer h_sale,
			Integer h_salefare, String h_rule, String h_thumnail, int h_state, int h_scorecnt, int h_avgscore,
			int h_rightscore, int h_cleanscore, int h_checkscore, int h_commuscore, String distance) {
		super();
		this.h_no = h_no;
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.h_title = h_title;
		this.h_zip = h_zip;
		this.h_address = h_address;
		this.h_pi_x = h_pi_x;
		this.h_pi_y = h_pi_y;
		this.h_fare = h_fare;
		this.h_startdate = h_startdate;
		this.h_enddate = h_enddate;
		this.h_info = h_info;
		this.h_peoplecnt = h_peoplecnt;
		this.h_type = h_type;
		this.h_livetype = h_livetype;
		this.h_checktime = h_checktime;
		this.h_sale = h_sale;
		this.h_salefare = h_salefare;
		this.h_rule = h_rule;
		this.h_thumnail = h_thumnail;
		this.h_state = h_state;
		this.h_scorecnt = h_scorecnt;
		this.h_avgscore = h_avgscore;
		this.h_rightscore = h_rightscore;
		this.h_cleanscore = h_cleanscore;
		this.h_checkscore = h_checkscore;
		this.h_commuscore = h_commuscore;
		this.distance = distance;
	}
	@Override
	public String toString() {
		return "HousedistanceVO [h_no=" + h_no + ", m_id=" + m_id + ", m_name=" + m_name + ", m_phone=" + m_phone
				+ ", h_title=" + h_title + ", h_zip=" + h_zip + ", h_address=" + h_address + ", h_pi_x=" + h_pi_x
				+ ", h_pi_y=" + h_pi_y + ", h_fare=" + h_fare + ", h_startdate=" + h_startdate + ", h_enddate="
				+ h_enddate + ", h_info=" + h_info + ", h_peoplecnt=" + h_peoplecnt + ", h_type=" + h_type
				+ ", h_livetype=" + h_livetype + ", h_checktime=" + h_checktime + ", h_sale=" + h_sale + ", h_salefare="
				+ h_salefare + ", h_rule=" + h_rule + ", h_thumnail=" + h_thumnail + ", h_state=" + h_state
				+ ", h_scorecnt=" + h_scorecnt + ", h_avgscore=" + h_avgscore + ", h_rightscore=" + h_rightscore
				+ ", h_cleanscore=" + h_cleanscore + ", h_checkscore=" + h_checkscore + ", h_commuscore=" + h_commuscore
				+ ", distance=" + distance + "]";
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
	public String getH_title() {
		return h_title;
	}
	public void setH_title(String h_title) {
		this.h_title = h_title;
	}
	public String getH_zip() {
		return h_zip;
	}
	public void setH_zip(String h_zip) {
		this.h_zip = h_zip;
	}
	public String getH_address() {
		return h_address;
	}
	public void setH_address(String h_address) {
		this.h_address = h_address;
	}
	public String getH_pi_x() {
		return h_pi_x;
	}
	public void setH_pi_x(String h_pi_x) {
		this.h_pi_x = h_pi_x;
	}
	public String getH_pi_y() {
		return h_pi_y;
	}
	public void setH_pi_y(String h_pi_y) {
		this.h_pi_y = h_pi_y;
	}
	public Integer getH_fare() {
		return h_fare;
	}
	public void setH_fare(Integer h_fare) {
		this.h_fare = h_fare;
	}
	public Date getH_startdate() {
		return h_startdate;
	}
	public void setH_startdate(Date h_startdate) {
		this.h_startdate = h_startdate;
	}
	public Date getH_enddate() {
		return h_enddate;
	}
	public void setH_enddate(Date h_enddate) {
		this.h_enddate = h_enddate;
	}
	public String getH_info() {
		return h_info;
	}
	public void setH_info(String h_info) {
		this.h_info = h_info;
	}
	public Integer getH_peoplecnt() {
		return h_peoplecnt;
	}
	public void setH_peoplecnt(Integer h_peoplecnt) {
		this.h_peoplecnt = h_peoplecnt;
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
	public String getH_checktime() {
		return h_checktime;
	}
	public void setH_checktime(String h_checktime) {
		this.h_checktime = h_checktime;
	}
	public Integer getH_sale() {
		return h_sale;
	}
	public void setH_sale(Integer h_sale) {
		this.h_sale = h_sale;
	}
	public Integer getH_salefare() {
		return h_salefare;
	}
	public void setH_salefare(Integer h_salefare) {
		this.h_salefare = h_salefare;
	}
	public String getH_rule() {
		return h_rule;
	}
	public void setH_rule(String h_rule) {
		this.h_rule = h_rule;
	}
	public String getH_thumnail() {
		return h_thumnail;
	}
	public void setH_thumnail(String h_thumnail) {
		this.h_thumnail = h_thumnail;
	}
	public int getH_state() {
		return h_state;
	}
	public void setH_state(int h_state) {
		this.h_state = h_state;
	}
	public int getH_scorecnt() {
		return h_scorecnt;
	}
	public void setH_scorecnt(int h_scorecnt) {
		this.h_scorecnt = h_scorecnt;
	}
	public int getH_avgscore() {
		return h_avgscore;
	}
	public void setH_avgscore(int h_avgscore) {
		this.h_avgscore = h_avgscore;
	}
	public int getH_rightscore() {
		return h_rightscore;
	}
	public void setH_rightscore(int h_rightscore) {
		this.h_rightscore = h_rightscore;
	}
	public int getH_cleanscore() {
		return h_cleanscore;
	}
	public void setH_cleanscore(int h_cleanscore) {
		this.h_cleanscore = h_cleanscore;
	}
	public int getH_checkscore() {
		return h_checkscore;
	}
	public void setH_checkscore(int h_checkscore) {
		this.h_checkscore = h_checkscore;
	}
	public int getH_commuscore() {
		return h_commuscore;
	}
	public void setH_commuscore(int h_commuscore) {
		this.h_commuscore = h_commuscore;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	
	 
}
