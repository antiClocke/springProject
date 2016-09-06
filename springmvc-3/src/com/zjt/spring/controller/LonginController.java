package com.zjt.spring.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zjt.spring.service.LonginService;



@Controller
public class LonginController {
    
	@Autowired
    private  LonginService longinService;
	
	
	@RequestMapping("/loginjson")
	@ResponseBody
	public String loginJson(){
		System.out.println("login");
		
		return "success";
	}
	
	
	@RequestMapping("/login") 
	public String login(){
		System.out.println("login");
		System.out.println("login1");
		longinService.sevicemethod();
		return "success";
	}
	
	@RequestMapping("/") 
	public String loginfirst(){
		System.out.println("login"); 
		
		return "login";
	}
	@RequestMapping("/LonginMain") 
	@ResponseBody
	public Map LonginMain(HttpServletRequest request,
			HttpServletResponse response){
		System.out.println(request.getParameter("uemail"));  
		System.out.println(	request.getParameter("admin") );
		longinService.sevicemethod();
		request.getSession().setAttribute("userid", "wo");
		Map map1=new HashMap();
		map1.put("success", true);
		
		return map1;
	}
	
	@RequestMapping("/main")  
	public String LonginMainPage(HttpServletRequest request,
			HttpServletResponse response){
		System.out.println(request.getParameter("uemail"));  
		System.out.println(	request.getParameter("admin") ); 
		request.getSession().setAttribute("userid", "wo");
		 
		
		return "main/main";
	}
	
	
	
}
