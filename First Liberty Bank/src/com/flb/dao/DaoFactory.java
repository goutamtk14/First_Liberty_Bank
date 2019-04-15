package com.flb.dao;

import java.util.Collections;
import java.util.List;
import javax.persistence.PersistenceException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import com.flb.entity.Account;
import com.flb.entity.Passbook;

public class DaoFactory {

	static SessionFactory sf = new Configuration().configure().buildSessionFactory();

	public static String RegisterAccount(String username, String password, String name, long mobilenumber,
			String email) {

		
		Account newAccount = new Account();
		newAccount.setUsername(username);
		newAccount.setPassword(password);
		newAccount.setName(name);
		newAccount.setMobilenumber(mobilenumber);
		newAccount.setEmail(email);
		newAccount.setInvalidPasswordCount(0);

		Session session = sf.openSession();
		session.beginTransaction();
		session.save(newAccount);
		try {
			session.getTransaction().commit();
			session.close();
			return "success";
		} catch (PersistenceException e) {
			session.close();
			return "Error";
		}
	}

	public static String getAccountPassword(String username) {

		Session session = sf.openSession();
		session.beginTransaction();
		Query query = session.createQuery("select password from Account where username=:username");
		query.setParameter("username", username);
		String password = (String) query.uniqueResult();
		session.getTransaction().commit();
		session.close();
		if (password == null) {
			return "Invalid";
		} else
			return password;

	}

	public static Account getAccountData(String username) {
		Session session = sf.openSession();
		session.beginTransaction();
		Account accountData = (Account) session.createQuery("from Account where username=:username")
				.setParameter("username", username).uniqueResult();
		session.getTransaction().commit();
		session.close();
		return accountData;
	}

	public static int getInvalidPasswordCount(String username) {
		Session session = sf.openSession();
		session.beginTransaction();
		Query query = session.createQuery("select invalidPasswordCount from Account where username=:username");
		query.setParameter("username", username);
		int count = (int) query.uniqueResult();
		session.getTransaction().commit();
		session.close();
		return count;
	}

	public static void addInvalidPasswordCount(String username, int invalidPasswordCount) {
		Session session = sf.openSession();
		session.beginTransaction();
		Query query = session.createNativeQuery(
				"update account set invalidpasswordcount=:newInvalidPasswordCount where username=:username");
		query.setParameter("newInvalidPasswordCount", invalidPasswordCount);
		query.setParameter("username", username);
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
	}

	public static String getName(long accountno) {
		Session session = sf.openSession();
		session.beginTransaction();
		Query query = session.createQuery("select name from Account where accountno=:accountno");
		query.setParameter("accountno", accountno);
		String name = (String) query.uniqueResult();
		session.getTransaction().commit();
		session.close();
		if (name == null) {
			return "Invalid";
		} else {
			return name;
		}
	}

	public static double getBalance(long accountno) {
		Session session = sf.openSession();
		session.beginTransaction();
		Query query = session.createNativeQuery(
				"select balance from passbook where accountno=:accountno order by transactionno DESC LIMIT 1");
		query.setParameter("accountno", accountno);
		Double balance = (Double) query.uniqueResult();
		session.getTransaction().commit();
		session.close();
		if (balance == null) {
			return 0;
		} else
			return balance;

	}

	public static void moneyTransfer(long receiveraccountno, long senderaccountno, String date, double amount,
			String senderparticular, String receiverparticular, double senderbalance, double receiverbalance) {
		Session session = sf.openSession();
		session.beginTransaction();
		Passbook sender = new Passbook();
		Passbook receiver = new Passbook();
		sender.setAccountno(senderaccountno);
		sender.setBalance(senderbalance);
		sender.setDate(date);
		sender.setDebit(amount);
		sender.setParticulars(senderparticular);
		receiver.setAccountno(receiveraccountno);
		receiver.setBalance(receiverbalance);
		receiver.setCredit(amount);
		receiver.setDate(date);
		receiver.setParticulars(receiverparticular);
		session.save(sender);
		session.save(receiver);
		session.getTransaction().commit();
		session.close();
	}

	public static void creditdebitbalance(Passbook user) {
		Session session = sf.openSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		session.close();
	}

	public static List<Passbook> accountPassbook(long accountno) {
		Session session = sf.openSession();
		session.beginTransaction();
		Query query = session.createQuery("select entries from Passbook entries where entries.accountno=:accountno");
		query.setParameter("accountno", accountno);
		List<Passbook> entries = (List<Passbook>) query.list();
		session.getTransaction().commit();
		session.close();
		Collections.reverse(entries);
		return entries;
	}

}
