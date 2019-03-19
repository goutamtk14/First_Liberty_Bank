package com.flb.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import com.flb.entity.Account;

public class DaoFactory {

	static SessionFactory sf = new Configuration().configure().buildSessionFactory();

	public static void RegisterAccount(String username, String password, String name) {

		Account newAccount = new Account();
		newAccount.setUsername(username);
		newAccount.setPassword(password);
		newAccount.setName(name);
		newAccount.setInvalidPasswordCount(0);

		Session session = sf.openSession();
		session.beginTransaction();
		session.save(newAccount);
		session.getTransaction().commit();
		session.close();
	}

	public static String getAccountPassword(String username) {

		Session session = sf.openSession();
		session.beginTransaction();
		Query query = session.createQuery("select password from Account where username=:username");
		query.setParameter("username", username);
		String password = (String)query.uniqueResult();
		session.getTransaction().commit();
		session.close();
		if (password== null) {
			return "InvalidUsername";
		} else
			return password;

	}

	public static Account getAccountData(String username) {
		Session session = sf.openSession();
		session.beginTransaction();
		Account accountData = (Account)session.createQuery("from Account where username=:username").setParameter("username", username).uniqueResult();
		session.getTransaction().commit();
		session.close();
		return accountData;
	}

	public static int getInvalidPasswordCount(String username) {
		Session session = sf.openSession();
		session.beginTransaction();
		Query query = session.createQuery("select invalidPasswordCount from Account where username=:username");
		query.setParameter("username", username);
		int count = (int)query.uniqueResult();
		session.getTransaction().commit();
		session.close();
		return count;
	}

	public static void addInvalidPasswordCount(String username, int invalidPasswordCount) {
		Session session = sf.openSession();
		session.beginTransaction();
		Query query = session.createNativeQuery(
				"update account set invalidpasswordcount=:newInvalidPasswordCount where username=:username");
		query.setParameter("newInvalidPasswordCount", invalidPasswordCount + 1);
		query.setParameter("username", username);
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
	}
}
