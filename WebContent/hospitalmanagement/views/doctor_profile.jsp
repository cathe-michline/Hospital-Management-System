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
        //System.out.print(date);
        //System.out.println(doctorname);
           
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
            <a href="#" class=" nav-link" data-toggle="dropdown">
              <i class="material-icons">person</i>
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
                <img src="https://t4.ftcdn.net/jpg/02/29/53/11/360_F_229531197_jmFcViuzXaYOQdoOK1qyg7uIGdnuKhpt.jpg" class="img-raised rounded-circle img-fluid">
              </div>
              <div class="name">
                <h3 class="title">Hello,
                </br> <% out.print(doctorname + "  ("+designation +" )" ); %></h3>
                <h3 class="title">Doctor ID : #<% out.print(email); %></h3>
              </div>
            </div>
          </div>
        </div>
        
        <!-- 
        <p class="card-text">Today</p>
        <hr style="height:0.5px;border-width:0;color:gray;background-color:gray">
         -->
        
        </br></br>
        <p class="card-text">Your appointments</p>
        <hr style="height:0.5px;border-width:0;color:gray;background-color:gray">
        
        <% 
        	//Today Appointments
        	String query1 = "SELECT * FROM APPOINTMENT WHERE D_ID='"+email+"' AND DOA ='"+date+"' ORDER BY TIMINGS";
        	PreparedStatement statement1 = con.prepareStatement(query1);
        	ResultSet resultSet1  = statement1.executeQuery();
    		String timings = "";
    		int i=0;
    		
    		if(resultSet1 == null){
        		out.print("<h4>No Appointments Found :(</h4>");
        	}
        	else{
        	while(resultSet1.next()){
        		String p_name = resultSet1.getString("P_NAME");
        		//System.out.print(p_name);
        		switch(resultSet1.getString("timings")){
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
        		String reason = resultSet1.getString("reason");
        		String age = resultSet1.getString("age");
        		String gender = resultSet1.getString("gender");
        		String p_id = resultSet1.getString("p_id");
        		String doa = resultSet1.getString("doa");
        		String p_email = resultSet1.getString("email");
        		out.print("<h4>Date : "+doa+"&nbsp;&nbsp;&nbsp;<span class='badge badge-pill badge-success'>Today</span></h4>");
        		out.print("</br><div class='card'><h5 class='card-header'>Appointment #" + ++i + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TIME :"+ timings+"</h5><h5 class='card-body'>Patient ID : # " + p_id +"</br> Patient Name:   "+p_name + "</br> Contact : "+p_email+"</br>Age: " + age + "</br></br> REASON : " + reason +"</br></br><button type='button' class='btn btn-secondary btn-lg'><a href='history?id="+p_name+"&d_id="+email+"&contact="+p_email+"'>View Patient's History</a></button></div>");
        	}
        	}
        	
    		
    		
    		
    		i=0;
	        
    		String query2 = "SELECT STR_TO_DATE(DOA,'%Y-%m-%d') AS doa,reason,p_name,p_id,age,gender,timings,email FROM APPOINTMENT WHERE D_ID='"+email+"' AND doa > CURDATE() order by DOA, TIMINGS";
	        statement1 = con.prepareStatement(query2);
	        //i=0;
	        resultSet1  = statement1.executeQuery();
        	//Rest of your Appointments
        	if(resultSet1 == null){
        		out.print("<h4>No Appointments Found :(</h4>");
        	}
        	else{
        	while(resultSet1.next()){
        		String p_name = resultSet1.getString("P_NAME");
        		//System.out.print(p_name);
        		switch(resultSet1.getString("timings")){
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
        		String reason = resultSet1.getString("reason");
        		String age = resultSet1.getString("age");
        		String gender = resultSet1.getString("gender");
        		String p_id = resultSet1.getString("p_id");
        		String doa = resultSet1.getString("doa");
        		String p_email = resultSet1.getString("email");
        		out.print("<h4>Date : "+doa+"&nbsp;&nbsp;&nbsp;<span class='badge badge-pill badge-warning'>Upcoming</span></h4>");
        		out.print("</br><div class='card'><h5 class='card-header'>Appointment #" + ++i + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TIME :"+ timings+"</h5><h5 class='card-body'>Patient ID : # " + p_id +"</br> Patient Name:   "+p_name + "</br> Contact : "+p_email+"</br>Age: " + age + "</br></br> REASON : " + reason +"</br></br><button type='button' class='btn btn-secondary btn-lg'><a href='history?id="+p_name+"&d_id="+email+"&contact="+p_email+"'>View Patient's History</a></button></div>");
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