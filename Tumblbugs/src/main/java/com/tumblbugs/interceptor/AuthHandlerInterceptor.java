package com.tumblbugs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tumblbugs.vo.SessionVO;

public class AuthHandlerInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
        SessionVO svo = (SessionVO)session.getAttribute("svo");
        
        //svo�� ������ login ȣ��
        if(svo == null) {
        	//session.setAttribute("loginResult", false);
        	session.setAttribute("requestUrl", request.getRequestURL());
            response.sendRedirect("http://localhost:9090/tumblbugs/login");
            
            return false;
        }
        
        return true;
	}
}
