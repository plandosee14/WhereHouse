package com.WhereHouse.mypage.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.memberGrade.domain.MemberGradeVO;
import com.WhereHouse.mypage.domain.MyRegisterVO;
import com.WhereHouse.mypage.service.MyRegisterService;
import com.WhereHouse.mypage.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MyRegisterController { 
	
	@Inject
	private MyRegisterService regService;
	
	@Inject
	private  MypageService mService;

	@RequestMapping("/reginfo")
	public String regInfo(Model model, HttpServletRequest request, RedirectAttributes attr)throws Exception{
		String m_id = (String) request.getSession().getAttribute("m_id");
		System.out.println("mid : "+m_id);
		model.addAttribute("regList", regService.listAllById(m_id));//등록정보
		regService.listEstimateById(m_id);
		MemberVO member = new MemberVO();
		
		List<MyRegisterVO> estList = regService.listEstimateById(m_id);
		model.addAttribute("estList", estList);//평가정보
		
		List<Integer> rList = new ArrayList<>();		
		for (int i = 0; i < estList.size(); i++) {
			
			int r_no = estList.get(i).getR_no();
			if(mService.selectGrade(r_no))
				rList.add(r_no);		    
		}
		System.out.println("rList"+rList);
		model.addAttribute("rList", rList);
		
		
		return "/mypage/mypageReginfo";
	}
	
	@RequestMapping("/reginfoAjax")
	public @ResponseBody String regInfoAjax(String m_id,int m_score,int r_no, Model model, HttpServletRequest request, RedirectAttributes attr)throws Exception{
		//String m_id = (String) request.getSession().getAttribute("m_id");
		
		
		MemberVO member = new MemberVO();
		member.setM_score(m_score);
		member.setM_id(m_id);
		
		MemberGradeVO mgrade = new MemberGradeVO();
		mgrade.setM_id(m_id);
		mgrade.setR_no(r_no);
		mgrade.setG_score(m_score);
		
		mService.insertGrade(mgrade);
		regService.modifyScore(member);
		
		
		return "/mypage/mypageReginfo";
	}
}
