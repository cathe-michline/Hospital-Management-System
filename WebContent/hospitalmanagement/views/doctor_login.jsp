<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="org.hospital.DBConnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Doctor Login</title>
  <link rel="shortcut icon" href="https://image.flaticon.com/icons/png/512/3448/3448513.png">
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons"  rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- Material Kit CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/material-kit/2.0.7/css/material-kit.css" rel="stylesheet" />

</head>



  <body class="login-page sidebar-collapse">
  <nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="https://demos.creative-tim.com/material-kit/index.html">
          Hospital Management System - Doctor Login </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="sr-only">Toggle navigation</span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          <li class="dropdown nav-item">
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" target="_blank">
               Know more about Us
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="#" target="_blank" data-original-title="Follow us on Twitter" rel="nofollow">
              <i class="fa fa-github"></i>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  
  <div class="page-header header-filter" style="background-image: url('https://www.verywellhealth.com/thmb/P0yKu3h7A4qOS3ZWBcnEFpYIUsk=/2123x1412/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-149616435-5984b720396e5a0011f638d3.jpg'); background-size: cover; background-position: top center;">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-md-6 ml-auto mr-auto">
          <div class="card card-login">
  
  
            <form class="form" action="Login?user=doctor" method="POST">
              
              <div class="card-header card-header-primary text-center">
                <h4 class="card-title">Login</h4> <br>
              </div>
              <br>
              <div class="card-body">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">person</i>
                    </span>
                  </div>
                  <input type="text" name="email" class="form-control" placeholder="Doctor ID" required>
                </div>
                <br>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">lock_outline</i>
                    </span>
                  </div>
                  <input type="password" name="password" class="form-control" placeholder="Password" required>
                </div>
                <br>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="material-icons">local_hospital</i></span>
                  </div>
                  <select class="form-control selectpicker" name="hospital" data-style="btn btn-link" required>
                      <option default>Select Hospital</option>
                      <%
				        Connection con = DBConnection.getConn();
				        Statement statement = con.createStatement();
				        String sql = "SELECT * FROM HOSPITAL";
				        ResultSet resultSet = statement.executeQuery(sql);
				        while (resultSet.next()) { 
				      %>
                      <option value= <% out.print(resultSet.getString(2));%>> <% out.print(resultSet.getString(2)); %> </option>
                     <%
                     	}
                     %>
                    </select>
                </div>
              </div>
              <br>
              <br>
              <br>
              <br>
              <div class="footer text-center">
              <input type="submit" name="submit" value ="Login" class="btn btn-primary btn-link btn-wd btn-lg" >
              </div>
            </form>   
            </div>     
          </div>
        </div>
      </div>
    </div>
    <footer class="footer">
      <div class="container">
        <nav class="float-left">
         </nav>
        <div class="copyright float-right">
          &copy;
          <script>
            document.write(new Date().getFullYear())
          </script>
          </div>
      </div>
    </footer>
  </div>
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
</body>

</html>