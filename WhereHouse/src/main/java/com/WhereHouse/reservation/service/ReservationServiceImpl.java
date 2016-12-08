package com.WhereHouse.reservation.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.persistence.HouseDAO;
import com.WhereHouse.reservation.domain.ReservationDateVO;
import com.WhereHouse.reservation.domain.ReservationVO;
import com.WhereHouse.reservation.persistence.ReservationDAO;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Inject
	ReservationDAO rdao;
	


	@Override
	public void insertReservation() throws Exception {
		

	}

	@Override
	public void selectReservationImPossibleDate(int h_no) throws Exception {
		List<Date> daylist = new ArrayList<>(); //예약불가능한 기간 리스트
		Calendar cal = Calendar.getInstance();
		
		List<ReservationDateVO> dlist= rdao.selectReservationDate(h_no); //예약한 집 리스트의 시작날짜, 끝날짜, 기간(끝날짜-시작날짜)의 리스트
		for (int i = 0; i < dlist.size(); i++) {
			int during = dlist.get(i).getR_during();//예약기간
			
			for (int j = 0; j < during; j++) {//예약기간만큼
				cal.setTime(dlist.get(i).getR_startdate()); 
				cal.add(Calendar.DATE, j); //예) 2016-01-01 + 0 = 2016-01-01
				                           //        01-01 + 1 = 2016-01-02
				System.out.println(cal.getTime());
				daylist.add(cal.getTime());	//불가능한 기간 list에 날짜 추가			
			}
			
		}
		
		for (int i = 0; i < daylist.size(); i++) {
			System.out.println("날짜: "+daylist.get(i));			
		}

	}

}
