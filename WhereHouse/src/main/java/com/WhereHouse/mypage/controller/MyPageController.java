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
	private BasketService bService;
	
	@Inject
	private MypageService mService;
	
	@Inject
	private MyPassService pService;
	
	@RequestMapping("")
    public String mypage(Model model, HttpServletRequest request, RedirectAttributes attr) throws Exception{
		
		String m_id = (String) request.getSession().getAttribute("m_id");
	
		List<MyBasketVO> list = mService.listAllById(m_id);
/*		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getB_no());
		}*/
		//System.out.println("Session 체크 : "+m_id);
		/*model.addAttribute("bList", bService.listAllById(m_id));*/
		model.addAttribute("mList", mService.listAllById(m_id));


		return "/mypage/mypage";
    }
	
    @RequestMapping("/removebasket")
    public String removeBasket(int b_no, RedirectAttributes attr)throws Exception{
    	mService.removeBasket(b_no);
    	attr.addFlashAttribute("msg","SUCCESS");
    	return "redirect:/mypage";
    }
    
    @RequestMapping("/checkForm")
    public String mypageCheck(){
    
    	return "/mypage/mypagepwd";
    }
    
    
	
    @RequestMapping(value="/check")
    public String mypageCheck2(Model model, HttpServletRequest request, RedirectAttributes attr, String m_pass)throws Exception{
    	String m_id = (String) request.getSession().getAttribute("m_id");
    	Encryption enc = new Encryption("chlvlfgkschlvlfgks");
    	MemberVO vo = new MemberVO();	
    	vo.setM_id(m_id);
    	vo.setM_pass(enc.aesEncode(m_pass));
    	if (pService.selectPassword(vo) == null || pService.selectPassword(vo).equals("")) {
    		return "/mypage/mypagepwd";
		}
    	else {
    		
			return "redirect:/mypage/read";
		}
    }
    
    @RequestMapping("/checkDelForm")
    public String mypageCheck4()throws Exception{
    	
    	return "/mypage/mypagepwd2";
    }
    
    
    @RequestMapping("/check2")
    public String mypageCheck3(Model model, HttpServletRequest request, RedirectAttributes attr, String m_pass)throws Exception{
    	String m_id = (String) request.getSession().getAttribute("m_id");
    	System.out.println("check2 "+m_pass);
    	Encryption enc = new Encryption("chlvlfgkschlvlfgks");
    	//System.out.println("1 ");
    	MemberVO vo = new MemberVO();	
    	//System.out.println("2 ");
    	vo.setM_id(m_id);
    	//System.out.println("3 ");
    	vo.setM_pass(enc.aesEncode(m_pass));
    	if (pService.selectPassword(vo) == null || pService.selectPassword(vo).equals("")) {
    		//System.out.println("1 들어옴 ");
    		return "/mypage/mypagepwd2";
		}
    	else {
    		//System.out.println("2 들어옴 ");
    		MemberVO member = mService.read(m_id);
    		model.addAttribute(mService.read(m_id));
    		model.addAttribute("member",member);
			return "redirect:/mypage/deleteForm";
		}
    }
    
	@RequestMapping("/read")
    public String mypageRead(Model model, HttpServletRequest request, RedirectAttributes attr, HttpSession session, String m_pass) throws Exception{
		System.out.println(m_pass);
		String m_id = (String) request.getSession().getAttribute("m_id");
		//System.out.println("Session 체크 : "+m_id);
		MemberVO member = mService.read(m_id);
		//회원정보 보기 요청
		model.addAttribute(mService.read(m_id));
		model.addAttribute("member",member);
		attr.addFlashAttribute("msg","SUCCESS");

		return "/mypage/mypage4";
    }
	
	
	@RequestMapping("/deleteForm")
    public String mypageDelete(){

		return "/mypage/mypage5";
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
		return "/mypage/mypage4";
	}
	
	@RequestMapping("/update")
    public String mypageUpdate(MemberVO member, Model model, HttpServletRequest request, RedirectAttributes attr, HttpSession session,String m_pass) throws Exception{
		String m_id = (String) request.getSession().getAttribute("m_id");
		Encryption enc = new Encryption("chlvlfgkschlvlfgks");
		member.setM_pass(enc.aesEncode(m_pass));
		System.out.println("컨트롤러 비밀버노: "+member.getM_pass());
		mService.modify(member);

		model.addAttribute("member", mService.read(m_id));
		attr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/mypage/read";
    }
    
    
	
	@RequestMapping("/basket")
    public String listBasket(Model model, HttpServletRequest request) throws Exception{
		String m_id = (String) request.getSession().getAttribute("m_id");
		//System.out.println("Session 체크 : "+m_id);
		model.addAttribute("bList", bService.listAllById(m_id));
		model.addAttribute("mList", mService.listAllById(m_id));
		return "/mypage/mypage";
    }

}
