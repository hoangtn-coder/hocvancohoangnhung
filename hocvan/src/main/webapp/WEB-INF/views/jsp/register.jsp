<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link href="<spring:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" />
<link href="<spring:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" />
<link href="<spring:url value="/resources/css/register.css"/>" rel="stylesheet" />
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-9 mx-auto">
				<div class="card card-signin flex-row my-5">
					<div class="card-img-left d-none d-md-flex">
						<!-- Background image for card set in CSS! -->
					</div>
					<div class="card-body">
						<h5 class="card-title text-center">Register</h5>
						<form class="form-signin">
							<div class="form-label-group">
								<input type="text" id="inputUserame" class="form-control"
									placeholder="Username" required autofocus> <label
									for="inputUserame">Username</label>
							</div>

							<div class="form-label-group">
								<input type="email" id="inputEmail" class="form-control"
									placeholder="Email address" required> <label
									for="inputEmail">Email address</label>
							</div>

							<hr>

							<div class="form-label-group">
								<input type="password" id="inputPassword" class="form-control"
									placeholder="Password" required> <label
									for="inputPassword">Password</label>
							</div>

							<div class="form-label-group">
								<input type="password" id="inputConfirmPassword"
									class="form-control" placeholder="Password" required> <label
									for="inputConfirmPassword">Confirm password</label>
							</div>

							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">Register</button>
							<a class="d-block text-center mt-2 small" href="#">Sign In</a>
							<hr class="my-4">
							<button class="btn btn-lg btn-google btn-block text-uppercase"
								type="submit">
								<i class="fab fa-google mr-2"></i> Sign up with Google
							</button>
							<button class="btn btn-lg btn-facebook btn-block text-uppercase"
								type="submit">
								<i class="fab fa-facebook-f mr-2"></i> Sign up with Facebook
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="<spring:url value="/resources/vendor/jquery/jquery.slim.js" />"></script>
	<script src="<spring:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>

