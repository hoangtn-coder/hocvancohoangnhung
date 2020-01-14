package hocvan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloController {
	
	@RequestMapping("/1")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index1() {
		return "index";
	}
	
	@RequestMapping("/coming-soon")
	public String comingSoon() {
		return "coming-soon";
	}

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String hello() {
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/login2", method = RequestMethod.GET)
	public String login2() {
		return "login2";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String Register() {
		return "register";
	}
}
