package com.app.RegisterLogin.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.RegisterLogin.entity.User;
import com.app.RegisterLogin.repository.UserRepository;
import com.app.RegisterLogin.service.userService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private userService userService;

	@GetMapping("/")
	public String showHomePage() {
		return "home";
	}

	@GetMapping("/login")
	public String showLoginPage() {
		return "login";
	}

	@GetMapping("/register")
	public String showRegisterPage() {
		return "register";
	}

	@PostMapping("/login")
    public String processLogin(@RequestParam("email") String email,
                               @RequestParam("password") String password,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        User user = userService.authenticate(email, password);
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/tasks"; // Redirect to tasks page after successful login
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid email or password.");
            return "redirect:/login"; // Redirect back to login page with error message
        }
    }

	@PostMapping("/register")
	public String processRegistration(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
		// Save the user data into the database
		userRepo.save(user);
		// Redirect to a confirmation page or wherever appropriate
		redirectAttributes.addFlashAttribute("message", "Registration successful!");
		return "redirect:/";
	}


}
