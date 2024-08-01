<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">


<head>
  <title>Hospital Management System</title>
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
  
 
  <nav class="navbar navbar-color-on-scroll navbar-transparent fixed-top navbar-expand-lg" color-on-scroll="100">
    <div class="container">
      
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="profile" class="nav-link">
              <i class="material-icons">person</i> Hello, <% out.print(session.getAttribute("email")); %>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="material-icons">local_hospital</i> Hospitals
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
  <div class="page-header header-filter" data-parallax="true">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand text-center">
            <h2 class='title text-center'>Hospital Management System</h2>
            <h4><i>Leading you to better Life..</i></h4>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="container">
        <!-- Card -->
      <div class="section text-center">
        <h2 class="title">Hospitals</h2>
          <div class="card">
  			<img class="card-img-top"  src=" https://a0.muscache.com/pictures/miso/Hosting-27318036-Amenities/original/a9fb8703-0a04-461d-aba7-ba2820a355d0.jpeg" width="200" height="500" alt="First slide">
  				<div class="card-body">
    				<h3><a href="#" style="color:black;">
                      <i class="material-icons">location_on</i>
                     Grace Kennett Foundation Hospital, Madurai.</a>
                    </h3>
  				</div>
			</div>
          
          <div class="card">
  			<img class="card-img-top" src="https://www.vadamalayan.org/wp-content/uploads/2015/09/img-banner4.jpg" width="200" height="500" alt="Second slide" >
  				<div class="card-body">
    				<h3><a href="<%= request.getContextPath() %>/vadamalayan" style="color:black;">
                      <i class="material-icons">location_on</i>
                      Vadamalayan Hospital, Chockikulam.</a>
                    </h3>
  				</div>
			</div>
			
			<div class="card">
  			<img class="card-img-top"  src="https://www.thehindu.com/news/cities/Madurai/9wru5d/article27947560.ece/alternates/FREE_615/MA15MDUGRH" width="200" height="500" alt="Third Slide" >
  				<div class="card-body">
    				<h3><a href="#" style="color:black;">
                      <i class="material-icons">location_on</i>
                     Government Rajaji Hospital, Alwarpuram.</a>
                    </h3>
  				</div>
			</div>
			
			<div class="card">
  			<img class="card-img-top"  src="https://images1-fabric.practo.com/practices/758131/apollo-hospital-madurai-59c51e5e7c695.jpg" width="200" height="500" alt="Fourth slide">
  				<div class="card-body">
  					<h3><a href="apollo" style="color:black;">
                      <i class="material-icons">location_on</i>
                     Apollo MultiSpeciality Hospital, KK Nagar.</a>
                    </h3>		
  				</div>
			</div>
          </div>
          <!-- End Card -->
      </div>
    </div>
  </div>
  <footer class="footer footer-default">
    <div class="container">
      <div class="copyright float-right">
        <script>document.write(new Date().getFullYear())</script>
      </div>
    </div>
  </footer>
  <!--   Core JS Files   --></footer>
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
  
  <script>
    $(document).ready(function() {
      //init DateTimePickers
      materialKit.initFormExtendedDatetimepickers();

      // Sliders Init
      materialKit.initSliders();
    });


    function scrollToDownload() {
      if ($('.section-download').length != 0) {
        $("html, body").animate({
          scrollTop: $('.section-download').offset().top
        }, 1000);
      }
    }
  </script>
</body>

</html>