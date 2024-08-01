package org.hospital.appointment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.hospital.DBConnect.DBConnection;
import org.hospital.appointment.model.*;

public class AppointmentDao {
	
	public boolean addAppointment(Appointment app) {
		
		Connection con = DBConnection.getConn();
		String sql = "INSERT INTO APPOINTMENT (P_NAME , EMAIL , GENDER , AGE, D_ID , TIMINGS, HOSPITAL, DOA, DOR, REASON, H_ID) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		
		int i = 0;
		try {
			 PreparedStatement preparedStatement = con.prepareStatement(sql);
			 preparedStatement.setString(1, app.getP_name());
			 preparedStatement.setString(2, app.getEmail());
			 preparedStatement.setString(3, app.getGender());
			 preparedStatement.setString(4, app.getAge());
			 preparedStatement.setString(5, app.getD_id());
			 preparedStatement.setString(6, app.getTimings());
			 preparedStatement.setString(7, app.getHospital());
			 preparedStatement.setString(8, app.getDoa());
			 preparedStatement.setString(9, app.getDor());
			 preparedStatement.setString(10, app.getReason());
			 preparedStatement.setString(11, app.getH_id());
			 
			 i = preparedStatement.executeUpdate();
			 
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		if(i==0) {
			return false;
		}
		else {
			return true;
		}
	}
	

}
