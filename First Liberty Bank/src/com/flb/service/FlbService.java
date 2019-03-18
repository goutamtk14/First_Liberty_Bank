package com.flb.service;
import com.flb.dao.DaoFactory;
import com.flb.entity.Account;

public class FlbService {

	public static void Register(String username, String password, String name) {

		DaoFactory.RegisterAccount(username, password, name);

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
}
