package com.WhereHouse.mypage.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.WhereHouse.member.domain.MemberVO;

public class MypageInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	      //HandlerMethod method=(HandlerMethod) handler;
	      //System.out.println("贸府 皋家靛 bean : " + method.getBean());
	      //System.out.println("贸府 皋家靛 method : " + method.getMethod());
	      String m_id = (String) request.getSession().getAttribute("m_id");
	      if(m_id!=null) return true;
	      else{
	         request.getSession().removeAttribute("m_id");
	         response.sendRedirect("/");
	         return false;
	      }

	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
