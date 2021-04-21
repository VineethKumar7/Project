package com.cognizant.customerservice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cognizant.customerservice.model.Loan;
import java.lang.Boolean;

public interface LoanRepository extends JpaRepository<Loan,Integer>{

	Loan findBycustomerId(String customerId);

	List<Loan> findByIschecked(Boolean ischecked);

	//Loan findByUserId(String userid);

}
