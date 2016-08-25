package com.zjt.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjt.spring.dao.loginDao;


 
@Service
public class LonginService {
	@Autowired
	loginDao loginDao1 ;
	
	LonginService(){
		
		System.out.print("Service");
	}
	  public void sevicemethod(){
		  loginDao1.loginDaomethod();
	   }
	
}
