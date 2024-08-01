package org.hospital.appointment.check;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.Duration;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.patient.login.DBConnection;

/**
 * Servlet implementation class checkStatus
 */
@WebServlet("/checkStatus")
public class checkStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String status = "Doctor is not Available";
		Instant before = Instant.now();
		
		
		String date = request.getParameter("date");
		String timings = request.getParameter("timings");
		String d_id = request.getParameter("d_id");
		String sqlAppointment = "SELECT D_ID, TIMINGS, DOA FROM APPOINTMENT WHERE D_ID='"+d_id+"' AND TIMINGS='"+timings+"' AND DOA= '"+date+"'";
		//System.out.println("CheckStatus is called");
		//System.out.println(date + " " + timings + " " + d_id);
		//System.out.print(sqlAppointment);
		Connection con = DBConnection.getConn();
        try{
        	Statement statement = con.createStatement();
        	ResultSet appointmentSet = statement.executeQuery(sqlAppointment);
        	if(!appointmentSet.next()){
        		//System.out.print("VALUE NOT PRESENT IN DB!");
        		status = "Doctor is Available"; //Doctor is available
        	}
        }
        catch(SQLException e) {
			e.printStackTrace();
		}
        
        Instant after = Instant.now();
		long delta = Duration.between(before, after).toNanos();
		System.out.print("TIME TAKEN : (AFTER)" + delta);
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(status);   
		
	}

}
