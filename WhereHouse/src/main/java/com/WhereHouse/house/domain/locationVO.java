package com.WhereHouse.house.domain;

public class locationVO {
private String lat;
private String lng;
public locationVO(String lat, String lng) {
	super();
	this.lat = lat;
	this.lng = lng;
}
@Override
public String toString() {
	return "locationVO [lat=" + lat + ", lng=" + lng + "]";
}
public String getLat() {
	return lat;
}
public void setLat(String lat) {
	this.lat = lat;
}
public String getLng() {
	return lng;
}
public void setLng(String lng) {
	this.lng = lng;
}

}
