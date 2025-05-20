package com.nit.util;

import java.util.Random;

import com.nit.repository.TransactionRepository;
import org.springframework.stereotype.Component;

@Component
public class TransactionCodeGenerator {

    private final TransactionRepository transactionRepository;
    private final Random random = new Random();

    public TransactionCodeGenerator(TransactionRepository transactionRepository) {
        this.transactionRepository = transactionRepository;
    }

    public String generateTransactionCode() {
        String transactionCode;
        do {
            int num = 10000000 + random.nextInt(90000000); // 8-digit number starting with 1xxxxxxx
            transactionCode = String.valueOf(num);
        } while (transactionRepository.existsByTransactionCode(transactionCode));
        return transactionCode;
    }
}
