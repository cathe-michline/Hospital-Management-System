<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="org.hospital.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.util.Date" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.util.*" %>
<%@page import="java.time.format.DateTimeFormatter" %>

<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
        String h_id = session.getAttribute("h_id").toString();
        String hospital = session.getAttribute("hospital").toString();
        String[] splited = hospital.split("\\s+");
		String firstname = splited[0];

        Connection con = DBConnection.getConn();
        String query = "select * from "+ firstname;
        
        PreparedStatement statement = con.prepareStatement(query);
        ResultSet resultSet1 = statement.executeQuery();
        
        
        LocalDate dateObj = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String date = dateObj.format(formatter);

 %>  

<!doctype html>
<html lang="en">
    
<head>
  <title>
   <%out.print(firstname); %> - Hospital Page
  </title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
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

<body class="landing-page sidebar-collapse">
  <nav class="navbar navbar-color-on-scroll navbar-transparent fixed-top navbar-expand-lg" color-on-scroll="100">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="home">Home</a>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="material-icons">home_repair_service</i> <%out.print(hospital); %>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="logout" class="nav-link">
              <i class="material-icons">directions_walk</i> Logout
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('https://images-cdn.welcomesoftware.com/Zz0wNWViOTViNzRlMTMzMTNhZmJiYjc0MmMwOThlZDIzZg==/Surgeon%20and%20anesthetist%20doctor%20ER%20surgical%20team%20with%20medical%20clinic%20room%20background%20for%20emergency%20nursing%20care%20professional%20team.jpeg')">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h1 class="title"> <% out.print(hospital); %>.</h1>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="container">
      <div class="section text-center">
      
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto">
            <h2 class="title">Available Doctors</h2></br>
            
            <table class="table">
    			<thead>
        			<tr>
			            <th class="text-center">#</th>
			            <th>Name</th>
			            <th>Speciality</th>
			            <th>DoctorID</th>

        			</tr>
    			</thead>
    			<% 
    			int i=1;
    			HashMap<String, String> doctor_map = new HashMap<String, String>();
    			  
    			while(resultSet1.next()){
    	        
    	        String d_name = resultSet1.getString("D_NAME");
    	        String d_id = resultSet1.getString("D_ID");
    	        String[] doctor = d_name.split("-");
            	String doctorname = doctor[0];
            	String speciality = doctor[1];
            	doctor_map.put(d_id,doctorname);
    	        
    	        out.print("<tbody><tr><td class='text-center'>"+ i++ +"</td><td>"+doctorname+"</td><td>"+ speciality +"</td><td class='text-right'>"+d_id+"</td>");		
    	        //out.print("<button type='button' rel='tooltip' class='btn btn-success' title='Edit Doctor Details'><i class='material-icons'>edit</i></button>");	
    	        //out.print("<button type='button' rel='tooltip' class='btn btn-danger'><i class='material-icons'>close</i></button>");		
    	        out.print("</tr></tbody>");		
    	        	
    	        }
                   
            %>
				</table>
					<button type="button" rel="tooltip" class="btn btn-primary" id="mySizeChart"><i class="material-icons">person_add</i>&nbsp; ADD DOCTOR</button><br>
					<!-- Modal -->
						<div id="mySizeChartModal" class="ebcf_modal">
							<div class="ebcf_modal-content">
								<span class="ebcf_close">&times;</span>
								<h4>ADD DOCTOR TO YOUR HOSPITAL</h4>
			    			<!-- Model Content -->
			    					<div class="modal-body">
					                   	 <form class="form" method="POST" action="addDoctor?hospital=${hospital}&h_id=${h_id}">
					                        <div class="card-body">
					                            <div class="form-group bmd-form-group">
					                                <div class="input-group">
					                                    <input type="text" name="doctor" class="form-control" placeholder="Doctor Name and Speciality...">
					                                </div>
					                            </div>
					
					                            <div class="form-group bmd-form-group">
					                                <div class="input-group">
					                                    <input type="text" name="id" class="form-control" placeholder="Doctor ID...">
					                                </div>
					                            </div>
					                            <input type="submit" class="btn btn-success btn-raised" id="submit" name="submit" value="Add Doctor">
					                           </div>
					                    </form>
					                </div>
			    			<!-- Model Content End -->
			 			 </div>
					</div>
				<!-- End Modal -->
          	</div>
        </div>

        
        <hr>
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto">
            <h2 class="title">Appointments for the Week</h2>
            <h5 class="description"></h5>
          </div>
        </div>
        
        </br>
        <table class="table">
    			<thead>
        			<tr>
			            <th class="text-center">#</th>
			            <th>Patient Name</th>
			            <th>Age</th>
			            <th>Gender</th>
			            <th>Timings</th>
			            <th>Doctor</th>
			            <th>Reason</th>
			            <th>Day</th>
        			</tr>
    			</thead>
    			<% 
    				i=1;
            		String query2 = "SELECT D_ID,P_NAME,GENDER,AGE,TIMINGS,REASON,DAYOFWEEK(STR_TO_DATE(doa,'%Y-%m-%d')) AS DOA FROM APPOINTMENT WHERE H_ID ='"+h_id+"' AND STR_TO_DATE(doa,'%Y-%m-%d') BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 6 DAY)";
            		System.out.println(query2);
        			PreparedStatement statement2 = con.prepareStatement(query2);
        			ResultSet rs = statement2.executeQuery();
        			
	    			while(rs.next()){
	    	        
	    	        String id = rs.getString("D_ID");
	    	        String p_name = rs.getString("P_NAME");
	    	        String gender = rs.getString("GENDER");
	    	        String age = rs.getString("age");
	    	        String timings = "";
		    	        switch(rs.getString("timings")){
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
		    	    String reason  = rs.getString("reason");
		    	    String doa = "";
		    	    	switch(rs.getString("DOA")){
		    	    	case "1":
		    	    		doa = "Sunday";
		    	    		break;
		    	    	case "2":
		    	    		doa = "Monday";
		    	    		break;
		    	    	case "3":
		    	    		doa = "Tuesday";
		    	    		break;
		    	    	case "4":
		    	    		doa = "Wednesday";
		    	    		break;
		    	    	case "5":
		    	    		doa = "Thursday";
		    	    		break;
		    	    	case "6":
		    	    		doa = "Friday";
		    	    		break;
		    	    	case "7":
		    	    		doa = "Saturday";
		    	    		break;
		    	    	}
		    	    	
		    	    	//System.out.println(p_name + doa);
	    	        
    	        
    	        out.print("<tbody><tr><td class='text-center'>"+ i++ +"</td><td>"+p_name+"</td><td>"+ age +"</td><td>"+ gender +"</td><td>"+timings+"</td><td>"+doctor_map.get(id)+"</td><td>"+reason+"</td><td>"+doa+"</td>");		
    	        //out.print("<button type='button' rel='tooltip' class='btn btn-success'><i class='material-icons'>edit</i></button>");	
    	        //out.print("<button type='button' rel='tooltip' class='btn btn-danger'><i class='material-icons'>close</i></button>");		
    	        out.print("</td></tr></tbody>");		
    	        	
    	        } %>
    			
			</table>
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
  <script>
//Get the modal
  var ebModal = document.getElementById('mySizeChartModal');

  // Get the button that opens the modal
  var ebBtn = document.getElementById("mySizeChart");

  // Get the <span> element that closes the modal
  var ebSpan = document.getElementsByClassName("ebcf_close")[0];

  // When the user clicks the button, open the modal 
  ebBtn.onclick = function() {
      ebModal.style.display = "block";
  }

  // When the user clicks on <span> (x), close the modal
  ebSpan.onclick = function() {
      ebModal.style.display = "none";
  }

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
      if (event.target == ebModal) {
          ebModal.style.display = "none";
      }
  }
  </script>
  <style>
		  /* The Modal (background) */
		.ebcf_modal {
		    display: none; /* Hidden by default */
		    position: fixed; /* Stay in place */
		    z-index: 1; /* Sit on top */
		    padding-top: 100px; /* Location of the box */
		    left: 0;
		    top: 0;
		    width: 100%; /* Full width */
		    height: 100%; /* Full height */
		    overflow: auto; /* Enable scroll if needed */
		    background-color: rgb(0,0,0); /* Fallback color */
		    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}
		
		/* Modal Content */
		.ebcf_modal-content {
		    background-color: #fefefe;
		    margin: auto;
		    padding: 20px;
		    border: 1px solid #888;
		    width: 80%;
		}
		
		/* The Close Button */
		.ebcf_close {
		    color: #aaaaaa;
		    float: right;
		    font-size: 28px;
		    font-weight: bold;
		}
		
		.ebcf_close:hover,
		.ebcf_close:focus {
		    color: #000;
		    text-decoration: none;
		    cursor: pointer;
		}
  </style>
</html>