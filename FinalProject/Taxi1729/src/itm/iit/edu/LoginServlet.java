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
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName;
		String password;
		
		userName = request.getParameter("user_name");
		password = request.getParameter("password");
		
		LoginService loginService = new LoginService();
		int loginResponse = loginService.authenticateLogin(userName, password);
		
		if(loginResponse != 10) {
			User loggedUser = loginService.getUser();
			HttpSession session=request.getSession();  
			session.setAttribute("user",loggedUser);
			
			request.setAttribute("user", loggedUser);
		
			if(loginResponse == 1) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/home");
				dispatcher.forward(request, response);
			}else if(loginResponse == 0) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/adminHome");
				dispatcher.forward(request, response);
			}

//			response.sendRedirect("success.jsp");
		}else {
			HttpSession session=request.getSession();  
			session.setAttribute("success", 2);
			response.sendRedirect("login.jsp");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
