package hocvan.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {
	private static Logger logger = Logger.getLogger(DashboardController.class);

	@RequestMapping("/dashboard")
	public String user() {
		return "admin/dashboard";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		return "admin/admin";
	}
	
	@RequestMapping("/charts")
	public String charts() {
		return "admin/charts";
	}
	
	@RequestMapping("/error")
	public String error() {
		return "admin/error";
	}
	
	@RequestMapping("/tables")
	public String table() {
		return "admin/tables";
	}
}
