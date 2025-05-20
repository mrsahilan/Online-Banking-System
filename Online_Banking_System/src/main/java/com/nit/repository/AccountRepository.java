package com.nit.repository;

import com.nit.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends JpaRepository<Account, Long> 
{
    Account findByAccountNumber(String accountNumber); 
    Account findTopByOrderByIdDesc(); 
    
}
