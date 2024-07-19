package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public static Connection conn;

	public static Connection getConn() {

		try {
			if (conn == null) {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/e_notes","root","root");       
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
}
