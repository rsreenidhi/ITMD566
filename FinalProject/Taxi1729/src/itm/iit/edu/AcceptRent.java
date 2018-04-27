package itm.iit.edu;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itm.iit.edu.service.RentRequestService;

/**
 * Servlet implementation class AcceptRide
 */
@WebServlet("/acceptRent")
public class AcceptRent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("home", "null");
		request.setAttribute("Ride", "null");
		request.setAttribute("Rent", "active");
		RentRequestService newService = new RentRequestService();
		ResultSet rs = newService.getRecords();
		request.setAttribute("rentrequests", rs);
		RequestDispatcher dispatcher = request.getRequestDispatcher("acceptRent.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("home", "null");
		request.setAttribute("Ride", "null");
		request.setAttribute("Rent", "active");
		RentRequestService newService = new RentRequestService();
		ResultSet rs = newService.getRecords();
		request.setAttribute("riderequests", rs);
		RequestDispatcher dispatcher = request.getRequestDispatcher("acceptRent.jsp");
		dispatcher.forward(request, response);
	}

}
