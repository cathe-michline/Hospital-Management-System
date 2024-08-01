<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<body>
	<button class="btn btn-round" data-bs-toggle="modal" data-bs-target="#loginModal">
	    Login<i class="material-icons">assignment</i>
	
	</button>
	
	<div class="modal fade" id="loginModal" tabindex="-1" role="">
	    <div class="modal-dialog modal-login" role="document">
	        <div class="modal-content">
	            <div class="card card-signup card-plain">
	                <div class="modal-header">
	                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
	                </div>
	                <div class="modal-body">
	                    <form class="form" method="" action="">
	                        <div class="card-body">
	                            <div class="form-group bmd-form-group">
	                                <div class="input-group">
	                                    <span class="input-group-addon">
	                                        <i class="material-icons">face</i>
	                                    </span>
	                                    <input type="text" class="form-control" placeholder="First Name...">
	                                </div>
	                            </div>
	
	                            <div class="form-group bmd-form-group">
	                                <div class="input-group">
	                                    <span class="input-group-addon">
	                                        <i class="material-icons">email</i>
	                                    </span>
	                                    <input type="text" class="form-control" placeholder="Email...">
	                                </div>
	                            </div>
	
	                            <div class="form-group bmd-form-group">
	                                <div class="input-group">
	                                    <span class="input-group-addon">
	                                        <i class="material-icons">lock_outline</i>
	                                    </span>
	                                    <input type="password" placeholder="Password..." class="form-control">
	                                </div>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer justify-content-center">
	                    <a href="#pablo" class="btn btn-primary btn-link btn-wd btn-lg">Get Started</a>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>


</html>