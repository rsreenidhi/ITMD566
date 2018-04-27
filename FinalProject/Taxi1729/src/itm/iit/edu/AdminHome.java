package itm.iit.edu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itm.iit.edu.service.TripHistoryService;

/**
 * Servlet implementation class AdminHome
 */
@WebServlet("/adminHome")
public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static AdminHome adminHome;
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public AdminHome() {
//        
//        // TODO Auto-generated constructor stub
//    	
//    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("home", "active");
		request.setAttribute("Ride", "null");
		request.setAttribute("Rent", "null");
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminhome.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		adminHome = new AdminHome();
		request.setAttribute("home", "active");
		request.setAttribute("Ride", "null");
		request.setAttribute("Rent", "null");
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminhome.jsp");
		dispatcher.forward(request, response);
	}

}
