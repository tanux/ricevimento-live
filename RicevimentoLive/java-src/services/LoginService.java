package services;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import util.HibernateFactory;

import model.beans.Student;
import model.beans.Supervisor;

public class LoginService {
	
	public LoginService(){
		
	}
	public Supervisor SupervisorLogin(String username,String password){
		Session s = HibernateFactory.openSession();
		
		Supervisor user = new Supervisor();
		user.setUsername(username);
		user.setPassword(password);
		
		Criteria c = s.createCriteria(Supervisor.class);
		
		c.add(Example.create(user));
		
		Supervisor result = (Supervisor) c.uniqueResult();
		
		HibernateFactory.closeSession(s);
		return result;
	}
	
	public Student UserLogin(String username, String password){
		Session s = HibernateFactory.openSession();
		
		Student user = new Student();
		user.setUsername(username);
		user.setPassword(password);
		
		Criteria c = s.createCriteria(Student.class);
		c.add(Example.create(user));
		
		Student result = (Student)c.uniqueResult();
		
		HibernateFactory.closeSession(s);		
		return result;
	}	
}
