package itm.iit.edu.service;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class LogindaoModel {
	static Connector connection = new Connector();
	public Statement stmt = null;
	

	public  ResultSet userCheck(String username, String password) throws Exception {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		
		try{
			
			stmt = connection.getConnection().createStatement();
			
			
			String sql = "SELECT *  FROM user_login WHERE username='" + username + "' AND password='"+ password + "'";
			
			rs = stmt.executeQuery(sql);
			
			//String name = rs.getString("userType");
			
			
			
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
		return rs;
	}
}
