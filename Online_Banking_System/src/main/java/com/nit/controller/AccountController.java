package com.nit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nit.entity.Account;
import com.nit.entity.Users;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AccountController {


    // View account details
    @GetMapping("/account")
    public String viewAccountDetails(HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("loggedInUser");

        if (user == null || user.getAccount() == null) {
            model.addAttribute("error", "You must be logged in to view account details.");
            return "login";
        }

        Account account = user.getAccount();
        model.addAttribute("account", account);
        return "accountDetails";
    }

    // View account balance
    @GetMapping("/balance")
    public String viewBalance(HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("loggedInUser");

        if (user == null || user.getAccount() == null) {
            model.addAttribute("error", "You must be logged in to view balance.");
            return "login";
        }

        Account account = user.getAccount();
        model.addAttribute("balance", account.getBalance());
        return "balance";
    }
}
