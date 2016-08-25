package com.zjt.springmvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

 
	public HelloWorld helloWorld;
	
	public UserService() {
		System.out.println("UserService Constructor...");
	}
	
}
