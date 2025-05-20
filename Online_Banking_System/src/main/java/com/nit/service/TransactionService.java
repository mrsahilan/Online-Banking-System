package com.nit.service;

import com.nit.entity.Account;
import com.nit.entity.Transaction;
import com.nit.repository.AccountRepository;
import com.nit.repository.TransactionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TransactionService {

	private final AccountRepository accountRepository;
	private final TransactionRepository transactionRepository;

	// Method to send money
	public void sendMoney(String senderAccountNumber, String receiverAccountNumber, Double amount, String description) {
		Account senderAccount = accountRepository.findByAccountNumber(senderAccountNumber);
		Account receiverAccount = accountRepository.findByAccountNumber(receiverAccountNumber);

		if (senderAccount == null || receiverAccount == null) {
			throw new IllegalArgumentException("Invalid sender or receiver account number");
		}

		if (senderAccount.getBalance() < amount) {
			throw new IllegalArgumentException("Insufficient balance in sender's account");
		}

		// Deduct amount from sender's balance
		senderAccount.setBalance(senderAccount.getBalance() - amount);
		accountRepository.save(senderAccount);

		// Add amount to receiver's balance
		receiverAccount.setBalance(receiverAccount.getBalance() + amount);
		accountRepository.save(receiverAccount);

		// Create transaction record for the sender
		Transaction sendTransaction = Transaction.builder().transactionType("Debit").amount(amount)
				.description(description).receiverName(receiverAccount.getUser().getFullName())
				.timestamp(LocalDateTime.now()).senderAccount(senderAccount).receiverAccount(receiverAccount).build();
		transactionRepository.save(sendTransaction);

		// Create transaction record for the receiver
		Transaction receiveTransaction = Transaction.builder().transactionType("Credit").amount(amount)
				.description(description).receiverName(senderAccount.getUser().getFullName())
				.timestamp(LocalDateTime.now()).senderAccount(senderAccount).receiverAccount(receiverAccount).build();
		transactionRepository.save(receiveTransaction);
	}

	public List<Transaction> getAllTransactions() {
		// TODO Auto-generated method stub
		return null;
	}

	public Transaction getTransactionDetails(Long transactionId) {
		// TODO Auto-generated method stub
		return null;
	}
}
