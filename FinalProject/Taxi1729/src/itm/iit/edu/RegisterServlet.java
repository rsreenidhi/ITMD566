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

import itm.iit.edu.service.LoginService;
import itm.iit.edu.service.TripHistoryService;
import itm.iit.edu.service.User;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName;
		String password;
		String firstName;
		String lastName;
		String email;
		
		userName = request.getParameter("username");
		password = request.getParameter("password");
		firstName = request.getParameter("firstname");
		lastName = request.getParameter("lastname");
		email = request.getParameter("email");
		LoginService loginService = new LoginService();
		boolean loginResponse = loginService.registerLogin(userName, password, firstName, lastName, email);
		
		if(loginResponse == true) {
			HttpSession session=request.getSession();  
			session.setAttribute("success", 1);
			response.sendRedirect("login.jsp");
		}else {
			HttpSession session=request.getSession();  
			session.setAttribute("success", 0);
			response.sendRedirect("login.jsp");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
