<%@page import="java.net.http.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
html {
	height: 100%;
}

#message
{
	color : red; 
}
#accmsg
{
	color : green; 
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}

* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1500px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 50px;
  font-style:bold;
  padding: 8px 12px;
  margin-right:50%;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: right;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 2s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
.btn2 {
  background-color: #f4511e;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  font-size: 16px;
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
}

.btn2:hover {opacity: 1}

</style>

</head>
<body class="doodle">


	<%
		response.setHeader("cache-control", "no-cache , no-store , must-revalidate");
		response.setHeader("pragma", "no-cache");
		response.setDateHeader("Expires", 0);

		if (session.getAttribute("userId") == null || session.getAttribute("token") == null) {
	%>
	<c:redirect url="/403" />
	<%
		}
	%>


<nav
		class="navbar navbar-expand-sm bg-secondary navbar-dark justify-content-between">
		<img style="max-width:30px; margin-top: -7px;"
             src="https://png.pngtree.com/png-vector/20190225/ourmid/pngtree-concept-banking-logo-png-image_712961.jpg">
             <div class="navbar-brand"  >Corporate Bank</div>
		<div class="form-inline">
			<a class="btn btn-outline-light my-2 my-sm-0" href="/logout">Logout</a>&nbsp;&nbsp;
		</div>
	</nav>
	<br>
		<h1 align="center">Welcome to Corporate Bank</h1>
		
		
		
		<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="https://www.gfafcu.com/image%20library/contact%20us/scheduleappointment-header.jpg" style="width:100%;height:361px">
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="http://s3.ap-south-1.amazonaws.com/afinoz.static/cms/images/blog/know-about-edu-loan.png" style="width:100%;height:361px">
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="https://post.healthline.com/wp-content/uploads/2020/08/why-is-coffee-good-for-you-732x549-thumbnail-732x549.jpg" style="width:100%;height:361px">
  <div class="text">Corporate Bank makes it easy to send money to family and friends</div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>






	
	<div class="row">

		<div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 5em 10em 2em 3em;">
				<div class="card  " style="width: 400px; background-color: #ffeee6">
					<div class="card-body">
						<h4 class="card-title">Create Customer</h4>
						<p class="card-text">Click the button to create the customer</p>
						<br> <a href="/createCustomer" class="btn2" >Create</a>
					</div>
					<p id="message">${custmsg}</p>
				</div>
			</div>
		</div>


		<div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 5em 10em 2em 3em;">
				<div class="card" style="width: 400px; background-color: #ffeee6">
					<div class="card-body">
						<h4 class="card-title">Create Account for Customer</h4>
						<form action="/createAccount" method="post">
							<input type="text" name="customerId" placeholder="Enter the CustomerId" autocomplete="off"/>
							<br> <br> <input type="submit" name="View" value="Create Account" class="btn2 " />
						</form>
						<p id="message">${accmsg}</p>
					</div>
				</div>
			</div>
		</div>

  <div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 5em 10em 2em 3em;">
				<div class="card" style="width: 400px; background-color: #ffeee6">
					<div class="card-body">
						<h4 class="card-title">Delete Customer</h4>
						<form action="/deleteCustomer" method="post">
							<input type="text" name="customerId" id="customerId" placeholder="Enter the customerId" autocomplete="off"/>
							<br> <br> <input type="submit" name="Delete" value="Delete" class="btn2 "/>
						</form>
						<p id="message">${deletemsg}</p>
					</div>
					
				</div>
			</div>
		</div>
	</div>


	<div class="row">

		<div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 4em 10em 14em 3em;">
				<div class="card" style="width:400px;height:210px; background-color: #ffeee6">
					<div class="card-body">
						<h4 class="card-title"style="font-color:">View the Customer</h4>
						<form action="/viewCustomer" method="get">
							<input type="text" name="userId" id="userId" placeholder="Enter the UserId" autocomplete="off"/>
							<br> <br> <input type="submit" name="View" value="View"
								class="btn2 "/>
						</form>
						<p id="message">${viewmsg}</p>
					</div>

				</div>
			</div>
		</div>
		
		<div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 4em 0em 0em 3em;">
				<div class="card" style="width:400px;height:210px; background-color: #ffeee6">
					<div class="card-body">
						<h4 class="card-title">Deposit Amount</h4>
						<form action="/deposit" method="post">
							<input type="number"  name="accountId" placeholder="Enter the AccountId" autocomplete="off"/><br>	
							<input type="number" name="amount" placeholder="Enter the amount" autocomplete="off"/>
							<br> <br> 
							<input type="submit" name="View" value="Deposit" class="btn2"/>
						</form>
						<p id="message">${msg}</p>
					</div>
				</div>
			</div>
		</div>
        <div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 4em 10em 14em 3em;">
				<div class="card" style="width:400px;height:210px; background-color: #ffeee6">
					<div class="card-body">
						<h4 class="card-title">Service Charge Detection</h4>
                        <p class="card-text">Charges will be detected for not maintaining minimum balance </p>
						<form action="/deductServiceTax" method="post">
                         <input type="submit" name="View" value="Deduct" class="btn2 "/>
						</form>
						<p id="message">${servicemsg}</p>
					</div>
				</div>
			</div>
		</div>
			
	
	
	<div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin: 4em 10em 14em 3em;">
				<div class="card" style="width:400px;height:210px; background-color: #ffeee6">
					<div class="card-body">
						<h4 class="card-title" >Check customer Loans</h4>
                        
                        <form action="/checkCustomerloans" method="post">
                         <input type="submit" name="View" value="Check customer Loans" class="btn2 " />
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
		




<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>	

</body>
</html>
