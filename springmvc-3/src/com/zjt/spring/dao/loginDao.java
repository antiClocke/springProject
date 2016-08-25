package com.zjt.spring.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class loginDao {
	@Autowired
	private SessionFactory sessionFactory;
	loginDao(){
		System.out.print("dao");
	}
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public  void loginDaomethod(){
		System.out.println("loginDaomethod");
		Query query =getSession().createSQLQuery("select Name from city").setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		 
		List list =(List) query.list();    
		
		for(int i=0;i<list.size();i++){  
		Map m = (Map)list.get(i);  
		System.out.println("  name :"+m.get("Name"));//此处注意大写问题，oracle数据库查询出来的表列名为大写，此处必须与查询出的列名完全一样  
		    
	}
	}
}
