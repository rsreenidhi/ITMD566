package itm.iit.edu;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import itm.iit.edu.service.TripHistoryService;
import itm.iit.edu.service.User;

/**
 * Servlet implementation class TripHistoryServlet
 */
@WebServlet("/home")
public class TripHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static User loggedUser;
	private static TripHistoryService tripDetails;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public TripHistoryServlet() {
		tripDetails = new TripHistoryService();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		int userId = user.getUserId();
		request.setAttribute("home", "active");
		request.setAttribute("Ride", "null");
		request.setAttribute("Rent", "null");
		ResultSet tripResult = tripDetails.getTripHistory(userId);
		request.setAttribute("tripHistory", tripResult);
		RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		int userId = user.getUserId();
		request.setAttribute("home", "active");
		request.setAttribute("Ride", "null");
		request.setAttribute("Rent", "null");
		 ResultSet tripResult = tripDetails.getTripHistory(userId);
		request.setAttribute("tripHistory", tripResult);
		RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
		dispatcher.forward(request, response);
	}

}
