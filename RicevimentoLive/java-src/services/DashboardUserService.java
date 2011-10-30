package services;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateFactory;
import model.beans.Room;

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
}
