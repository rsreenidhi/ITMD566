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
@WebServlet("/acceptRide")
public class AcceptRide extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcceptRide() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("home", "null");
		request.setAttribute("Ride", "active");
		request.setAttribute("Rent", "null");
		RentRequestService newService = new RentRequestService();
		ResultSet rs = newService.getRideRecords();
		request.setAttribute("riderequests", rs);
		RequestDispatcher dispatcher = request.getRequestDispatcher("acceptRide.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("home", "null");
		request.setAttribute("Ride", "active");
		request.setAttribute("Rent", "null");
		RentRequestService newService = new RentRequestService();
		ResultSet rs = newService.getRideRecords();
		request.setAttribute("riderequests", rs);
		RequestDispatcher dispatcher = request.getRequestDispatcher("acceptRide.jsp");
		dispatcher.forward(request, response);
	}

}
