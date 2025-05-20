package com.nit.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nit.entity.Account;
import com.nit.entity.Transaction;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Long> {
	
	List<Transaction> findBySenderAccount(Account senderAccount);

	List<Transaction> findByReceiverAccount(Account receiverAccount);

	List<Transaction> findBySenderAccountOrReceiverAccount(Account senderAccount, Account receiverAccount);

	boolean existsByTransactionCode(String transactionCode);
}
