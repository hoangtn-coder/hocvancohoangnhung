<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link href="<spring:url value="/resources/vendor/fontawesome-free/css/all.css"/>" rel="stylesheet" />
<link href="<spring:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" />
<link href="<spring:url value="/resources/css/login.css"/>" rel="stylesheet" />
</head>
<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">Sign In</h5>
						<form class="form-signin">
							<div class="form-label-group">
								<input type="email" id="inputEmail" class="form-control"
									placeholder="Email address" required autofocus> <label
									for="inputEmail">Email address</label>
							</div>

							<div class="form-label-group">
								<input type="password" id="inputPassword" class="form-control"
									placeholder="Password" required> <label
									for="inputPassword">Password</label>
							</div>

							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" class="custom-control-input"
									id="customCheck1"> <label class="custom-control-label"
									for="customCheck1">Remember password</label>
							</div>
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">Sign in</button>
							<hr class="my-4">
							<button class="btn-google btn btn-lg btn-block text-uppercase"
								type="submit">
								<i class="fab fa-google mr-2"></i> Sign in with Google
							</button>
							<button class="btn btn-lg btn-facebook btn-block text-uppercase"
								type="submit">
								<i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script
		src="<spring:url value="/resources/vendor/jquery/jquery.slim.js" />"></script>
	<script
		src="<spring:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	
</body>

</html>

