package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import entities.User;
import util.SingletonSessFactory;

public class DaoImp implements Idao{

	@Override
	public void addUser(User user) {
		System.out.println(user.getPdpURL());
		Session sess = SingletonSessFactory.getSessionFactory().openSession();
		sess.beginTransaction();
		sess.save(user);
		sess.getTransaction().commit();
	}

	
	public boolean findEmail(String email) {
		Session sess = SingletonSessFactory.getSessionFactory().openSession();
		sess.beginTransaction();
		
		Query<?> query = sess.createQuery("FROM User u WHERE u.email = :e").setParameter("e",email);
		sess.getTransaction().commit();
		List<?> list =  query.list();
		if(list.size() == 0)
			return false;
		else
			return true;
		
	}

	@Override
	public Long userExist(String pseudo, String motdepasse) {
		Session sess = SingletonSessFactory.getSessionFactory().openSession();
		sess.beginTransaction();
		Query<?> query = sess.createQuery("select userId FROM User u WHERE u.pseudo = '"+pseudo+"' AND u.password = '"+motdepasse+"'");
		List<?> res = query.list();
		sess.getTransaction().commit();
		if(res.size() == 0)
			return 0L;
		else
			return (Long) res.get(0);
	}
	
	@Override
	public boolean findPseudo(String pseudo) {
		Session sess = SingletonSessFactory.getSessionFactory().openSession();
		sess.beginTransaction();
		String hql = "FROM User u WHERE u.pseudo = ?";
		Query<?> query = sess.createQuery(hql).setParameter(0, pseudo);
		List<?> res = query.list();
		sess.getTransaction().commit();
		if(res.size() == 0)
			return false;
		else
			return true;
	}


	@Override
	public User getUserById(Long userId) {
		Session sess = SingletonSessFactory.getSessionFactory().openSession();
		sess.beginTransaction();
		User user = sess.get(User.class, userId);
		sess.getTransaction().commit();
		return user;
	}


	@Override
	public void updateUser(User user) {
		Session sess = SingletonSessFactory.getSessionFactory().openSession();
		sess.beginTransaction();
		sess.update(user);
		sess.getTransaction().commit();
	}
}
