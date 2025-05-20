package com.nit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nit.entity.Account;
import com.nit.entity.Users;
import com.nit.service.AccountService;
import com.nit.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {

	private final UserService userService;
	private final AccountService accountService;

	// === ADMIN LOGIN ===

	@GetMapping("/adminLogin")
	public String showAdminLoginForm(Model model) {
		return "adminLogin"; // JSP page for admin login
	}

	@PostMapping("/adminLogin")
	public String processAdminLogin(@RequestParam("adminUserName") String username,
			@RequestParam("adminPassword") String password, HttpSession session, Model model) {

		// Hardcoded credentials (You can improve this later with DB or properties)
		if ("sahil".equals(username) && "sahil@123".equals(password)) {
			session.setAttribute("isAdmin", true);
			return "redirect:/adminDashboard";
		} else {
			model.addAttribute("error", "Invalid admin credentials.");
			return "adminLogin";
		}
	}

	// === ADMIN DASHBOARD ===
	@GetMapping("/adminDashboard")
	public String showAdminDashboard(Model model, HttpSession session) {
		Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
		if (isAdmin == null || !isAdmin) {
			return "redirect:/adminLogin";
		}

		model.addAttribute("users", userService.getAllUsers());
		return "adminDashboard"; // JSP page listing all users/accounts
	}

	// === UPDATE USER ===
	@GetMapping("/updateUser")
	public String showUpdateUserForm(@RequestParam("id") Long userId, Model model, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/adminLogin";

		Users user = userService.getUserById(userId);
		if (user == null) {
			model.addAttribute("error", "User not found.");
			return "adminDashboard";
		}
		model.addAttribute("user", user);
		return "updateUser";
	}

	@PostMapping("/updateUser")
	public String updateUser(@ModelAttribute Users user, Model model, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/adminLogin";

		userService.updateUser(user);
		model.addAttribute("success", "User updated successfully.");
		return "redirect:/adminDashboard";
	}

	// === UPDATE ACCOUNT ===
	@GetMapping("/updateAccount")
	public String showUpdateAccountForm(@RequestParam("accountNumber") String accountNumber, Model model,
			HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/adminLogin";

		Account account = accountService.getByAccountNumber(accountNumber);
		if (account == null) {
			model.addAttribute("error", "Account not found.");
			return "adminDashboard";
		}
		model.addAttribute("account", account);
		return "updateAccount";
	}

	@PostMapping("/updateAccount")
	public String updateAccount(@ModelAttribute Account account, Model model, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/adminLogin";

		Account existing = accountService.getByAccountNumber(account.getAccountNumber());
		if (existing == null) {
			model.addAttribute("error", "Account not found.");
			return "updateAccount";
		}

		existing.setBalance(account.getBalance()); // update only the field you allow
		accountService.updateAccountDetails(existing);

		return "redirect:/adminDashboard";
	}

	// === DELETE USER ===
	@GetMapping("/deleteUser")
	public String deleteUser(@RequestParam("id") Long userId, HttpSession session) {
		if (!isAdmin(session))
			return "redirect:/adminLogin";

		userService.deleteUserById(userId);
		return "redirect:/adminDashboard";
	}

	// === LOGOUT ===
	@GetMapping("/adminLogout")
	public String logoutAdmin(HttpSession session) {
		session.invalidate();
		return "redirect:/adminLogin";
	}

	// === Utility ===
	private boolean isAdmin(HttpSession session) {
		Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
		return isAdmin != null && isAdmin;
	}
}
