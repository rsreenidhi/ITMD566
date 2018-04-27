package itm.iit.edu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import itm.iit.edu.service.RentRequestService;
import itm.iit.edu.service.User;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/ridePayment")
public class PaymentServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public PaymentServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String carName;
		String carModel;
		String carDriver;
		String carType;
		String dist;
		double carCost;
		String time;
		String finalCost;
		carName = request.getParameter("hidden_car");
		carType = request.getParameter("hidden_car_type");	
		
		carDriver = request.getParameter("hidden_car_driver");
	
		dist = request.getParameter("hidden_car_dist");
		carCost = Double.parseDouble(request.getParameter("hidden_car_cost")) ;
		finalCost = request.getParameter("hidden_car_finalCost") ;
		
		time = request.getParameter("hidden_car_time") ;
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		int userId = user.getUserId();
		RentRequestService insertRideRequest = new RentRequestService();
		insertRideRequest.insertRideRecords(carName, carCost, carType,carDriver, dist,time, finalCost, userId);
		
		request.setAttribute("carName", carName);
		request.setAttribute("carType", carType);
		request.setAttribute("carDriver", carDriver);
		request.setAttribute("dist", dist);
		request.setAttribute("carCost", carCost);
		request.setAttribute("time", time);

		RequestDispatcher dispatcher = request.getRequestDispatcher("payment2.jsp");
		dispatcher.forward(request, response);
	}

}
