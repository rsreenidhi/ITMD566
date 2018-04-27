package itm.iit.edu;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import itm.iit.edu.service.TripHistoryService;
import itm.iit.edu.service.User;
import itm.iit.edu.service.GetRentCars;
import itm.iit.edu.service.GetRideCars;

/**
 * Servlet implementation class RentCarServlet
 */
@WebServlet("/rentCar")
public class RentCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static User loggedUser; 
	private static GetRentCars availableCars;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RentCarServlet() {

		availableCars = new GetRentCars();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("home", "null");
		request.setAttribute("Ride", "null");
		request.setAttribute("Rent", "active");
		ResultSet getCars = availableCars.getCars();
		request.setAttribute("getAvailableCars", getCars);
		RequestDispatcher dispatcher = request.getRequestDispatcher("rentCar.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dateRange;
		request.setAttribute("home", "null");
		request.setAttribute("Ride", "null");
		request.setAttribute("Rent", "active");
		dateRange = request.getParameter("reservation");
		String dateRangeArray[] = dateRange.split("-");
		long days = getDays(dateRangeArray[0], dateRangeArray[1]);
		request.setAttribute("days", days);
		
		GetRentCars getRentCars = new GetRentCars();
		ResultSet availbleRentCars = getRentCars.getCars();
		request.setAttribute("availbleRentCars", availbleRentCars);
		RequestDispatcher dispatcher = request.getRequestDispatcher("rentCar3.jsp");
		dispatcher.forward(request, response);
	}

	public long getDays(String fromDate, String toDate) {
		long diff = 0;
		try {
			Date fromDate1 = new SimpleDateFormat("MM/dd/yyyy").parse(fromDate);
			Date toDate1 = new SimpleDateFormat("MM/dd/yyyy").parse(toDate);
			long diffInMillies = Math.abs(toDate1.getTime() - fromDate1.getTime());
			diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return diff;
	}
}
