package com.flb.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.flb.dao.DaoFactory;
import com.flb.entity.Account;
import com.flb.entity.Passbook;

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

		DaoFactory.addInvalidPasswordCount(username, DaoFactory.getInvalidPasswordCount(username) + 1);

	}

	public static void zeroinvalidPasswordCount(String username) {
		DaoFactory.addInvalidPasswordCount(username, 0);

	}

	public static String getName(long accountno) {
		return DaoFactory.getName(accountno);
	}

	public static String moneyTransfer(long receiveraccountno, long senderaccountno, String receivername,
			String sendername, double amount, String particulars) {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date0 = new Date();
		String date = format.format(date0);
		double senderbalance = DaoFactory.getBalance(senderaccountno) - amount;
		if(senderbalance<0) {
			return "Insufficient";
		}
		else {
		double receiverbalance = DaoFactory.getBalance(receiveraccountno) + amount;
		String senderparticular = particulars + " sent to " + receivername;
		String receiverparticular = particulars + " sent by " + sendername;
		DaoFactory.moneyTransfer(receiveraccountno, senderaccountno, date, amount, senderparticular, receiverparticular,
				senderbalance, receiverbalance);
		return "Success";
		}
	}

	public static void depositByBank(long accountno, double amount) {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date0 = new Date();
		String date = format.format(date0);
		Passbook user = new Passbook();
		user.setAccountno(accountno);
		user.setBalance(DaoFactory.getBalance(accountno) + amount);
		user.setCredit(amount);
		user.setDate(date);
		user.setParticulars("Deposit by Bank");
		DaoFactory.creditdebitbalance(user);
	}
}
