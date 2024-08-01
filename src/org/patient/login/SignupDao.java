package org.patient.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.patient.login.LoginBean;
import org.patient.login.DBConnection;

public class SignupDao {
		
	public boolean registerPatient(LoginBean employee) throws ClassNotFoundException {
		
		Connection con = DBConnection.getConn();
        String sql = "INSERT INTO USERS (EMAIL, PASSWORD) VALUES (?, ?);";

        int i = 0;
        try {
			 PreparedStatement preparedStatement = con.prepareStatement(sql);
			 preparedStatement.setString(1, employee.getEmail());
			 preparedStatement.setString(2, employee.getPassword());
			 
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
