<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="org.hospital.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Arrays" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 	
	String mail = session.getAttribute("email").toString();
	if(mail== null){
		response.sendRedirect("patientlogin");
	}
	String hospital = request.getParameter("hospital").toString();
	String h_id = request.getParameter("h_id").toString();
	String[] splited = hospital.split("\\s+");
	String firstname = splited[0];  //To get the firstname of the hospital FOR TABLE NAME
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>
    Make your Appointment
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
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
  
</head>

<body class="landing-page sidebar-collapse">
<nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="home">
          Appointment Page - <%out.print(request.getParameter("hospital").toString()); %>
           </a>
        <button class="navbar-toggler toggled" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="sr-only">Toggle navigation</span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a href="profile" class="nav-link">
              <i class="material-icons">person</i> Hello, <% out.print(session.getAttribute("email")); %>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="home" >
              <i class="material-icons">home</i> Home
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


  </nav>
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('https://wallpaperaccess.com/full/340597.jpg')">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h1 class="title">Make an Appointment with us :) </h1>
          <h4>Don't worry your information is safe with us</h4>
          <br>
        </div>
      </div>
    </div>
  </div>



  <div class="main main-raised">
    <div class="container">
        <div class="section section-contacts">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto">
            <h2 class="text-center title">Please provide your information below.</h2>
            
            
            
            <form  action="<%= request.getContextPath() %>/Appointment" class="contact-form" method="POST">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label class="bmd-label-floating">Your Name</label>
                    <input type="text" name="name" class="form-control" required>
                  </div>
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label class="bmd-label-floating">Your Email</label><br>
                    <input type="email" name="email" class="form-control" value="${email.toString()}" disabled="disabled" >
                  </div>
                </div>
              </div>
              <br>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-check form-check-radio">
                    <div class="form-group">
                      <label for="form-check-label">Gender</label>  <BR>                
                        <input  data-style="btn btn-link" type="radio" name="gender" value="m" required>&nbsp;Male
                        <input data-style="btn btn-link" type="radio" name="gender" value="f" required>&nbsp;Female
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label class="bmd-label-floating">Your Age</label>
                    <input type="number"  name="age" class="form-control" required>
                  </div>
                </div>
              </div>
              </br>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                  <label for="exampleFormControlSelect1">Select Doctor</label>
                      <select class="form-control selectpicker" name="doctor" data-style="btn btn-link" id="d_id" required>
                      <option default>Select Doctor</option>
                                    <%
							        Connection con = DBConnection.getConn();
							        Statement statement = con.createStatement();
							        String sql = "SELECT * FROM ";
							      
							        ResultSet resultSet = statement.executeQuery(sql+firstname);
							        while (resultSet.next()) { %>
                      
                      <option value= <% out.print(resultSet.getString(1));%>><% out.print(resultSet.getString(2)); %></option><%}%>
                    </select>
                  </div>
                </div>
              </div>
			  </br>
			  
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                      <label for="exampleFormControlSelect1">Select Timings</label>
                      <select class="form-control selectpicker" name="timings" data-style="btn btn-link" id="timings" required>
                      <option default>Select Timing</option>  
                      <option value="1">1st SLOT (9AM-11AM)</option>
                        <option value="2">2nd SLOT (11AM-1PM)</option>
                        <option value="3">3rd SLOT(5PM-7PM)</option>
                        <option value="4">4th SLOT(7PM-9PM)</option>
                      </select>
                  </div>
                </div>
              </div>
              </br>
			<div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                  <label for="exampleFormControlSelect1">Select Date of Appointment</label>
                  	<!-- Date of Appointment -->
					<input type="date" id="date" name="doa" class="form-control" placeholder="Select date">
				  </div>
				</div>			
				
				<div class="col-md-6">
                  <div class="form-group">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="button" class="btn btn-primary btn-raised" name="submit" value="Check" onclick="checkstatus()"><p>&nbsp;Check if the date is available<span id="warning" style="color:red"></span><span id="ok" style="color:green"></span></p>
				  </div>
				</div>
			  </div>              
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label class="bmd-label-floating">Reason for Appointment</label>
                    <input type="text"  name="reason" class="form-control" required>
                  </div>
                </div>
              </div>
              </br>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                  <label class="bmd-label-floating">Date of Registration : </label><br>
                    <input type="text" name="dor" class="form-control" id="dor" value=  disabled="disabled" >
				  </div>
				</div>
			</div>
              </br>
              <div class="row">
                <div class="col-md-4 ml-auto mr-auto text-center">
                  <input type="submit" class="btn btn-primary btn-raised" id="submit" name="submit" value="Book Appointment">
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
  <footer class="footer footer-default">
    <div class="container">
            <div class="copyright float-right">
        &copy;
        <script>
        
        document.write(new Date().getFullYear())
        
        //Date of Registration
        var today = new Date();
		var dd = String(today.getDate()).padStart(2, '0');
		var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0
		var yy = today.getFullYear();
		
		today = yy+ '-' + mm + '-' + dd;
		
		//document.write(today);
		document.getElementById('dor').innerHTML = today;
		document.getElementById('dor').value = today
		
		function returnToday(){ 
			return today;
		}
		
		console.log("Hey");
		var val1 = document.getElementById('date');
		var val2 = document.getElementById('timings');
		var val3 = document.getElementById('d_id');
		
		//System.out.println(allValues);
		document.getElementById("submit").disabled = true;
		
		function checkstatus(){
			var date = val1.value;
			var d_id = val3.value;
			var timings = val2.value;
			var statusValue = 0;
			
			$.ajax({
                type: "GET",
                url: "checkStatus",
                data: {date: date, timings: timings, d_id: d_id},
                success: function (status) {
  
                	if(status == "Doctor is not Available"){
                		document.getElementById("submit").disabled = true;
        				document.getElementById("warning").innerHTML = "Not Available :(";
        				document.getElementById("ok").innerHTML = " "
                	}
                	else{
                		document.getElementById("submit").disabled = false;
        				document.getElementById("warning").innerHTML = " ";
        				document.getElementById("ok").innerHTML = "Available :)"

                	}
                	}
            });
		}
		
        </script>
      </div>
    </div>
  
  
  </footer>
  <!--   Core JS Files   -->
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
</body>

</html>