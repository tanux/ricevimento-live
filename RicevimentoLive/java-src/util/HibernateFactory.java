package util;
import java.lang.management.ManagementFactory;
import javax.management.InstanceAlreadyExistsException;
import javax.management.MBeanRegistrationException;
import javax.management.MBeanServer;
import javax.management.MalformedObjectNameException;
import javax.management.NotCompliantMBeanException;
import javax.management.ObjectName;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.jmx.StatisticsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/** HibernateFactory util
*
* @author Blackdog
* @version 0.1 Agu 3, 2010.
*/

public class HibernateFactory {
	
	private static final SessionFactory sessionFactory;
	private static Logger logger = LoggerFactory.getLogger(HibernateFactory.class);

	/** 
	 * Creazione statica del SessionFactor 
	 * 
	 */
	
	static {

		try {
			Configuration configuration = new Configuration();
			configuration.configure();
			sessionFactory = configuration.buildSessionFactory();
			
			/*MBeanServer mbeanServer = ManagementFactory.getPlatformMBeanServer();
           final ObjectName objectName = new ObjectName("org.hibernate:type=statistics");
           final StatisticsService mBean = new StatisticsService();
           mBean.setStatisticsEnabled(true);
           mBean.setSessionFactory(sessionFactory);
           mbeanServer.registerMBean(mBean, objectName);*/
       } /*catch (MalformedObjectNameException e) {
    	   logger.error("unable to register mbean", e);
           throw new RuntimeException(e);
       } catch (InstanceAlreadyExistsException e) {
    	   logger.error("unable to register mbean", e);
           throw new RuntimeException(e);
       } catch (MBeanRegistrationException e) {
    	   logger.error("unable to register mbean", e);
           throw new RuntimeException(e);
       } catch (NotCompliantMBeanException e) {
    	   logger.error("unable to register mbean", e);
           throw new RuntimeException(e);
       }*/ catch (Throwable e) {
			logger.error("Initial SessionFactory creation failed.", e);
			throw new ExceptionInInitializerError(e);
		}
	}

	/** getSessionFactory()
	 * 
	 * @return			SessionFactory
	 */	
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/** Metodo rollback transaction 
	 * 
	 * @param transaction Transaction In caso di errore effettua il rollback sulla transaction da chiudere
	 *
	 */	
	public static void rollback(Transaction transaction) {
		try {
			if (transaction != null) {
				transaction.rollback();
			}
		} catch (HibernateException e) {
			logger.error("Couldn't rollback Transaction", e);
		}
	}
	
	public static Session openSession() throws HibernateException {
        Session s = sessionFactory.openSession();
        return s;
    }
	
	public static void disconnectSession(Session s) throws HibernateException {
		s.disconnect();
    }
	
    public static void closeSession(Session s) throws HibernateException {
    	if (!s.isOpen()) {
    		s.close();
    	}
    }
}
