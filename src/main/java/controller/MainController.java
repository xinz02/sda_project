package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
    public String index() {
        return "index";
    }
	
	@GetMapping("/role")
    public String selectRole() {
        return "index";
    }
	
	
	@PostMapping("/admin")
    public String admin(HttpServletRequest request, HttpServletResponse response) {
		// Get the session object from the request
        HttpSession session = request.getSession();

        // Set an attribute in the session
        String attributeName = "role";
        String attributeValue = "admin";
        session.setAttribute(attributeName, attributeValue);
        System.out.print("admin");
        return "redirect:/home";
    }
	
	@PostMapping("/driver")
    public String login(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

        // Set an attribute in the session
        String attributeName = "role";
        String attributeValue = "driver";
        session.setAttribute(attributeName, attributeValue);
        session.setAttribute("driverName", "Amy Tan");
        System.out.print("driver");
        return "redirect:/home";
    }
	
	@GetMapping("/home")
	public String home() {
		return "main";
	}
}
