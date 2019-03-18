package com.flb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;

@Entity
public class Passbook {

	@Id
	@Column(name="Paccountno")
	private long useraccountno;
	private String date;
	private String particulars;
	private double credit;
	private double debit;
	private double balance;
	@OneToOne
	@JoinColumn(name = "accountno", referencedColumnName="accountno")
	@MapsId
	private Account account;

	public Account getAccount() {
		return account;
	}

	public long getUseraccountno() {
		return useraccountno;
	}

	public void setUseraccountno(long useraccountno) {
		this.useraccountno = useraccountno;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getParticulars() {
		return particulars;
	}

	public void setParticulars(String particulars) {
		this.particulars = particulars;
	}

	public double getCredit() {
		return credit;
	}

	public void setCredit(double credit) {
		this.credit = credit;
	}

	public double getDebit() {
		return debit;
	}

	public void setDebit(double debit) {
		this.debit = debit;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

}
