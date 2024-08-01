package org.hospital.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class hospitalhome
 */
@WebServlet("/hospitalhome")
public class hospitalhome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hospitalhome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		HttpSession session = request.getSession(true);
		String email = (String)session.getValue("h_id");
		//System.out.println(email);
		
		if(email == null) {
			response.sendRedirect("hospitallogin");
		}
		else {

			request.setAttribute("email", email);
			request.getRequestDispatcher("/hospitalmanagement/views/hospitalpage.jsp").forward(request, response);
		}
	}


}
