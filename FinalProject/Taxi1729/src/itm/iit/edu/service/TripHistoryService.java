package itm.iit.edu.service;

import java.sql.ResultSet;


import java.sql.Statement;

public class TripHistoryService {
	
	static Connector connection = new Connector();
	public Statement stmt = null;

	public ResultSet getTripHistory(int userId) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		try{
			stmt = connection.getConnection().createStatement();
			String sql = "SELECT *  FROM trip_history WHERE trip_userId='" + userId + "'";
			rs = stmt.executeQuery(sql);

		}catch(Exception e) {
			System.out.println(e);
		}
		return rs;
	}

}
