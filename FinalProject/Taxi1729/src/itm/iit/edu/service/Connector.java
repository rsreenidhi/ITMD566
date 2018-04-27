package itm.iit.edu.service;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {

	public Connection getConnection() {
		Connection con = null;
		
		try{
			String host = "jdbc:mysql://localhost:3308/taxi1729?useSSL=false";
			String userName = "root";
			String password = "root";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(host, userName, password);
		}catch(SQLException err){
			System.out.println(err.getMessage());
		}catch(ClassNotFoundException err){
			err.printStackTrace();
		}
		
		return con;
	}
	
}

