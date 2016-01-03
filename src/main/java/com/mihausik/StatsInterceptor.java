package com.mihausik;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class StatsInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(StatsInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		//logger.info("user " + request.getUserPrincipal().getName() + " requested URI " + request.getRequestURI()  );
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		if (request.getUserPrincipal() != null) {
			if (request.getQueryString() != null) {
				logger.info("user " + request.getUserPrincipal().getName() + " requested URI " + request.getRequestURL().append('?').append(URLDecoder.decode(request.getQueryString(), "UTF-8"))+" Method: "+request.getMethod() );
			}
			else logger.info("user " + request.getUserPrincipal().getName() + " requested URI " + request.getRequestURL()+" Method: "+request.getMethod());
			}
		else logger.info("unauthenticated user, IP: "+request.getRemoteAddr()+" ,requested URI: "+request.getRequestURL()+" Method: "+request.getMethod());
		super.afterCompletion(request, response, handler, ex);
	}
}
