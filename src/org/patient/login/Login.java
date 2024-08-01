package org.patient.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginValidationDao dao = new LoginValidationDao();
	LoginBean bean = new LoginBean();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		String user = request.getParameter("user").toString(); //To find id the user is hospital/patient/doctor
		//System.out.println("hospital Called2" + user);
		
		String email = request.getParameter("email").toString();
		String password = request.getParameter("password").toString();
		
		bean.setEmail(email);
		bean.setPassword(password);
		
		//If User is DOCTOR
		if(user.equals("doctor")) {
			String hospital = request.getParameter("hospital").toString();
			String[] splited = hospital.split("\\s+");
			String firstname = splited[0];
			try {
	            if (dao.doctor_validate(bean,hospital)) {
	            		HttpSession session = request.getSession(true);
	            		session.putValue("did", email);
	            		session.putValue("hospital", firstname);
	            		response.sendRedirect("doctorprofile");
	            } else {
	            	out.println("<script type=\"text/javascript\">");
				    out.println("alert('User or password incorrect');");
				    out.println("window.location.href = 'doctorlogin';");
				    out.println("</script>");
	            }
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
		}
		
		//If User is PATIENT
		else if(user.equals("patient")) {
			try {
	            if (dao.validate(bean)) {
	            	HttpSession session = request.getSession(true);
	            	session.putValue("email", email);
	            	response.sendRedirect("home");
	            } else {
	            	out.println("<script type=\"text/javascript\">");
				    out.println("alert('User or password incorrect');");
				    out.println("window.location.href = 'patientlogin';");
				    out.println("</script>");
	            }
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
		}
		
		//If User is Hospital
		else if(user.equals("hospital")) {
			try {
				if(dao.hospital_validate(bean)) {
					HttpSession session = request.getSession(true);
	            	session.putValue("h_id" , email);
	            	session.putValue("hospital", dao.getHospitalName());
	            	response.sendRedirect("hospitalhome");
	            	
				}
				else {
					out.println("<script type=\"text/javascript\">");
				    out.println("alert('User or password incorrect');");
				    out.println("window.location.href = 'hospitallogin';");
				    out.println("</script>");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
	}

}
