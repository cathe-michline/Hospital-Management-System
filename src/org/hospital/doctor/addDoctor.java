package org.hospital.doctor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.patient.login.DBConnection;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
/**
 * Servlet implementation class addDoctor
 */
@WebServlet("/addDoctor")
public class addDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public String generatePassword(int len) {
    	char[] password = new char[len];
    	
    	String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
        String specialCharacters = "!@#$";
        String numbers = "1234567890";
        String combinedChars = capitalCaseLetters + lowerCaseLetters + specialCharacters + numbers;
        Random random = new Random();

        password[0] = lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
        password[1] = capitalCaseLetters.charAt(random.nextInt(capitalCaseLetters.length()));
        password[2] = specialCharacters.charAt(random.nextInt(specialCharacters.length()));
        password[3] = numbers.charAt(random.nextInt(numbers.length()));
     
        for(int i = 4; i< len ; i++) {
           password[i] = combinedChars.charAt(random.nextInt(combinedChars.length()));
        }
    	String stringPassword = new String(password);
    	return stringPassword;	
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			boolean status = false;
			
			String name = request.getParameter("doctor");
			String d_id = request.getParameter("id");
			//String table = request.getParameter("table");
			String hospital = request.getParameter("hospital");
			String h_id = request.getParameter("h_id");
			String[] splited = hospital.split("\\s+");
			String table = splited[0];
			
			
			//Password Generation
			int len = 5; //Length of New PassWord
			final String chars = "abcdefghijklmnopqrstuvwxyz0123456789";
			SecureRandom random = new SecureRandom();
	        StringBuilder sb = new StringBuilder();
	        for (int i = 0; i < len; i++)
	        {
	            int randomIndex = random.nextInt(chars.length());
	            sb.append(chars.charAt(randomIndex));
	        }
	        
	        String password = generatePassword(5);
	        Connection con = DBConnection.getConn();
	        System.out.println("Table name : "+ table);
	        String sql = "INSERT INTO "+table+" VALUES (?, ?, ?, ?, ?);";

	        int i = 0;
	        try {
				 PreparedStatement preparedStatement = con.prepareStatement(sql);
				 
				 System.out.println("Doctor Name :" + name + "\nPassword :" + password+ "\nSuccessfully Added");
				 //preparedStatement.setString(1, table);
				 preparedStatement.setString(1, d_id);
				 preparedStatement.setString(2, name);
				 preparedStatement.setString(3, hospital);
				 preparedStatement.setString(4, password);
				 preparedStatement.setString(5, h_id);
				 
				 i = preparedStatement.executeUpdate();
				 
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
	        
	        if(i==0) {
	        	response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('ERROR ADDING DOCTOR');");
	            out.println("</script>");
			}
			else {
				response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('Doctor Added Successfully (ID : "+d_id+" and Password : "+ password+" )');");
	            out.println("window.location.href = 'hospitalhome';");
	            out.println("</script>");		
			}
	 
	}

}
