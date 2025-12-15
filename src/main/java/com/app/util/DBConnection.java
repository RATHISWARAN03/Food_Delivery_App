package com.app.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/food_delivery_app";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "Rathis@123";
	private static Connection con;
	public static Connection getConnection(){
//		Load the Driver
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
//		Establish the Connection
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}
