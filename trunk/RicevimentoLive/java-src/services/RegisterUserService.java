package services;

import org.hibernate.Criteria;
import org.hibernate.Session;

import util.HibernateFactory;

import model.beans.Student;
import model.beans.Supervisor;

public class RegisterUserService {
	
	public void SupervisorRegister(){
		 
	}
	public void StudentRegister(String nome, String cognome, String degree, String email, String username, String password, String personalNumber){
		Session s = HibernateFactory.openSession();
		
		Student student = new Student();
		student.setNome(nome);
		student.setCognome(cognome);
		student.setDegree(degree);
		student.setPersonalNumber(personalNumber);
		student.setEmail(email);
		student.setUsername(username);
		student.setPassword(password);		
		
		s.beginTransaction();
		s.save(student);
		s.getTransaction().commit();		
		
		s.close();		
	}
}
