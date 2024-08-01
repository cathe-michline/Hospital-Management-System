<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="org.hospital.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!doctype html>
<html lang="en">
    
<head>
  <title>
   Profile Page
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
      <div class="navbar-translate">
        <a class="navbar-brand" href="home">
          Home </a>
        <button class="navbar-toggler toggled" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="sr-only">Toggle navigation</span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          <li class="dropdown nav-item">
            <a href="#" class=" nav-link" data-toggle="dropdown">
              <i class="material-icons">person</i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="home" >
              <i class="material-icons">local_hospital</i> Hospitals
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout" >
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
                <img src="https://www.kindpng.com/picc/m/163-1636340_user-avatar-icon-avatar-transparent-user-icon-png.png" alt="Circle Image" class="img-raised rounded-circle img-fluid">
              </div>
              <div class="name">
                <h3 class="title">Hello,  <% out.print(session.getAttribute("email")); %>
              </div>
            </div>
          </div>
        </div>
        <div class="description text-center">
        
        
        
         <%
        String email = session.getAttribute("email").toString();
        Connection con = DBConnection.getConn();
        String query = "select * from appointment where email = ? ORDER BY doa, timings";
        PreparedStatement statement = con.prepareStatement(query);
        statement.setString(1,email);
        int i=0;
        ResultSet resultSet = statement.executeQuery();
        String p_id,p_name,gender,age,d_name,timings,hospital,doa;
        timings = "";
        boolean results = false;      	
        			out.print("<div class='title'><h3>Your Appointments</h3></div><br>");
        	 		while (resultSet.next()) {
        		 		results = true;
         				
        		 		i++;
        				p_id = resultSet.getString("P_ID");
        				p_name = resultSet.getString("P_NAME");
        				gender = resultSet.getString("GENDER");
        				email = resultSet.getString("EMAIL");
        				age = resultSet.getString("AGE");
        				d_name = resultSet.getString("D_ID");
        				hospital = resultSet.getString("HOSPITAL");
        				doa = resultSet.getString("DOA");
        		
        		switch(resultSet.getString(7)){
        			case "1":
        				timings = "9AM TO 11AM";
        				break;
        			case "2":
        				timings = "11AM TO 1PM";
        				break;
        			case "3":
        				timings = "5PM TO 7PM";
        				break;
        			case "4":
        				timings = "7PM TO 9PM";
        				break;
        			}
        		out.print("</br><div class='card'><h5 class='card-header'>Appointment :" + i + "</h5><h5 class='card-body'>Patient ID : # " + p_id +"</h5><div class='card-body'><h5 class='card-title'> Patient Name:   "+p_name + "</h5><h5 class='card-title'> Hospital: "+ hospital +"</h5> <h5 class='card-title'> Doctor ID: " + d_name + " </h5><p class='card-text'>Age: " + age + "<br>Time of appointment: "+doa +"  ("+ timings + ")</p></div></div>");
       
        }
        	 		if(results == false){
        	 	        	 out.print("<h4>No appointments yet...</h4>");
        	 		}
        %>
        </div>
        <br>
        <div class="row text-center">
        <div class="col-sm-8 col-md-5 mx-auto">
            <a href="logout" class="btn btn-primary btn-upgrade btn-lg" >
              <i class="material-icons">logout</i> Logout?
            </a>
        </div>
        </div>
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