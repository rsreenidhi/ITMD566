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
@WebServlet("/saveRent")
public class SaveRent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String carName;
		String carType;
		double carCost;
		int user;
		carName = request.getParameter("hidden_Car");
		carType = request.getParameter("hidden_car_type");
		carCost = Double.parseDouble(request.getParameter("hidden_car_finalCost")) ;
		user = Integer.parseInt(request.getParameter("hidden_id"));
		
		RentRequestService saveRent = new RentRequestService();
		saveRent.acceptRent(carName, carType, carCost, user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/adminHome");
		dispatcher.forward(request, response);
	}

}
