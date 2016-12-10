package com.WhereHouse.reservation.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
	public List<String> selectReservationImPossibleDate(int h_no) throws Exception {
		//List<Date> daylist = new ArrayList<>(); //����Ұ����� �Ⱓ ����Ʈ
		DateFormat sdFormat = new SimpleDateFormat("yyyy-M-d");
		Calendar cal = Calendar.getInstance();
		List<String> dayList = new ArrayList<>();
		
		List<ReservationDateVO> dlist= rdao.selectReservationDate(h_no); //������ �� ����Ʈ�� ���۳�¥, ����¥, �Ⱓ(����¥-���۳�¥)�� ����Ʈ
		for (int i = 0; i < dlist.size(); i++) {
			int during = dlist.get(i).getR_during();//����Ⱓ
			
			for (int j = 0; j < during; j++) {//����Ⱓ��ŭ
				cal.setTime(dlist.get(i).getR_startdate()); 
				cal.add(Calendar.DATE, j); //��) 2016-01-01 + 0 = 2016-01-01
				                           //        01-01 + 1 = 2016-01-02
				System.out.println(cal.getTime());
				dayList.add("\""+sdFormat.format(cal.getTime())+"\"");
				
				//daylist.add(cal.getTime());	//�Ұ����� �Ⱓ list�� ��¥ �߰�			
			}
			
		}
		
		for (int i = 0; i < dayList.size(); i++) {
			//System.out.println("��¥: "+daylist.get(i));			
			System.out.println("��¥ String: "+dayList.get(i));			
		}
		
		return dayList;

	}

}
