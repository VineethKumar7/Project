package com.cognizant.customerservice.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString
public class Loan {
	@Id
	@GeneratedValue
	private int id;
	private String customerId;
	 private long amount;
	 private long currentBalance;
	 private Boolean ischecked;
	 private Boolean isapproved;
	 
}
