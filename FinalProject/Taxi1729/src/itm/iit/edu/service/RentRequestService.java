package itm.iit.edu.service;

import java.sql.ResultSet;


import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class RentRequestService {
	
	static Connector connection = new Connector();
	public Statement stmt = null;

	public void insertRecords(String car_name, double rent_cost, String car_type, int id) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		
		try{
			stmt = connection.getConnection().createStatement();
			String sql = "INSERT INTO rent_request (car_brand, car_cost, car_type,accept, car_user)"
					+ "VALUES ('"+car_name+"','"+rent_cost+"','"+car_type+"','"+0+"','"+id+"')";
			
		stmt.executeUpdate(sql);
			
			stmt.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}
	
	
	public void insertRideRecords(String car_name, double carCost, String car_type, String driver, String dist, String time, String finalCost, int id) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		
		try{
			stmt = connection.getConnection().createStatement();
			String sql = "INSERT INTO ride_request (car_brand, car_cost, car_type,accept,car_driver, car_user)"
					+ "VALUES ('"+car_name+"','"+finalCost+"','"+car_type+"','"+0+"','"+driver+ "',"+id+"')";
			
		stmt.executeUpdate(sql);
			
			stmt.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}
	
	
	public ResultSet getRecords() {
		ResultSet rs = null;
		try{
			stmt = connection.getConnection().createStatement();
			String sql = "SELECT *  FROM rent_request WHERE accept='0'";
			
			rs = stmt.executeQuery(sql);
		}catch(Exception e) {
			System.out.println(e);
		}
		return rs;
	}
	
	public ResultSet getRideRecords() {
		ResultSet rs = null;
		try{
			stmt = connection.getConnection().createStatement();
			String sql = "SELECT *  FROM ride_request WHERE accept='0'";
			
			rs = stmt.executeQuery(sql);
		}catch(Exception e) {
			System.out.println(e);
		}
		return rs;
	}


	public void acceptRent(String carName,String carType, double carCost, int user) {
		ResultSet rs = null;
		try {
			stmt = connection.getConnection().createStatement();
			String sql = "UPDATE rent_request SET accept='1' WHERE car_brand='"+carName+"' AND car_type='"+carType+"'";
			stmt.executeUpdate(sql);
			
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
			 Date date = new Date();  
			 String driver = "Self";
			 String service = "Rent";
			String sql1 = "INSERT INTO trip_history (trip_date, trip_driver, trip_fare, trip_car, service_type, trip_rating, trip_userId)"
					+ "VALUES ('"+formatter.format(date)+"','"+driver+"','"+carCost+"','"+carName+"','"+service+"','"+5+"','"+user+"')";
			
			stmt.executeUpdate(sql1);
			
			stmt.close();
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	public void acceptRide(String carName,String carType, double carCost, int user, String driver) {
		ResultSet rs = null;
		try {
			stmt = connection.getConnection().createStatement();
			String sql = "UPDATE ride_request SET accept='1' WHERE car_brand='"+carName+"' AND car_type='"+carType+"'";
			stmt.executeUpdate(sql);
			
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
			 Date date = new Date();  
			 
			 String service = "Ride";
			String sql1 = "INSERT INTO trip_history (trip_date, trip_driver, trip_fare, trip_car, service_type, trip_rating, trip_userId)"
					+ "VALUES ('"+formatter.format(date)+"','"+driver+"','"+carCost+"','"+carName+"','"+service+"','"+5+"','"+user+"')";
		stmt.executeUpdate(sql1);
			
			stmt.close();
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
}
