package services;

import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import flex.messaging.io.ArrayCollection;

import util.HibernateFactory;
import model.beans.Booking;
import model.beans.Room;
import model.beans.Student;
import model.beans.Supervisor;
import model.beans.Timewindow;

public class DashboardUserService {
	
	public DashboardUserService(){
		
	}	
	public List<Room> getRoomList(){
		Session s = HibernateFactory.openSession();		
		Query q = s.createQuery("from Room");
		List<Room> result = q.list();			
		HibernateFactory.closeSession(s);		
		return result;
	}	
	
	private List<Integer> getIdSupervisorListByRoom(String id_room){		
		Session s = HibernateFactory.openSession();		
		String query = "select supervisor.id from Roomsupervisor where id_room = :id_room";
		Query q = s.createQuery(query);
		q.setParameter("id_room", id_room);
		List<Integer> result = new LinkedList<Integer>(q.list());		
		HibernateFactory.closeSession(s);		
		return result;
	}
	
	public List<Supervisor> getSupervisorListByRoom(String id_room){				
		List<Integer> idSupervisors = getIdSupervisorListByRoom(id_room);
		List<Supervisor> supervisors = new LinkedList<Supervisor>();
		Iterator<Integer> it = idSupervisors.iterator();
		int id_supervisor;
		Session s = HibernateFactory.openSession();
		while (it.hasNext()){			
			id_supervisor = it.next();
			String query = "from Supervisor where id = :id_supervisor";
			Query q = s.createQuery(query);
			q.setParameter("id_supervisor", id_supervisor);
			Supervisor supervisor = (Supervisor)q.uniqueResult();			
			query = "select window from Timewindow where id_supervisor = :id_supervisor";
			q = s.createQuery(query);
			q.setParameter("id_supervisor", id_supervisor);
			Set<Timewindow> timewindows = new HashSet(q.list());
			supervisor.setTimewindows(timewindows);
			supervisors.add(supervisor);
		}
		HibernateFactory.closeSession(s);
		return supervisors;
	}
	public List getAvailabilityTimewindows(String id_supervisor){
		int ENABLED = 0; //0-> disponibile, 1->non disponibile
		Session s = HibernateFactory.openSession();
		String query = "from Timewindow where id_supervisor = :id_supervisor and enabled = :enabled";
		Query q = s.createQuery(query);
		q.setParameter("id_supervisor", id_supervisor);
		q.setParameter("enabled", ENABLED);
		List timewindows = q.list();
		HibernateFactory.closeSession(s);
		return timewindows;
	}
	
	public void doBooking(String idStudent, String idSupervisor, String idRoom, String reason, String date){
		Student student = new Student();
		student.setId(Integer.parseInt(idStudent));
		
		Supervisor supervisor = new Supervisor();
		supervisor.setId(Integer.parseInt(idSupervisor));
		
		Room room = new Room();
		room.setId(Integer.parseInt(idRoom));
		
		Booking booking = new Booking(student, room, supervisor, reason, date);		
		
		Session s = HibernateFactory.openSession();
		s.beginTransaction();
		s.save(booking);
		s.getTransaction().commit();
		s.close();
	}
	private List _getBookingList(String idStudent){	
		Session s = HibernateFactory.openSession();
		String query = "from Booking where id_student = :id_student";
		Query q = s.createQuery(query);
		q.setParameter("id_student", idStudent);
		List bookings = q.list();
		
		HibernateFactory.closeSession(s);
		
		return bookings;
	}
	public LinkedList<Booking> getBookingList(String idStudent){
		List _bookings = _getBookingList(idStudent);
		LinkedList<Booking> bookings = new LinkedList<Booking>();
		Iterator<Booking> it = _bookings.iterator();
		Session s = HibernateFactory.openSession();
		while (it.hasNext()){
			Supervisor supervisor = new Supervisor();
			Booking currentBooking = it.next();
			String query = "from Supervisor where id = :id_supervisor";
			Query q = s.createQuery(query);
			q.setParameter("id_supervisor", currentBooking.getSupervisor().getId());
			supervisor = (Supervisor)q.uniqueResult();
			currentBooking.setSupervisor(supervisor);
			bookings.add(currentBooking);
		}
		HibernateFactory.closeSession(s);
		return bookings;
	}
}
