<%@page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Chào mừng trở lại!</h1>
                  </div>
                  <form class="user" name='loginForm' action="<c:url value='j_spring_security_login' />" method='POST'>
                    <div class="form-group">
                      <!-- <input type="email" name='username' class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Nhập địa chỉ Email..."> -->
                      <input type="text" name='username' class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Nhập địa chỉ Email...">
                    </div>
                    <div class="form-group">
                      <input type="password" name='password' class="form-control form-control-user" id="exampleInputPassword" placeholder="Mật Khẩu">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" name="remember-me" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Nhớ mật khẩu</label>
                      </div>
                    </div>
                    <div class="form-group">
		            	<p>${message}</p>
                    </div>
                    <input name="submit" class="btn btn-primary btn-user btn-block" type="submit" value="Đăng Nhập" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <hr>
                    <a href="index.html" class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> Đăng nhập với Google
                    </a>
                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> Đăng nhập với Facebook
                    </a>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="forgot-password.html">Quên mật khẩu?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="register.html">Tạo tài khoản!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

	<%-- <h1>Spring MVC-Security Login Form</h1>
	<h2>${message}</h2>
	<form name='loginForm'
		action="<c:url value='j_spring_security_login' />" method='POST'>
		<table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='username'></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='password' /></td>
			</tr>
			<tr>
				<td>Remember Me:</td>
				<td><input type="checkbox" name="remember-me" /></td>
			</tr>
			<tr>
				<td colspan='2'><input name="submit" type="submit"
					value="login" /></td>
			</tr>
		</table>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form> --%>

</div>