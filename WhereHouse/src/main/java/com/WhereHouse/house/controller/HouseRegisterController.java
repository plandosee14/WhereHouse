package com.WhereHouse.house.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.service.HouseService;
import com.WhereHouse.option.domain.HouseOptionVO;
import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@RequestMapping("/house")
@Controller
public class HouseRegisterController {
	
	@Inject
	HouseService hservice;

	//등록폼
	@RequestMapping("registerForm")
	public void RegisterForm(){
		
	}
	
	@RequestMapping("test")
	public void test(){
		
	}
	
	//등록
	@RequestMapping("/register")
	public String Register(HttpServletRequest request, HttpSession session, HouseVO house, MultipartFile file){
		int h_no = 0;
		System.out.println("house주소"+house.getH_address());
		Geocoder geocoder = new Geocoder();
		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(house.getH_address()).setLanguage("ko").getGeocoderRequest();
		GeocodeResponse geocoderResponse;

		try {
			geocoderResponse = geocoder.geocode(geocoderRequest);
			if (geocoderResponse.getStatus() == GeocoderStatus.OK & !geocoderResponse.getResults().isEmpty()) {
				GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();
				LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();
				house.setH_pi_x(Float.toString(latitudeLongitude.getLat().floatValue()));
				house.setH_pi_y(Float.toString(latitudeLongitude.getLng().floatValue()));
			}
		} catch (IOException e2) {
			e2.printStackTrace();
		}
	
		
		UUID uid = UUID.randomUUID();		
		String saveName = uid.toString()+"_"+file.getOriginalFilename();
		
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		/*System.out.println("h_startdate: "+startdate);
		System.out.println("h_endtdate: "+enddate);*/

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date h_startdate =  transFormat.parse(startdate);
			Date h_enddate =  transFormat.parse(enddate);
			house.setH_startdate( new java.sql.Date(h_startdate.getTime()));
			house.setH_enddate( new java.sql.Date(h_enddate.getTime()));
		} catch (ParseException e1) {
			
			e1.printStackTrace();
		}
		
		
		
		//Date date = new Date(year, month, date)
	    
	    
		/*System.out.println("넌 무슨 네임이니?: "+saveName);*/
		String uploadpath = request.getSession().getServletContext().getRealPath("/resources/img/house"); 
		System.out.println(uploadpath);
		//String uploadpath = application.getRealPath("/resources/img/house");
	    File target = new File(uploadpath, saveName);
        try {
			FileCopyUtils.copy(file.getBytes(), target);
			
			//HouseVO
			//핸드폰 번호 가져오기
			String m_phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
			//집주소 가져오기
			house.setH_address(request.getParameter("h_address") + request.getParameter("addr2"));		
			
			//체크인 아웃시간
			String h_checktime = request.getParameter("checkin")+" ~ "+request.getParameter("checkout");
			
			house.setM_phone(m_phone);
			house.setH_thumnail(saveName);
			house.setH_checktime(h_checktime);
		
			hservice.insertHouse(house); 
			
			//집 옵션 가져오기
			String[] h_option = request.getParameterValues("h_option"); 
			
		    for (int i = 0; i < h_option.length; i++) {
		    	
		    	HouseOptionVO hoption = new HouseOptionVO();
		    	h_no = hservice.selectNewHouseById(house.getM_id());
		    	hoption.setH_no(hservice.selectNewHouseById(house.getM_id()));
		    	hoption.setO_name(h_option[i]);
		    	
		    	/*System.out.println("h_option: "+hoption.toString());*/
		    	hservice.insertHouseOption(hoption);
  	
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return "redirect:/house/detail?h_no="+h_no;
	
        
	}

		
	
	

}
