package hocvan.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.stereotype.Component;

import utils.RequestUtils;

@Component
public class CustomAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Autowired
	private LoginAttemptService loginAttemptService;

	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		// Login failed by BadCredentialsException (Username or password incorrect)
		if (exception.getClass().isAssignableFrom(BadCredentialsException.class)) {
			loginAttemptService.loginFailed(RequestUtils.getClientIP(request));
		}

		// Login failed by Blocked IP (quá 5 lần)
		if (exception.getMessage() != null && exception.getMessage().equals("block_ip")) {
			response.sendRedirect(request.getContextPath() + "/login?message=block_ip");
			return;
		}
		
		// Login failed by max session (đăng nhập 1 chỗ)
	    if (exception.getClass().isAssignableFrom(SessionAuthenticationException.class)) {
	      response.sendRedirect(request.getContextPath() + "/login?message=max_session");
	      return;
	    }
	    
		response.sendRedirect(request.getContextPath() + "/login?message=error");
	}

}
