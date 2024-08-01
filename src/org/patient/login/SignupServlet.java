package org.patient.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.patient.login.DBConnection;
import org.patient.login.SignupDao;
import org.patient.login.LoginBean;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/patientsignup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/hospitalmanagement/views/Psignup.jsp").forward(request, response);
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		
			SignupDao dao = new SignupDao();
			LoginBean user = new LoginBean();
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String cpassword = request.getParameter("confirmpassword");
			
			user.setEmail(email);
			user.setPassword(password);
			
			boolean res;
			
			try {
				res = dao.registerPatient(user);
				if(res) {
					System.out.println("Added User to database");
				}
				else {
					System.out.println("Error during login!!");
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("/hospital/patientlogin");
			
			
		
	}

}
