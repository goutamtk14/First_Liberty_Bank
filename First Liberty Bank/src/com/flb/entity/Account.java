package com.flb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name="flbsequencegenerator", initialValue=20190000, allocationSize=1)
public class Account {

	@Id
	private String username;
	@Column(unique=true)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="flbsequencegenerator")
	private long accountno;
	private String password;
	private String name;
	private int invalidPasswordCount;
	@OneToOne
	private Passbook passbook;

	public long getAccountno() {
		return accountno;
	}

	public void setAccountno(long accountno) {
		this.accountno = accountno;
	}

	public Passbook getPassbook() {
		return passbook;
	}

	public void setPassbook(Passbook passbook) {
		this.passbook = passbook;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public int getInvalidPasswordCount() {
		return invalidPasswordCount;
	}

	public void setInvalidPasswordCount(int invalidPasswordCount) {
		this.invalidPasswordCount = invalidPasswordCount;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
