package hocvan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

//	@RequestMapping(value = { "/login", "/" })
//	public String login(@RequestParam(value = "error", required = false) final String error, final Model model) {
//		if (error != null) {
//			model.addAttribute("message", "Login Failed!");
//		}
//		return "login3";
//	}

	@RequestMapping(value = {"/login"})
	public String login(@RequestParam(required = false) String message, final Model model) {
		if (message != null && !message.isEmpty()) {
			if (message.equals("block_ip")) {
				model.addAttribute("message", "Your IP has been blocked! Pls try again in 30 minutes");
			}
			if (message.equals("timeout")) {
				model.addAttribute("message", "Time out");
			}
			if (message.equals("max_session")) {
				model.addAttribute("message", "This accout has been login from another device!");
			}
			if (message.equals("logout")) {
				model.addAttribute("message", "Logout!");
			}
			if (message.equals("error")) {
				model.addAttribute("message", "Login Failed!");
			}
		}
		return "login";
	}

	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}

	@RequestMapping("/user")
	public String user() {
		return "user";
	}

	@RequestMapping("/logout")
	public String logout(final Model model) {
		model.addAttribute("message", "Logged out!");
		return "login";
	}
}
