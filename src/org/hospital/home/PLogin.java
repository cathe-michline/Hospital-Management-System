package org.hospital.home;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.patient.login.*;

/**
 * Servlet implementation class PLogin
 */
@WebServlet("/patientlogin")
public class PLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	LoginValidationDao dao = new LoginValidationDao();
	LoginBean loginBean = new LoginBean();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	
//    	HttpSession session = request.getSession(false);
//		if (session == null) {
		request.getRequestDispatcher("/hospitalmanagement/views/Plogin.jsp").forward(request, response);
//		}
//		else {
//			response.sendRedirect("home");
//		}
	}
    

}
