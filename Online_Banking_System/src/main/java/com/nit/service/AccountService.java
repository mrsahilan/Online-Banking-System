package com.nit.service;

import com.nit.entity.Account;
import com.nit.repository.AccountRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AccountService {

	private final AccountRepository accountRepository;

	// Method to get account by account number
	public Account getAccountByNumber(String accountNumber) {
		return accountRepository.findByAccountNumber(accountNumber);
	}

	// Method to update account balance
	public void updateAccountBalance(Account account, Double newBalance) {
		account.setBalance(newBalance);
		accountRepository.save(account);
	}

	public Account getByAccountNumber(String accountNumber) {
	    return accountRepository.findByAccountNumber(accountNumber);
	}
	
	 public void updateAccountDetails(Account account) {
	        accountRepository.save(account);
	}
}
