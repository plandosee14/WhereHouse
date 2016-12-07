package com.WhereHouse.mypage.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.WhereHouse.mypage.domain.MyBasketVO;
import com.WhereHouse.mypage.service.MyBasketService;

@Controller
@RequestMapping("/mypage")
public class MyBasketController {

	@Inject
	private MyBasketService bService;
	
	@RequestMapping("")
	public String mypage(Model model, HttpServletRequest request)throws Exception{
		String m_id = (String) request.getSession().getAttribute("m_id");
		List<MyBasketVO> list = bService.listAllById(m_id);
		model.addAttribute("bList", bService.listAllById(m_id));
		return "/mypage/mypageBasket";
	}
	
    @RequestMapping("/removebasket")
    public String removeBasket(int b_no, RedirectAttributes attr)throws Exception{
    	bService.removeBasket(b_no);
    	attr.addFlashAttribute("msg","SUCCESS");
    	return "redirect:/mypage";
    }
}
