package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class UserUtil {
	public static Connection getConnect() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental","root","");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
}
