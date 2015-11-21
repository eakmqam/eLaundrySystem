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
			<img src="<spring:url value="/resources/images/AKMLogo.png"  htmlEscape="true" />" alt="AKM" />
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
	<form:form action="/eLaundrySystem/orders/changeOrderStatus" modelAttribute="order" method="get">	
		<div class="list-container-medium">
			<form:hidden path="orderId"/>
			<table>
				<tr>
					<td class="align-right"><label for="orderId">Order ID: </label></td>
					<td><form:label path="orderId">${order.orderId} </form:label></td>
				</tr>
				<tr class="blank-row"><td colspan="2"></td></tr>
				<tr>
					<td class="align-right">Customer Name: </td>
					<td>${order.customerName}</td>
				</tr>
				<tr class="blank-row"><td colspan="2"></td></tr>
				<tr>
					<td class="align-right">Order Date: </td>
					<td>${order.orderDate}</td>
				</tr>
				<tr class="blank-row"><td colspan="2"></td></tr>
				<tr>
					<td class="align-right">Expected Delivery: </td>
					<td>${order.expDeliveryDate}</td>
				</tr>
				<tr class="blank-row"><td colspan="2"></td></tr>
				<tr>
					<td class="align-right"><label for="orderStatus">Order Status: </label></td>
					<td>
						<form:select path="orderStatus">
							<form:option value="Placed">Placed</form:option>
							<form:option value="Received">Received</form:option>
							<form:option value="InProcess">In Process</form:option>
							<form:option value="Delivered">Delivered</form:option>
							<form:option value="CashReceived">Cash Received</form:option>
						</form:select>
					</td>
				</tr>
			</table>				
			<h3>Order Items:</h3>
			<table class="list" id="order-items">
				<tr class="header-row">
					<th>Item</th>
					<th>Service</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Total</th>
				</tr>
				<c:forEach var="orderItem" items="${orderItems}">
					<tr>
						<td>${orderItem.itemName}</td>
						<td>${orderItem.serviceName}</td>
						<td>${orderItem.quantity}</td>
						<td>$${orderItem.price}</td>
						<td>$${orderItem.totalPrice}</td>
					</tr>
				</c:forEach>
				<tr class="footer-row">
					<td colspan="2" class="align-right">Total</td>
					<td>${totalItems}</td>
					<td>&nbsp;</td>
					<td>$${totalAmount}</td>
				</tr>
			</table><br />
			<input type="submit" value="Save Changed Status">
		</div>
	</form:form>
	</div>
	<div class="footer-container">
		<p class="copyright-message">@Copyright: AKM Qamruzzaman</p>
	</div>
</body>
</html>