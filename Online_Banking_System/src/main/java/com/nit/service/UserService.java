package com.nit.service;

import com.nit.entity.Account;
import com.nit.entity.Users;
import com.nit.repository.UserRepository;
import com.nit.util.AccountNumberGenerator;
import com.nit.util.UserNameGenerator;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

	private final UserRepository userRepository;
	private final AccountNumberGenerator accountNumberGenerator;

	// Register a new user
	public Users registerUser(Users user) {
		// Generate username
		String generatedUsername = UserNameGenerator.generate(user.getFullName(), user.getDateOfBirth());
		user.setUserName(generatedUsername);

		// Generate account number
		String newAccountNumber = accountNumberGenerator.generateNextAccountNumber();

		// Create and link account
		Account account = new Account();
		account.setAccountNumber(newAccountNumber);
		account.setBalance(5000.0); // Initial balance
		account.setUser(user);
		user.setAccount(account);

		// Set password (use account number as default password if not provided)
		if (user.getPassword() == null || user.getPassword().isEmpty()) {
			user.setPassword(newAccountNumber);
		}

		return userRepository.save(user);
	}
	
	public void deleteUserById(Long id) {
	    userRepository.deleteById(id);
	}
	
	public void updateUser(Users user) {
	    userRepository.save(user);
	}
	
	public Users getUserById(Long id) {
	    return userRepository.findById(id).orElse(null);
	}
	
	// Updated login using userName
	public Users login(String userName, String password) {
		Users user = userRepository.findByUserName(userName);
		if (user != null && user.getPassword().equals(password)) {
			return user;
		} else {
			throw new IllegalArgumentException("Invalid username or password");
		}
	}

	public Object getAllUsers() 
	{
		return userRepository.findAll();
	}
}
