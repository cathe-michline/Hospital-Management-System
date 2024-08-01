<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>
   <% 	String hospital = request.getAttribute("hospital").toString();
   		String h_id = request.getAttribute("h_id").toString();
   
   		out.print(hospital);
   		
   %>
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

<body class="landing-page sidebar-collapse">
  <nav class="navbar navbar-color-on-scroll navbar-transparent fixed-top navbar-expand-lg" color-on-scroll="100">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="home">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="sr-only">Toggle navigation</span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="material-icons">home_repair_service</i> < %out.print(hospital); %>
            </a>
          </li>
          <li class="nav-item">
            <a href="profile" class="nav-link">
              <i class="material-icons">person</i> <% out.print(session.getAttribute("email")); %>
            </a>
          </li>
          <li class="nav-item">
            <a href="#department" class="nav-link">
              <i class="material-icons">local_hospital</i> Departments
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="material-icons">directions_walk</i> Logout
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('https://chennai.apollohospitals.com/wp-content/uploads/2020/12/vanagaram.png')">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h1 class="title">Apollo MultiSpeciality Hospitals.</h1>
          <h4> 80 Feet Rd, <br>KK Nagar, <br>Madurai, Tamil Nadu 625020</h4>
          <br>
          <span class="badge badge-success">&nbsp;&nbsp;&nbsp;&nbsp;Open 24 hours&nbsp;&nbsp;&nbsp;&nbsp;</span><br><br>
          <button class="btn btn-warning btn-round">COVID-19 Alert</button> <br>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="container">
      <div class="section text-center">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto">
            <h2 class="title">About US</h2>
            <h5 class="description">Apollo Speciality Hospitals, Madurai was founded in 1997. 
            The 300-bed hospital provides affordable and quality critical care to communities in South Tamil Nadu. 
            The state-of-the-art bio-medical equipment complemented by highly-skilled staff ensure high standards of care at Apollo Specialty Hospitals, Madurai. 
            The hospital places special emphasis on quality time between patients, doctors and nurses. The hospital has an overall success rate of 98% and sees an average of 15,000 patients a year. 
            A 24-hour panel of super-specialists are present at the hospital. This panel is equipped to tackle any emergency and honour the hospital’s commitment to providing all services under one roof
            </h5>
          </div>
        </div>
       <!-- Departments -->
      <div class="section text-center" id="department">
        <h2 class="title">Our Departments</h2>
        <div class="team">
          <div class="row">
            <div class="col-md-4">
              <div class="team-player">
                <div class="card card-plain">
                  <div class="col-md-6 ml-auto mr-auto">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkCJJ3q6JQSKWWW_whA1V2y5TLH47Y6Mz3yA&usqp=CAU" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                  </div>
                  <h4 class="card-title">Anestheology
                    <br>
                  </h4>
                  <div class="card-body">
                    <p class="card-description">Well researched anesthetic drugs with minimum disturbance on the body systems and maximum safety and comfort for the patients are provided thereby ensuring minimum ICU and hospital stay.</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="team-player">
                <div class="card card-plain">
                  <div class="col-md-6 ml-auto mr-auto">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEZdLgfZmjGO0RmQ2mZx7pfR7QsNTqzIxvkg&usqp=CAU" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                  </div>
                  <h4 class="card-title">Cardiology
                    <br>
                  </h4>
                  <div class="card-body">
                    <p class="card-description">Our hi-tech cardiology department, comprising a sophisticated ICCU, cath lab and state-of-the-art Cardio thoracic and vascular surgical theatre provides diagnostic and treatment service.
</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="team-player">
                <div class="card card-plain">
                  <div class="col-md-6 ml-auto mr-auto">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTr93gsodYba1syKbVGmHiOygRQ1zMgjerPA&usqp=CAU" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                  </div>
                  <h4 class="card-title">Neurology
                    <br>
                  </h4>
                  <div class="card-body">
                    <p class="card-description">EEG, Sleep lab, CT, ScanDoppler studies, NCS, EMG, Evoke potential studies are the various diagnaostic facilities available with us.Also we have far and wide experice in treating efficiently.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="team-player">
                    <div class="card card-plain">
                      <div class="col-md-6 ml-auto mr-auto">
                        <img src="data:image/jpeg;base64,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" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                      </div>
                      <h4 class="card-title">Dermatology
                        <br>
                      </h4>
                      <div class="card-body">
                        <p class="card-description">Expertise in clinical dermatology, diverse areas of dermatologyRadiofrequency, electrosurgical procedures for warts, cutaneous tags, moles etc., along with various modern features available with us.</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="team-player">
                    <div class="card card-plain">
                      <div class="col-md-6 ml-auto mr-auto">
                        <img src="https://medlineplus.gov/images/Hyperglycemia.jpg" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                      </div>
                      <h4 class="card-title">Diabetology
                        <br>
                      </h4>
                      <div class="card-body">
                        <p class="card-description">A major manifestations of Diabetes is the Diabetic Foot.“For every 21 seconds someone is diagnosed with Diabetes and for every 30 seconds a leg is lost to Diabetes”. A preventive measure, DFCU is launched.</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="team-player">
                    <div class="card card-plain">
                      <div class="col-md-6 ml-auto mr-auto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZsHQlwX3BFYBZO7Wl6uiJPOLs8PVdBv6HOMZLjGHKHUji1PeAiNBggPi6kRpFHW5Gizs&usqp=CAU" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                      </div>
                      <h4 class="card-title">Orthopaedics
                        <br>
                      </h4>
                      <div class="card-body">
                        <p class="card-description">Traumatic problems in the form of domestic falls, two wheeler and pedestrian accidents happening within the city limits and high velocity road traffic accidents on the highways are treated very efficiently.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-4">
                  <div class="team-player">
                    <div class="card card-plain">
                      <div class="col-md-6 ml-auto mr-auto">
                        <img src="data:image/png;base64,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" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                      </div>
                      <h4 class="card-title">Gynaecology
                        <br>
                      </h4>
                      <div class="card-body">
                        <p class="card-description"> Apollo Fertility considers the emotional well- being of our patients to be as important as the clinical standards delivered. Born with the belief that child birth is a celebration and not a disease, Apollo Fertility understands the toll that difficulty in conception can take on you.</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="team-player">
                    <div class="card card-plain">
                      <div class="col-md-6 ml-auto mr-auto">
                        <img src="https://images1-fabric.practo.com/dr-sachin-kaushik-s-mindpeace-psychiatry-deaddiction-clinic-panchkula-1461255014-5718fb66e8a64.jpg" alt="" class="img-raised rounded-circle img-fluid">
                      </div>
                      <h4 class="card-title">Neuro Psychiatry
                        <br>
                      </h4>
                      <div class="card-body">
                        <p class="card-description">HypnotherapyNarcoanalysisPsychotherapy which comprises both Supportive psychotherapy and Interpersonal Psychotherapy are the various adavanced treatment modalities available with us.</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="team-player">
                    <div class="card card-plain">
                      <div class="col-md-6 ml-auto mr-auto">
                        <img src="https://www.gleneagles.com.my/ResourcePackages/Gleneagles/assets/dist/images/accident-emergency/AccidentEmergency/accident_and_emergency_img01.jpg?ts=1" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                      </div>
                      <h4 class="card-title">Accident and Emergency
                        <br>
                      </h4>
                      <div class="card-body">
                        <p class="card-description">We are the pioneers in modern day emergency care. Providing international standard care in the field of Emergency and Trauma care 24 hours x 365 days for faster recoveries.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>                                              
              <div class="row">
                <div class="col-md-4 ml-auto mr-auto text-center">
                  <button class="btn btn-primary btn-raised"><a href="Appointment?hospital=${hospital}&h_id=${h_id}" style="color:white;">
                    Make an Appointment</a>
                  </button>
                </div>
            </div>
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
  </body>
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