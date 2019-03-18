package com.flb.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.NativeQuery;
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
		List<String> password = (List<String>) query.list();
		session.getTransaction().commit();
		session.close();
		if (password.size() == 0) {
			return "InvalidUsername";
		} else
			return password.get(0);

	}

	public static Account getAccountData(String username) {
		Session session = sf.openSession();
		session.beginTransaction();
		Account accountData = (Account) session.get(Account.class, username);
		session.getTransaction().commit();
		session.close();
		return accountData;
	}

	public static int getInvalidPasswordCount(String username) {
		Session session = sf.openSession();
		session.beginTransaction();
		Query query = session.createQuery("select invalidPasswordCount from Account where username=:username");
		query.setParameter("username", username);
		List<Integer> count = (List<Integer>) query.list();
		System.out.println(count.get(0));
		session.getTransaction().commit();
		session.close();
		return count.get(0);
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
