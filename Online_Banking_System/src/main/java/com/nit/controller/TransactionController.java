package com.nit.controller;

import java.time.LocalDateTime;
import java.util.List;

import com.nit.util.TransactionCodeGenerator;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nit.entity.Account;
import com.nit.entity.Transaction;
import com.nit.entity.Users;
import com.nit.repository.AccountRepository;
import com.nit.repository.TransactionRepository;
import com.nit.repository.UserRepository;

@Controller
@RequiredArgsConstructor
public class TransactionController {

	private final AccountRepository accountRepository;
	private final TransactionRepository transactionRepository;
	private final UserRepository userRepository;
	private final TransactionCodeGenerator transactionCodeGenerator;

	// Show send money form
	@GetMapping("/sendMoney")
	public String showSendMoneyForm() {
		return "sendMoney";
	}

	// Validate receiver name and account number
	@PostMapping("/validateReceiver")
	public String validateReceiver(@RequestParam String receiverName, @RequestParam String receiverAccountNumber,
			Model model) {
		Account receiverAccount = accountRepository.findByAccountNumber(receiverAccountNumber);

		if (receiverAccount == null || !receiverAccount.getUser().getFullName().equalsIgnoreCase(receiverName)) {
			model.addAttribute("errorMessage", "Invalid account number or name");
			return "sendMoney";
		}

		model.addAttribute("receiverName", receiverName);
		model.addAttribute("receiverAccountNumber", receiverAccountNumber);
		return "confirmPassword";
	}

	// Process the transaction
	@PostMapping("/processTransaction")
	public String processTransaction(@RequestParam String receiverAccountNumber, @RequestParam String password,
			@RequestParam Double amount, HttpSession session, Model model) {

		String senderUsername = (String) session.getAttribute("userName");

		if (senderUsername == null) {
			model.addAttribute("errorMessage", "Session expired. Please log in again.");
			return "login";
		}

		Users sender = userRepository.findByUserName(senderUsername);
		Account senderAccount = sender.getAccount();

		// Validate password
		if (!sender.getPassword().equals(password)) {
			model.addAttribute("errorMessage", "Incorrect password");
			model.addAttribute("receiverAccountNumber", receiverAccountNumber);
			return "confirmPassword";
		}

		Account receiverAccount = accountRepository.findByAccountNumber(receiverAccountNumber);
		if (receiverAccount == null) {
			model.addAttribute("errorMessage", "Receiver account not found");
			return "sendMoney";
		}

		if (senderAccount.getBalance() < amount) {
			model.addAttribute("errorMessage", "Insufficient balance");
			model.addAttribute("receiverAccountNumber", receiverAccountNumber);
			return "confirmPassword";
		}

		// Deduct and add balance
		senderAccount.setBalance(senderAccount.getBalance() - amount);
		receiverAccount.setBalance(receiverAccount.getBalance() + amount);

		accountRepository.save(senderAccount);
		accountRepository.save(receiverAccount);

		// Generate transaction code
		String transactionCode = transactionCodeGenerator.generateTransactionCode();

		// Save transaction
		Transaction transaction = Transaction.builder().transactionCode(transactionCode).transactionType("transfer")
				.amount(amount).description("Transfer to " + receiverAccountNumber).senderName(sender.getFullName())
				.receiverName(receiverAccount.getUser().getFullName()).timestamp(LocalDateTime.now())
				.senderAccount(senderAccount).receiverAccount(receiverAccount).build();

		transactionRepository.save(transaction);

		session.setAttribute("balance", senderAccount.getBalance());
		model.addAttribute("successMessage", "Transaction completed successfully! Transaction ID : " + transaction.getTransactionCode());
		model.addAttribute("receiverAccountNumber", receiverAccountNumber);

		return "confirmPassword";
	}

	@GetMapping("/transactions")
	public String showTransactions(HttpSession session, Model model) {
		String userName = (String) session.getAttribute("userName");
		if (userName == null) {
			model.addAttribute("errorMessage", "Please login first.");
			return "login";
		}

		Users user = userRepository.findByUserName(userName);
		List<Transaction> transactions = transactionRepository.findBySenderAccount(user.getAccount());
		model.addAttribute("transactions", transactions);

		return "transaction";
	}
}
