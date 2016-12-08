package com.WhereHouse.www;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.WhereHouse.reservation.domain.ReservationDateVO;
import com.WhereHouse.reservation.persistence.ReservationDAO;
import com.WhereHouse.reservation.service.ReservationService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class ReservationTest {
	@Inject
	ReservationDAO rdao;
	
	@Inject
	ReservationService rservice;
	
	//@Test
	public void selectReservationList() throws Exception{
		List<ReservationDateVO> rlist = rdao.selectReservationDate(9);
		for (int i = 0; i < rlist.size(); i++) {
			System.out.println(rlist.get(i).toString());
			
		}
	}
	
	@Test
	public void selectDay() throws Exception{
		rservice.selectReservationImPossibleDate(9);
		
	}

}
