package com.cognizant.bankmvc.feign;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;

import com.cognizant.bankmvc.exception.CustomerNotFoundException;
import com.cognizant.bankmvc.model.CustomerEntity;
import com.cognizant.bankmvc.model.Loan;

import java.util.List;

import javax.validation.Valid;

import org.springframework.cloud.openfeign.FeignClient;



@FeignClient(name = "customer", url = "${feign.url-customer-service}")
public interface CustomerFeign {

	
	@PostMapping("/createCustomer")
	public ResponseEntity<?> createCustomer(@RequestHeader("Authorization") String token,@RequestBody CustomerEntity customer);
	
	@GetMapping("/getCustomerDetails/{id}")
	public CustomerEntity getCustomerDetails(@RequestHeader("Authorization") String token, @PathVariable(name="id") String id) throws CustomerNotFoundException;
	
	@PostMapping("/saveCustomer")
	public CustomerEntity saveCustomer(@RequestHeader("Authorization") String token,@Valid@RequestBody CustomerEntity customer);

	@PostMapping("/updateCustomer")
	public CustomerEntity updateCustomer(@RequestHeader("Authorization") String token,@Valid@RequestBody CustomerEntity customer);
	
	@DeleteMapping("deleteCustomer/{id}")
	public String deleteCustomer(@RequestHeader("Authorization") String token, @PathVariable String id);
	@PostMapping("/Loan/{userid}/{amount}")
	public  String applyLoan(@RequestHeader("Authorization") String token,@PathVariable(name="userid") String userid, @PathVariable(name="amount") long amount);
	@PostMapping("/Loanaproval/{userid}")
	public  List<Loan> Aproving(@RequestHeader("Authorization") String token,@PathVariable(name="userid") String userid);
	
	@PostMapping("/Loanrejection/{userid}")
	public  List<Loan> reject(@RequestHeader("Authorization") String token,@PathVariable(name="userid") String userid);
	@PostMapping("/LoanCheck")
	public  List<Loan> checkLoanemp(@RequestHeader("Authorization") String token,@RequestParam(defaultValue = "",name="userid") String userid);
	@PostMapping("/checkLoanstatusecust/{userid}")
	public  Loan checkstatusecust(@RequestHeader("Authorization") String token,@PathVariable(name="userid") String userid);
}
