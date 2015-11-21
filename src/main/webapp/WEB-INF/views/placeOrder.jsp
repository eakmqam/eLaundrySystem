<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>eLaundry System</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/order.js"></script>
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainLayout.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/controls.css"/>
</head>
<body class="body-container">
	<div class="header-container">
		<div style="float:left;">
			<a href="<%=request.getContextPath()%>"><img src="../resources/images/AKMLogo.png" alt="AKM" /></a>
			<div class="banner-message" style="float:right;"><h1><spring:message code="welcome.message"/></h1></div>
		</div>
		<div class="login" style="float:right;">			
			<security:authorize access="isAuthenticated()">
				Welcome  <span class="bold"><security:authentication property="principal.username" /></span>&nbsp;&nbsp;
				<a href="<c:url value="/j_spring_security_logout" />" class="btn btn-danger btn-mini pull-right">logout</a>	
			</security:authorize>
			<div class="pull-left"> <h3>${SpecialBlurb}</h3></div>
		</div>
	</div>
	<div class="menu-container">

		<security:authorize access="isAuthenticated()">
			<security:authorize access="hasRole('ROLE_ADMIN')">
  				<a href="<spring:url value='/customers/add' />" class="btn btn-default"> 
					<span class="glyphicon-hand-left glyphicon"></span>Customer Signup
				</a>
				<a href="<spring:url value='/customers/list' />" class="btn btn-default"> 
					<span class="glyphicon-hand-left glyphicon"></span>Customers
				</a>
			</security:authorize>
			
			<a href="<spring:url value='/services/' />" class="btn btn-default">
				<span class="glyphicon-hand-left glyphicon"></span>Service
			</a>
			<a href="<spring:url value='/orders/placeOrder' />" class="btn btn-default">
				<span class="glyphicon-hand-left glyphicon"></span>Place an Order
			</a>
			<security:authorize access="hasRole('ROLE_ADMIN')">	
				<a href="<spring:url value='/orders/changeOrderStatus' />" class="btn btn-default">
					<span class="glyphicon-hand-left glyphicon"></span>Orders Placed
				</a>
			</security:authorize>			
		</security:authorize>
		<div class="language-change">
			View in: <a href="?language=en">English</a>
		</div>
	</div>
	<div class="content-container">
	<div class="list-container-medium">
		<h3>Place an Order</h3>
		<table>
			<tr>
				<td class="align-right"><label for="service">Service: </label></td>
				<td>
					<select id="service" class="input-large" onchange="loadServiceItems(this.value)">
					   <option value="0">--- Select One ---</option>
					   <c:forEach var="service" items="${services}">
					   		<option value="${service.serviceId}">${service.name}</option>
					   </c:forEach>
					</select>						
				</td>
			</tr>
			<tr class="blank-row"><td colspan="2"></td></tr>
			<tr>
				<td class="align-right"><label for="serviceItem">Item: </label></td>
				<td>
					<select id="serviceItem" class="input-large">
					</select>
				</td>
			</tr>
			<tr class="blank-row"><td colspan="2"></td></tr>
			<tr>
				<td class="align-right"><label for="quantity">Quantity: </label></td>
				<td>
					<input type="number" id="quantity" class="input-small" />
				</td>
			</tr>
			<tr class="blank-row"><td colspan="2"></td></tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<input type="submit" value="Add to List" onclick="addToList()">
				</td>
			</tr>
		</table>
	</div>
	
	<form:form action="placeOrder" modelAttribute="orderDummy" method="post">	
		<div class="list-container-medium">
			<table class="list" id="order-items">
				<tr class="header-row">
					<th>Item</th>
					<th>Service</th>
					<th>Quantity</th>
					<th>Price</th>
				</tr>
				<tr class="footer-row">
					<td>&nbsp;</td>
					<td>Total</td>
					<td class="qty-total">0</td>
					<td class="price-total">$0.0</td>
				</tr>
			</table><br />
			<form:hidden path="totalPrice" id="totalPrice"></form:hidden>
			<form:hidden path="itemList" id="itemList"></form:hidden>
			<input type="submit" id="place-order" value="Place Order">
		</div>
	</form:form>
	</div>
	<div class="footer-container">
		<p class="copyright-message">@Copyright: AKM Qamruzzaman</p>
	</div>
</body>
</html>