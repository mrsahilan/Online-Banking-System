package com.nit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nit.entity.Users;
import com.nit.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    // Show login page
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }
    
    // show dash-board page
    @GetMapping("/dashboard")
    public String showDashboadPage() {
    	return "dashboard";
    }
    
    // show forget password page
    @GetMapping("/forgetPassword")
    public String showForgetPassword() {
    	return "forgetPassword";
    }

    // Show registration form
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new Users());
        return "register";
    }

    // Handle registration
    @PostMapping("/register")
    public String registerUser(Users user, Model model) {
        try {
            Users savedUser = userService.registerUser(user);
            model.addAttribute("fullName", savedUser.getFullName());
            model.addAttribute("userName", savedUser.getUserName());
            model.addAttribute("accountNumber", savedUser.getAccount().getAccountNumber());
            return "success";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "register";
        }
    }

    // Handle login
    @PostMapping("/login")
    public String login(@RequestParam String userName,
                        @RequestParam String password,
                        Model model,
                        HttpSession session) {
        try {
            Users user = userService.login(userName, password);
            session.setAttribute("loggedInUser", user);
            
            // Add attributes for dashboard (session-based)
            session.setAttribute("firstName", user.getFullName());
            session.setAttribute("userName", user.getUserName());
            session.setAttribute("dateOfBirth", user.getDateOfBirth().toString());
            session.setAttribute("accountNumber", user.getAccount().getAccountNumber());
            session.setAttribute("balance", user.getAccount().getBalance());

            return "dashboard";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "login";
        }
    }

    // Optional: Logout handler
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
