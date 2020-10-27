package hocvan.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	private static Logger logger = Logger.getLogger(LoginController.class);

//	@RequestMapping(value = { "/login", "/" })
//	public String login(@RequestParam(value = "error", required = false) final String error, final Model model) {
//		if (error != null) {
//			model.addAttribute("message", "Login Failed!");
//		}
//		return "login3";
//	}

	@RequestMapping(value = {"/login"})
	public String login(@RequestParam(required = false) String message, final Model m) {
		if (message != null && !message.isEmpty()) {
			if (message.equals("block_ip")) {
				m.addAttribute("message", "IP của bạn đã bị chặn! Vui lòng thử lại sau 30 phút");
			}
			if (message.equals("timeout")) {
				m.addAttribute("message", "Time out");
			}
			if (message.equals("max_session")) {
				m.addAttribute("message", "Tài khoản này đã được đăng nhập từ một thiết bị khác!");
			}
			if (message.equals("logout")) {
				m.addAttribute("message", "Đăng xuất!");
			}
			if (message.equals("error")) {
				m.addAttribute("message", "Đăng nhập thất bại!");
			}
		}
		return "admin/login";
	}

	@RequestMapping("/logout")
	public String logout(final Model model) {
		model.addAttribute("message", "Logged out!");
		return "admin/login";
	}
}
