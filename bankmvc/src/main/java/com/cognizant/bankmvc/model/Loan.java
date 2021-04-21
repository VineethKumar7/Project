package com.cognizant.bankmvc.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Entity
@ToString
public class Loan {
	
	private String customerId;
	 private long amount;
	 private long currentBalance;
	 private Boolean ischecked;
	 private Boolean isapproved;
	 
}
