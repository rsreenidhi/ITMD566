package itm.iit.edu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import itm.iit.edu.service.User;
import itm.iit.edu.service.RentRequestService;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/rentPayment")
public class PaymentServlet extends HttpServlet {
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
		String carPath;
		String carType;
		String carColor;
		double carCost;
		double insuranceCost;
		long days;
		double finalCost;
		carName = request.getParameter("hidden_Car");
		carModel = request.getParameter("hidden_model");
		carPath = request.getParameter("hidden_path");
		carType = request.getParameter("hidden_car_type");	
		carColor = request.getParameter("hidden_car_color");
		carCost = Double.parseDouble(request.getParameter("hidden_car_cost")) ;
		insuranceCost = Double.parseDouble(request.getParameter("hidden_car_insurance")) ;
		days = (long) Double.parseDouble(request.getParameter("hidden_car_days")) ;
		finalCost = Double.parseDouble(request.getParameter("hidden_car_finalCost")) ;
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		int userId = user.getUserId();
		RentRequestService insertRequest = new RentRequestService();
		insertRequest.insertRecords(carName, finalCost, carType, userId);

		request.setAttribute("carName", carName);
		request.setAttribute("carModel", carModel);
		request.setAttribute("carPath", carPath);
		request.setAttribute("carType", carType);
		request.setAttribute("carColor", carColor);
		request.setAttribute("carCost", carCost);
		request.setAttribute("insuranceCost", insuranceCost);
		request.setAttribute("days", days);
		request.setAttribute("finalCost", finalCost);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("payment.jsp");
		dispatcher.forward(request, response);
	}

}
