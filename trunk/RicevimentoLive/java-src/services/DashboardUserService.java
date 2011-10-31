package services;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import util.HibernateFactory;
import model.beans.Room;
import model.beans.Supervisor;

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
	
	private List<Integer> getIdSupervisorListByRoom(int id_room){		
		Session s = HibernateFactory.openSession();		
		String query = "select supervisor.id from Roomsupervisor where id_room = :id_room";
		Query q = s.createQuery(query);
		q.setParameter("id_room", id_room);
		List<Integer> result = q.list();		
		HibernateFactory.closeSession(s);		
		return result;
	}
	public List<Supervisor> getSupervisorListByRoom(int id_room){				
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
			Supervisor result = (Supervisor)q.uniqueResult();
			supervisors.add(result);
		}
		return supervisors;
	}
}
