<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>eLaundry System</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/controls.css" />
</head>
<body>
	<div class="list-container-medium">
		<h3>Available Service Items</h3><br />
		<table class="list">
			<tr>
				<th>Service</th>
				<th>Item Name</th>
				<th>Description</th>
				<th>Price</th>
			</tr>
			<c:forEach var="laundryItem" items="${laundryItems}">
				<tr>		
					<td>${laundryItem.service.name}</td>
					<td>${laundryItem.name}</td>
					<td>${laundryItem.description}</td>
					<td>$${laundryItem.price}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>