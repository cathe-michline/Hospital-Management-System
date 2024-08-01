package org.hospital.home;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Vadamalayan
 */
@WebServlet("/vadamalayan")
public class Vadamalayan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Vadamalayan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	String hospital = "VADAMALAYAN HOSPITALS, MADURAI";
    	request.setAttribute("hospital", hospital);
    	request.setAttribute("h_id", "H1");
		request.getRequestDispatcher("/hospitalmanagement/views/vadamalayan.jsp").forward(request, response);
	}


}
