package com.nit.repository;

import com.nit.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<Users, Long> 
{
	Users findByAccount_AccountNumber(String accountNumber);

	Users findByUserName(String userName);
}
