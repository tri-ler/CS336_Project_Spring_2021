package com.cs336.pkg;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class RegisterDao {
	private String URL = "jdbc:mysql://localhost:3306/userdb";
	private String name = "root";
	private String driver = "com.sql.jdbc.Driver";
	private String password = "CS336";
	
	
	public Connection getConnection() {
		Connection con = null;
		try {
			con = (Connection) DriverManager.getConnection(URL, name, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
	/*
	 * This method intends to add user to the data base
	 * @param
	 * 		user: user that is going to be added to database 
	 */
	public String add(User user) {
		load(driver);
		Connection con = getConnection();
		String command = "insert into userdb.user values(?,?)";
		try {
			PreparedStatement ps = 
					(PreparedStatement) con.prepareStatement(command);
			ps.setString(1, user.getName());
			ps.setString(2, user.getPassword());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "Register failed";
		}
		return "Congratualation, registration seccess!";
	}
	
	/*
	 * This method load the driver of the data base
	 * @param
	 * 		diver: driver of the user data base 
	 */
	public void load(String driver) {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
