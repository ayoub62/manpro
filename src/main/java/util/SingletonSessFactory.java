package util;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class SingletonSessFactory {
	private static SessionFactory sessionFactory;
	
	static{
		Configuration conf = new Configuration().configure();
		sessionFactory =  conf.buildSessionFactory();
	}
	
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public static void setSessionFactory(SessionFactory sessionFactory) {
		SingletonSessFactory.sessionFactory = sessionFactory;
	}
}
