package itm.iit.edu.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import itm.iit.edu.service.LogindaoModel;

public class LoginService {
	static Connector connection = new Connector();
	public Statement stmt = null;
	User user = new User();
	public int authenticateLogin(String userName, String password) {
		ResultSet rs = null;
		String loggedUserName = null;
		int loggedUserId = 0;
		int loggedUserType = 0;
		int authentication = 0;
		LogindaoModel checkUserDetails = new LogindaoModel();
		try {
			rs = checkUserDetails.userCheck(userName, password);
			
			while(rs.next()) {
				loggedUserName =  rs.getString("userName");
				loggedUserId = rs.getInt("user_id");
				loggedUserType = rs.getInt("user_type");
			}
			
			if(loggedUserName == null) {
				authentication = 10;
			}else {
				
				user.setUserName(loggedUserName);
				user.setUserId(loggedUserId);
				user.setUserType(loggedUserType);
				if(loggedUserType == 1)
					authentication = 1;
				else if(loggedUserType == 0)
					authentication = 0;
			}
		}catch(Exception e) {
			System.out.println("Error!");
		}
		return authentication;
		
		
	}
	
	public boolean registerLogin(String userName,String password,String firstName,String lastName,String email) {
		ResultSet rs = null;
		try{
			stmt = connection.getConnection().createStatement();
			String sql = "INSERT INTO user_login (firstname, lastname, username, password, email, user_type)"
					+ "VALUES ('"+firstName+"','"+lastName+"','"+userName+"','"+password+"','"+email+"','"+1+"')";
			
		stmt.executeUpdate(sql);
			
			stmt.close();
			return true;
		}catch(SQLException e){
			return false;
		}
	
	}
	public User getUser() {
		return user;
	}
	
	
	
}
