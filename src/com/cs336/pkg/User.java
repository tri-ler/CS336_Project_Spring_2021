package com.cs336.pkg;

public class User {
	private String username;
	private String password;
	
	
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public void setName(String name) {
		this.username = name;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return this.username;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	
}
