package itm.iit.edu;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.httpclient.util.URIUtil;

import itm.iit.edu.service.GetRideCars;
import itm.iit.edu.service.LoginService;
/**
 * Servlet implementation class BookRideServlet
 */
@WebServlet("/bookRide")
public class BookRideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("home", "null");
		request.setAttribute("Ride", "active");
		request.setAttribute("Rent", "null");
		RequestDispatcher dispatcher = request.getRequestDispatcher("bookRide.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String originAddress;
		String destAddress;
		
		request.setAttribute("home", "null");
		request.setAttribute("Ride", "active");
		request.setAttribute("Rent", "null");
		originAddress = request.getParameter("from");
		destAddress = request.getParameter("to");
		String distanceString = getDistance(originAddress, destAddress);
		request.setAttribute("distanceString", distanceString);
		
		GetRideCars getRideCars = new GetRideCars();
		ResultSet availbleRideCars = getRideCars.getCars();
		request.setAttribute("availbleRideCars", availbleRideCars);
		RequestDispatcher dispatcher = request.getRequestDispatcher("bookRide2.jsp");
		dispatcher.forward(request, response);
	}

	public String getDistance(String from, String to) {
		
		String output = "", full = "";
		
		try {
	        URL url = new URL(
	        		"https://maps.googleapis.com/maps/api/distancematrix/json?origins="
	        		+ URIUtil.encodeQuery(from)+"&destinations="+URIUtil.encodeQuery(to)+"&key=AIzaSyA3eaK3zaQI_pBJ5kR-wCx_dUuIP8mKR44");
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Accept", "application/json");

	        if (conn.getResponseCode() != 200) {
	            throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
	        }
	        BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

	        
	        while ((output = br.readLine()) != null) {
	        	
	            full += output;
	        }
	        conn.disconnect();
	        
//	        response = new IsPincodeSupportedResponse(new PincodeVerifyConcrete(
//	                gson.getResults().get(0).getFormatted_address(), 
//	                gson.getResults().get(0).getGeometry().getLocation().getLat(),
//	                gson.getResults().get(0).getGeometry().getLocation().getLng())) ;
//	        try {
//	            String address = response.getAddress();
//	            Double latitude = response.getLatitude(), longitude = response.getLongitude();
//	            if (address == null || address.length() <= 0) {
//	                log.error("Address is null");
//	            }
//	        } catch (NullPointerException e) {
//	            log.error("Address, latitude on longitude is null");
//	        }
//	        
//	    	} 
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
		return full;
	}
}
