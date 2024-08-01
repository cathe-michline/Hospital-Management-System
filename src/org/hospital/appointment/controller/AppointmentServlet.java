package org.hospital.appointment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hospital.appointment.dao.AppointmentDao;
import org.hospital.appointment.model.Appointment;


@WebServlet("/Appointment")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String hospital = "";
	public String h_id = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
    	
    	response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(true);
		String email = (String)session.getValue("email");
		
		if(email == null) {
			response.sendRedirect("patientlogin");
		}
		else {
			hospital = request.getParameter("hospital").toString();
			h_id = request.getParameter("h_id").toString();
	    	request.setAttribute("email", email);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/hospitalmanagement/views/appointment_page.jsp");
			dispatcher.forward(request,response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
			//System.out.println("Dopost :" + hospital);
			
			PrintWriter printWriter = response.getWriter();
			Appointment app = new Appointment();
			AppointmentDao dao = new AppointmentDao();
			HttpSession session = request.getSession(true);
			String email = (String)session.getValue("email");
			
			app.setAge(request.getParameter("age"));
			app.setP_name(request.getParameter("name"));
			app.setEmail(email);
			app.setD_id(request.getParameter("doctor"));
			app.setGender(request.getParameter("gender"));
			app.setTimings(request.getParameter("timings"));
			app.setDoa(request.getParameter("doa"));
			app.setDor(request.getParameter("dor").toString());
			app.setHospital(hospital);
			app.setReason(request.getParameter("reason").toString());
			app.setH_id(h_id);
			
			boolean result = dao.addAppointment(app);
			if(result == false) {
				System.out.println("Error Adding Appointment to Database");
			}
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/hospitalmanagement/views/appointment_success.jsp");
			dispatcher.forward(request,response);
	}

}
