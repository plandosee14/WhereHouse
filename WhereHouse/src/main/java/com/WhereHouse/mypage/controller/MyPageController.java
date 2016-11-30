package com.WhereHouse.mypage.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.WhereHouse.basket.domain.BasketVO;
import com.WhereHouse.basket.service.BasketService;
import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.mypage.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Inject
	private BasketService bService;
	
	@Inject
	private MypageService mService;

	
	@RequestMapping("")
    public String mypage(Model model, HttpServletRequest request, int m_no, RedirectAttributes attr) throws Exception{
		String m_id = (String) request.getSession().getAttribute("m_id");
		System.out.println("Session 체크 : "+m_id);
		model.addAttribute("bList", bService.listAllById(m_id));
		model.addAttribute("mList", mService.listAllById(m_id));
		System.out.println(m_id);
		System.out.println(m_id);
		
		//회원정보 보기 요청
		//model.addAttribute(mService.read(m_no));
		//수정 요청
		//MemberVO member = mService.read(m_no);
		//model.addAttribute("member",member);
		//DB수정 요청
		//mService.modify(member);
		//attr.addFlashAttribute("msg","SUCCESS");
		//삭제 요청
    	//mService.remove(m_no);
    	//attr.addFlashAttribute("msg","SUCCESS");

		return "/mypage/mypage";
    }
	
	@RequestMapping("read")
    public String mypageRead(Model model, HttpServletRequest request, RedirectAttributes attr) throws Exception{
		String m_id = (String) request.getSession().getAttribute("m_id");
		System.out.println("Session 체크 : "+m_id);
		System.out.println(m_id);
		System.out.println(m_id);
		
		//회원정보 보기 요청
		//model.addAttribute(mService.read(m_no));
		//수정 요청
		/*MemberVO member = mService.read(m_no);
		model.addAttribute("member",member);
		//DB수정 요청
		mService.modify(member);
		attr.addFlashAttribute("msg","SUCCESS");
		//삭제 요청
    	mService.remove(m_no);
    	attr.addFlashAttribute("msg","SUCCESS");
*/
		return "/mypage/mypage";
    }
	
	
	@RequestMapping("delete")
    public String mypageDelete(Model model, HttpServletRequest request, int m_no, RedirectAttributes attr) throws Exception{
		String m_id = (String) request.getSession().getAttribute("m_id");
		System.out.println("Session 체크 : "+m_id);
		model.addAttribute("bList", bService.listAllById(m_id));
		model.addAttribute("mList", mService.listAllById(m_id));
		System.out.println(m_id);
		System.out.println(m_id);
		
		//회원정보 보기 요청
		model.addAttribute(mService.read(m_no));
		//수정 요청
		MemberVO member = mService.read(m_no);
		model.addAttribute("member",member);
		//DB수정 요청
		mService.modify(member);
		attr.addFlashAttribute("msg","SUCCESS");
		//삭제 요청
    	mService.remove(m_no);
    	attr.addFlashAttribute("msg","SUCCESS");

		return "/mypage/mypage";
    }
	
	@RequestMapping("update")
    public String mypageUpdate(Model model, HttpServletRequest request, int m_no, RedirectAttributes attr) throws Exception{
		String m_id = (String) request.getSession().getAttribute("m_id");
		System.out.println("Session 체크 : "+m_id);
		model.addAttribute("bList", bService.listAllById(m_id));
		model.addAttribute("mList", mService.listAllById(m_id));
		System.out.println(m_id);
		System.out.println(m_id);
		
		//회원정보 보기 요청
		model.addAttribute(mService.read(m_no));
		//수정 요청
		MemberVO member = mService.read(m_no);
		model.addAttribute("member",member);
		//DB수정 요청
		mService.modify(member);
		attr.addFlashAttribute("msg","SUCCESS");
		//삭제 요청
    	mService.remove(m_no);
    	attr.addFlashAttribute("msg","SUCCESS");

		return "/mypage/mypage";
    }
    
    
	
	@RequestMapping("/basket")
    public String listBasket(Model model, HttpServletRequest request) throws Exception{
		String m_id = (String) request.getSession().getAttribute("m_id");
		System.out.println("Session 체크 : "+m_id);
		model.addAttribute("bList", bService.listAllById(m_id));
		model.addAttribute("mList", mService.listAllById(m_id));
		return "/mypage/mypage";
    }

}
