package itm.iit.edu.service;

import java.sql.ResultSet;


import java.sql.Statement;

public class GetRentCars {
	
	static Connector connection = new Connector();
	public Statement stmt = null;

	public ResultSet getCars() {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		try{
			stmt = connection.getConnection().createStatement();
			String sql = "SELECT *  FROM rent_car";
			rs = stmt.executeQuery(sql);

		}catch(Exception e) {
			System.out.println(e);
		}
		return rs;
	}

}
