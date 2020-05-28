package hocvan.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {
	private static Logger logger = Logger.getLogger(DashboardController.class);

	@RequestMapping("/dashboard")
	public String user() {
		return "dashboard";
	}
	
	@RequestMapping("/404")
	public String error404() {
		return "404";
	}
	
	@RequestMapping("/tables")
	public String table() {
		return "tables";
	}
}
