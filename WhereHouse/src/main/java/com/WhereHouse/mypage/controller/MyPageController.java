package com.WhereHouse.mypage.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.WhereHouse.basket.domain.BasketVO;
import com.WhereHouse.basket.service.BasketService;
import com.WhereHouse.member.domain.Encryption;
import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.member.service.MemberService;
import com.WhereHouse.mypage.domain.MyBasketVO;
import com.WhereHouse.mypage.service.MyPassService;
import com.WhereHouse.mypage.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Inject
	private MypageService mService;
	
	@Inject
	private MyPassService pService;
	
    
    @RequestMapping("/checkForm")
    public String mypageCheck(){
    
    	return "/mypage/mypagepwd";
    }
    
    
	
    @RequestMapping(value="/check")
    public @ResponseBody String mypageCheck2(Model model, HttpServletRequest request, RedirectAttributes attr, String m_pass)throws Exception{
    	String m_id = (String) request.getSession().getAttribute("m_id");
    	//System.out.println(m_id);
    	Encryption enc = new Encryption("chlvlfgkschlvlfgks");
    	MemberVO vo = new MemberVO();	
    	//System.out.println(m_pass);
    	String result;
    	vo.setM_id(m_id);
    	vo.setM_pass(enc.aesEncode(m_pass));
    	if (pService.selectPassword(vo) != 1) {
    		result = "NO";
		}
    	else {
    		
    		result = "OK";
		}
    	return result;
    }
    
    @RequestMapping("/checkDelForm")
    public String mypageCheck4()throws Exception{
    	
    	return "/mypage/mypagepwd2";
    }
    
    
    @RequestMapping("/check2")
    public @ResponseBody String mypageCheck3(Model model, HttpServletRequest request, RedirectAttributes attr, String m_pass)throws Exception{
    	String m_id = (String) request.getSession().getAttribute("m_id");
    	//System.out.println(m_id);
    	Encryption enc = new Encryption("chlvlfgkschlvlfgks");
    	MemberVO vo = new MemberVO();	
    	//System.out.println(m_pass);
    	String result;
    	vo.setM_id(m_id);
    	vo.setM_pass(enc.aesEncode(m_pass));
    	if (pService.selectPassword(vo) != 1) {
    		result = "NO";
		}
    	else {
    		
    		result = "OK";
		}
    	return result;
    }
    
	@RequestMapping("/read")
    public String mypageRead(Model model, HttpServletRequest request, RedirectAttributes attr, HttpSession session, String m_pass) throws Exception{
		//System.out.println(m_pass);
		String m_id = (String) request.getSession().getAttribute("m_id");
		//System.out.println("Session 체크 : "+m_id);
		MemberVO member = mService.read(m_id);
		//회원정보 보기 요청
		String phone[] = member.getM_phone().split("-");
		model.addAttribute(mService.read(m_id));
		model.addAttribute("member",member);
		model.addAttribute("phone1", phone[0].replaceAll(" ", ""));
		model.addAttribute("phone2", phone[1].replaceAll(" ", ""));
		model.addAttribute("phone3", phone[2].replaceAll(" ", ""));
		attr.addFlashAttribute("msg","SUCCESS");

		return "/mypage/mypageModify";
    }
	
	
	@RequestMapping("/deleteForm")
    public String mypageDelete(){

		return "/mypage/mypageDelete";
    }
	
	@RequestMapping("/delete")
	public String deleteMember(HttpSession session) throws Exception{
	
		String m_id = (String) session.getAttribute("m_id");
	
		session.invalidate();
	
		mService.remove(m_id);

		return "redirect:/";
	}
	
	@RequestMapping("/updateForm")
	public String mypageUpdate(){
		return "/mypage/mypageModify";
	}
	
	@RequestMapping("/update")
    public String mypageUpdate(Model model, HttpServletRequest request, RedirectAttributes attr, HttpSession session,String m_pass, String m_id, String m_phone1, String m_phone2, String m_phone3) throws Exception{
		Encryption enc = new Encryption("chlvlfgkschlvlfgks");
		MemberVO member = new MemberVO();
		member.setM_id(m_id);
		member.setM_pass(enc.aesEncode(m_pass));
		String m_phone = m_phone1+"-"+m_phone2+"-"+m_phone3;
		member.setM_phone(m_phone.replace(" ", ""));
		mService.modify(member);

		model.addAttribute("member", mService.read(m_id));
		attr.addFlashAttribute("msg1","SUCCESS1");
		return "redirect:/mypage";
    }
    


}
