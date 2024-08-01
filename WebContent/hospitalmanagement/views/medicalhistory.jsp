<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="org.hospital.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.util.Date" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter" %>

<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
        String email = session.getAttribute("did").toString();
		if(email == null){
			response.sendRedirect("doctorlogin");
		}
        String hospital = session.getAttribute("hospital").toString();

        String doctorname = "";
        String designation = "";
        Connection con = DBConnection.getConn();
        String query = "select d_name from "+hospital+" where d_id = "+email;
        PreparedStatement statement = con.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();
        while(resultSet.next()){
        	String arr= resultSet.getString(1);
        	String[] doctor = arr.split("-");
        	doctorname = doctor[0];
        	designation = doctor[1];
        	
        }
        
        LocalDate dateObj = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String date = dateObj.format(formatter);
        
        String p_name = request.getParameter("id");
        String p_email = request.getParameter("contact");
        //System.out.print(p_name);
                 
%>

<!doctype html>
<html lang="en">
    
<head>
  <title>
   Doctors Profile Page
  </title>
  <link rel="shortcut icon" href="https://image.flaticon.com/icons/png/512/3448/3448513.png">
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- Material Kit CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/material-kit/2.0.7/css/material-kit.css" rel="stylesheet" />
</head>

<body class="profile-page sidebar-collapse">
  <nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
    <div class="container">
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          <li class="dropdown nav-item">
            <a href="doctorprofile" class=" nav-link" data-toggle="dropdown">
              <i class="material-icons">person</i>
            </a>
          </li>
  
          <li class="nav-item">
            <a class="nav-link" href="dlogout" >
              <i class="material-icons">directions_walk</i> Logout
            </a>
          </li>   
        </ul>
      </div>
    </div>
  </nav>
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('https://images.unsplash.com/photo-1611416517780-eff3a13b0359?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=904&q=80');"></div>
  <div class="main main-raised">
    <div class="profile-content">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <div class="profile">
              <div class="avatar">
                <img src="https://t4.ftcdn.net/jpg/02/29/53/11/360_F_229531197_jmFcViuzXaYOQdoOK1qyg7uIGdnuKhpt.jpg" class="img-raised rounded-circle img-fluid">
              </div>
              <div class="name">
                <h3 class="title">Hello,
                </br> <% out.print(doctorname + "  ("+designation +" )" ); %>
              </div>
            </div>
          </div>
        </div>
        
        <h3 class="text-center">Patient : <%out.print(p_name); %> </h3>
        </br>
        <h4>Previous Appointments of the patient</h4>
        <% 
        	//Medical History
        	
        	String query1 = "SELECT * FROM APPOINTMENT WHERE D_ID='"+email+"' AND p_name = '"+p_name+"' and email='"+p_email+"' and STR_TO_DATE(doa,'%Y-%m-%d') < CURDATE() order by doa";
        	PreparedStatement statement1 = con.prepareStatement(query1);
        	ResultSet resultSet1  = statement1.executeQuery(); 
        	int i=0;
        	//System.out.print("CALLED"+resultSet1);
        	if(!resultSet1.isBeforeFirst()){
        		out.print("<h4>No Appointments Found :(</h4>");
        		//System.out.println("No appointments found");
        	}
        	while(resultSet1.next()){
        		String reason = resultSet1.getString("reason");
        		String age = resultSet1.getString("age");
        		String doa = resultSet1.getString("doa");
        		out.print("<hr style='height:0.5px;border-width:0;color:gray;background-color:gray'>");
        		out.print("<div class='card' style='width: 40rem;'><ul class='list-group list-group-flush'><li class='list-group-item'>Previously Visited on : "+doa+"</li><li class='list-group-item'>Reason : "+reason+"</li></ul></div>");
       
        	}
        %>  
        
        </br>
        </br>
        
        <h4>Upcoming Appointments</h4>
        
        <% 
        
        	//Medical History
        	resultSet1 = null;
        	query1 = "SELECT * FROM APPOINTMENT WHERE D_ID='"+email+"' AND p_name = '"+p_name+"' and email='"+p_email+"' and STR_TO_DATE(doa,'%Y-%m-%d') >= CURDATE() order by doa";
        	statement1 = con.prepareStatement(query1);
        	ResultSet resultSet2  = statement1.executeQuery();  
        	i=0;
        	
        	if(!resultSet2.isBeforeFirst()){
        		out.print("<h4>No Appointments Found :(</h4>");
        		//System.out.print("Called1");
        	}
        	else{
        		//System.out.print("Called2");
        		while(resultSet2.next()){
        		//System.out.print("Called");
        		String reason = resultSet2.getString("reason");
        		String age = resultSet2.getString("age");
        		String doa = resultSet2.getString("doa");
        		if(doa==date){
        			System.out.println("Visiting Today"+ doa +" & "+ date);
        			//out.print("<button type='button' class='btn btn-secondary' data-toggle='tooltip' data-placement='top' title='Tooltip on top'>Visiting today</button>");
        		}
        		out.print("<hr style='height:0.5px;border-width:0;color:gray;background-color:gray'>");
        		out.print("<div class='card' style='width: 40rem;'><ul class='list-group list-group-flush'><li class='list-group-item'>Next Visit on : "+doa+"</li><li class='list-group-item'>Reason : "+reason+"</li></ul></div>");
        	}
        	}
        %>  
              
        </div>
        <br>
    </div>
  </div>
  </div>
</body>


  
  <footer class="footer footer-default">
    <div class="container">
            <div class="copyright float-right">
        &copy;
        <script>
          document.write(new Date().getFullYear())
          
          var today = new Date();
		  var dd = String(today.getDate()).padStart(2, '0');
		  var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0
		  var yy = today.getFullYear();
		
		  today = yy+ '-' + mm + '-' + dd;
		
        </script>
      </div>
    </div>
  
  
  </footer>
  <!--   Core JS Files   -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/4.0.2/bootstrap-material-design.umd.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
  <!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.0/nouislider.min.js" type="text/javascript"></script>
  <!--  Google Maps Plugin    -->
  <!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/material-kit/2.0.7/js/material-kit.js" type="text/javascript"></script>
</html>