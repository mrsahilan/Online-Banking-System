package com.nit.util;

import java.util.Random;

import org.springframework.stereotype.Component;

import com.nit.entity.Account;
import com.nit.repository.AccountRepository;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class AccountNumberGenerator {

	private final AccountRepository accountRepository;

	public String generateNextAccountNumber() {
		Account lastAccount = accountRepository.findTopByOrderByIdDesc();
		if (lastAccount == null) {
			return "185700010"; 
		} else {
			long lastNumber = Long.parseLong(lastAccount.getAccountNumber());
			return String.valueOf(lastNumber + 1); 
		}
	}
	
}
