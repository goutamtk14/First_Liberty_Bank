package com.flb.service;
import com.flb.dao.DaoFactory;
import com.flb.entity.Account;

public class FlbService {

	public static void Register(String username, String password, String name, long mobilenumber) {

		DaoFactory.RegisterAccount(username, password, name, mobilenumber);

	}

	public static String checkAccountPassword(String username) {

		return DaoFactory.getAccountPassword(username);
	}

	public static Account getAccountData(String username) {
		return DaoFactory.getAccountData(username);
	}

	public static void invalidPasswordCount(String username) {

		DaoFactory.addInvalidPasswordCount(username, DaoFactory.getInvalidPasswordCount(username));

	}
	public static void zeroinvalidPasswordCount(String username) {
		DaoFactory.addInvalidPasswordCount(username, 0);

	}
	
	public static String getName(long accountno) {
		return DaoFactory.getName(accountno);
	}
}
