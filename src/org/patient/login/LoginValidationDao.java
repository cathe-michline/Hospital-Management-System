package org.patient.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.patient.login.LoginBean;

public class LoginValidationDao {
	String name = "";
	ResultSet rs = null;
	String dbCon = "jdbc:mysql://localhost:3306/ZOHO";
	String dbUser = "root";
	String dbPassword = "Catherose01@";
	Connection con = DBConnection.getConn();
	
		//Execute SQL Query for Login Validation
		public boolean executeQuery(LoginBean loginBean, String sql, int isHospital) {
			boolean status = false;
			try {
				PreparedStatement preparedStatement = con.prepareStatement(sql);
				 preparedStatement.setString(1, loginBean.getEmail());
			     preparedStatement.setString(2, loginBean.getPassword());
				 rs = preparedStatement.executeQuery();
				 
				 //Check if Hospital -> Set HOSPITAL NAME
				 if(isHospital == 0) {
					 	return rs.next();
				 }
				 else {	
					 while(rs.next()) {
						 name = rs.getString("HOSPITAL");
						 return true;
					 }
				 }
			}
			catch (SQLException e) {
		        printSQLException(e);
		    }
			return status;
		}
	
		//Patient Validation
		public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
			String sql = "select * from users where email = ? and password = ? ";
			return executeQuery(loginBean,sql,0);
		}
		
		//Doctor Validation
		public boolean doctor_validate(LoginBean loginBean, String hospital) throws ClassNotFoundException {
			String sql = "select * from "+  hospital +" where d_id = ? and password = ?";
			return executeQuery(loginBean,sql,0);
		}
		
		//Hospital Validation
		public boolean hospital_validate(LoginBean loginBean) throws SQLException  {
	        String sql = "SELECT * FROM HOSPITAL WHERE H_ID = ? AND PASSWORD = ?";
	        return executeQuery(loginBean,sql,1);
	    }
		
		//Return name of the Hospital
		public String getHospitalName() {
			return name;
		}
		
		//Print Exception
		private void printSQLException(SQLException ex) {
	        for (Throwable e: ex) {
	            if (e instanceof SQLException) {
	                e.printStackTrace(System.err);
	                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
	                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
	                System.err.println("Message: " + e.getMessage());
	                Throwable t = ex.getCause();
	                while (t != null) {
	                    System.out.println("Cause: " + t);
	                    t = t.getCause();
	                }
	            }
	        }
	    }
}
