
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	    		rel="stylesheet">

</head>
<body>

	
<h1>These are the Loans applied by customer </h1>

<div class="container">
		<table class="table table-striped">
			<caption></caption>
			<thead>
				<tr>
					
				<th>CUSTOMER ID</th>
				<th>     </th>
				<th>     </th>
				
				<th>amount</th>
				<th>     </th>
				
				<th>Customer balance</th>
				<th></th>
				<th>Approve</th>
				<th>     </th>
				<th>Reject</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${loans}" var="loan">
					<tr>
						<td><c:out value="${loan.customerId}" /></td>
						<th>     </th>
						<th>     </th>
				<td><c:out value="${loan.amount}" /></td>
				<th>     </th>
				
				<td><c:out value="${loan.currentBalance}" />
					 <td> <td><a type="button" class="btn btn-warning" 
		href="/ApproveLoan?id=${loan.customerId}">Approve</a></td>	
						
						
						
						
						<th>     </th>
						<th>     </th>
						  <td><a type="button" class="btn btn-warning" 
		href="/REJECTLoan?id=${loan.customerId}">REJECT</a></td>	
						
				</c:forEach>
				
			</tbody>
		</table>
		<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	    <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	    </div>
</body>
</html>