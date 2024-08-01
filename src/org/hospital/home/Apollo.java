package org.hospital.home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Apollo
 */
@WebServlet("/apollo")
public class Apollo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Apollo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String hospital = "APOLLO MULTISPECIALITY HOSPITAL, MADURAI";
    	request.setAttribute("hospital", hospital);
    	request.setAttribute("h_id", "H2");
		request.getRequestDispatcher("/hospitalmanagement/views/apollo.jsp").forward(request, response);
	}

	

}
