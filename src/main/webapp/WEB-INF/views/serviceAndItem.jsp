<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>eLaundry System</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/service.js"></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/mainLayout.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/controls.css" />

</head>
<body class="body-container">
	<div class="header-container">
		<div style="float: left;">
			<img src="../resources/images/AKMLogo.png" alt="AKM" />
			<div class="banner-message" style="float: right;">
				<h1>
					<spring:message code="welcome.message" />
				</h1>
			</div>
		</div>
		<div class="login" style="float: right;">
			<security:authorize access="isAuthenticated()">
				Welcome  <span class="bold"><security:authentication
						property="principal.username" /></span>&nbsp;&nbsp;
				<a href="<c:url value="/j_spring_security_logout" />"
					class="btn btn-danger btn-mini pull-right">logout</a>
			</security:authorize>
			<div class="pull-left">
				<h3>${SpecialBlurb}</h3>
			</div>
		</div>
	</div>
	<div class="menu-container">
		<security:authorize access="isAnonymous()">
			<a href="<spring:url value='/login' />"
				class="btn btn-default pull-right">Login</a>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<a href="<spring:url value='/customers/add' />"
					class="btn btn-default"> <span
					class="glyphicon-hand-left glyphicon"></span>Customer Signup
				</a>
				<a href="<spring:url value='/customers/list' />"
					class="btn btn-default"> <span
					class="glyphicon-hand-left glyphicon"></span>Customers
				</a>
			</security:authorize>

			<a href="<spring:url value='/services/' />" class="btn btn-default">
				<span class="glyphicon-hand-left glyphicon"></span>Service
			</a>
			<a href="<spring:url value='/orders/placeOrder' />"
				class="btn btn-default"> <span
				class="glyphicon-hand-left glyphicon"></span>Place an Order
			</a>
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<a href="<spring:url value='/orders/changeOrderStatus' />"
					class="btn btn-default"> <span
					class="glyphicon-hand-left glyphicon"></span>Orders Placed
				</a>
			</security:authorize>
		</security:authorize>
		<div class="language-change">
			View in: <a href="?language=en">English</a>
		</div>
	</div>
	<div class="content-container">
		<div class="list-container-small">
			<table>
				<tr>
					<td class="align-right"><label for="serviceSelect">Select
							Service: </label></td>
					<td><form:select path="selectedService" id="selectedService"
							onchange="loadServiceItems(this.value)">
							<form:option value="0" label="--- Select One ---"></form:option>
							<form:options items="${services}" itemValue="serviceId"
								itemLabel="name"></form:options>
						</form:select></td>
				</tr>
			</table>
			<br />
			<h4>Available Service Items</h4>
			<table id="item-table" class="list">
			</table>
		</div>
	</div>
	<div class="footer-container">
		<p class="copyright-message">@Copyright: AKM Qamruzzaman</p>

	</div>

	<script type="text/javascript">
		$(function() {
			loadServiceItems(0);
		});
	</script>
</body>
</html>