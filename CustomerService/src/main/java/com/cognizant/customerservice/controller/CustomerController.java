package com.cognizant.customerservice.controller;

import java.net.BindException;
import java.time.DateTimeException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.cognizant.customerservice.feign.AuthorizationFeign;
import com.cognizant.customerservice.model.CustomerEntity;
import com.cognizant.customerservice.model.Loan;
import com.cognizant.customerservice.repository.LoanRepository;
import com.cognizant.customerservice.service.CustomerService;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;

@RestController
public class CustomerController {  // /customer endpoint

	@Autowired
	private CustomerService customerService;  //customer interface

	@Autowired
	AuthorizationFeign authorizationFeign;   
	//auth feign
	@Autowired
	LoanRepository loanRepository;

	@PostMapping("/createCustomer")
	public ResponseEntity<?> createCustomer(@RequestHeader("Authorization") String token,@Valid @RequestBody CustomerEntity customer,BindingResult bindingResult) throws DateTimeException, BindException{
		if(bindingResult.hasErrors())
		{
			throw new BindException();
		}
		customerService.hasEmployeePermission(token);
		CustomerEntity customerEntity = customerService.createCustomer(token,customer);
		if (customerEntity != null)
			return new ResponseEntity<>(customerEntity, HttpStatus.CREATED);
		else
			return new ResponseEntity<>("Customer Creation is UNSUCCESSFUL", HttpStatus.NOT_ACCEPTABLE);
	}
	
	@PostMapping("/saveCustomer")
	public CustomerEntity saveCustomer(@RequestHeader("Authorization") String token,@Valid @RequestBody CustomerEntity customer) {
		customerService.hasEmployeePermission(token);
		CustomerEntity customerEntity = customerService.saveCustomer(token,customer);
		if (customerEntity != null)
			return customerEntity;
		else
			return null;
	}
	
	@PostMapping("/updateCustomer")
	public CustomerEntity updateCustomer(@RequestHeader("Authorization") String token,@Valid @RequestBody CustomerEntity customer) {
		customerService.hasEmployeePermission(token);
		return customerService.updateCustomer(token,customer);
	}
	
	@GetMapping("/getCustomerDetails/{id}")
	public ResponseEntity<?> getCustomerDetails(@RequestHeader("Authorization") String token, @PathVariable String id) {
		customerService.hasPermission(token);
		CustomerEntity toReturnCustomerDetails = customerService.getCustomerDetail(token,id);
		if (toReturnCustomerDetails == null)
			return new ResponseEntity<>("Customer Userid "+id+" DOES NOT EXISTS", HttpStatus.NOT_ACCEPTABLE);
		toReturnCustomerDetails.setPassword(null);
		return new ResponseEntity<>(toReturnCustomerDetails, HttpStatus.OK);
	}
	
	
	
	@PostMapping("/Loan/{userid}/{amount}")
	public  String applyLoan(@RequestHeader("Authorization") String token,@PathVariable(name="userid") String userid, @PathVariable(name="amount") long amount) {//,@RequestBody Loancustomerdetsails loancustomerdetsails){
			//System.out.println(token);
			Loan a=customerService.checkLoan(token,  userid, amount);
			
			return "Customer Creation is SUCCESSFUL"+a;
	}
		@PostMapping("/Loanaproval/{userid}")
		public  List<Loan> Aproving(@RequestHeader("Authorization") String token,@PathVariable(name="userid") String userid) {
			Loan loan=loanRepository.findBycustomerId(userid);
			loan.setIsapproved(true);
			loan.setIschecked(true);
			loanRepository.save(loan);
			return customerService.ischecked();
		}
		@PostMapping("/Loanrejection/{userid}")
		public  List<Loan> reject(@RequestHeader("Authorization") String token,@PathVariable(name="userid") String userid) {
			Loan loan=loanRepository.findBycustomerId(userid);
			loan.setIsapproved(false);
			loan.setIschecked(true);
			loanRepository.save(loan);
			return customerService.ischecked();
		}
		@PostMapping("/LoanCheck")
		public  List<Loan> checkLoanemp(@RequestHeader("Authorization") String token,@RequestParam(defaultValue = "",name="userid") String userid) {
			return customerService.ischecked();
		}
		@PostMapping("/checkLoanstatusecust/{userid}")
		public  Loan checkstatusecust(@RequestHeader("Authorization") String token,@PathVariable(name="userid") String userid) {
			return loanRepository.findBycustomerId(userid);
		}
	@DeleteMapping("deleteCustomer/{id}")
	@ResponseStatus(code = HttpStatus.OK)
	public ResponseEntity<?> deleteCustomer(@RequestHeader("Authorization") String token, @PathVariable String id) {

		customerService.hasEmployeePermission(token);

		CustomerEntity checkCustomerIdExists = null;
		checkCustomerIdExists = customerService.getCustomerDetail(token , id);
		if (checkCustomerIdExists == null) {
			return new ResponseEntity<>("Customer Userid DOES NOT EXISTS", HttpStatus.NOT_ACCEPTABLE);
		}

		System.out.println("Starting deletion of-->"+id);
		customerService.deleteCustomer(id);
		System.out.println("Deleted");
		return new ResponseEntity<>("Deleted SUCCESSFULLY", HttpStatus.OK);
	}

	@GetMapping("/check") 
	@HystrixCommand(fallbackMethod = "fallback")
	public String checkAccessWWithoutValidation(@RequestHeader("Authorization") String token) {
		customerService.hasEmployeePermission(token);
		return "Your Token is valid";
	}
	
	
	 String fallback(String token ,Throwable hystrixCommand)
	{
		return "Authentication is down";
		
	}
}
