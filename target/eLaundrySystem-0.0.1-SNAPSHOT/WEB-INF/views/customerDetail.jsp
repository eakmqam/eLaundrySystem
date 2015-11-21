<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>eLaundry System</title>
	<link rel="stylesheet"	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainLayout.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/controls.css"/>
	<style type="text/css">
	.errorMessage {
		color: red;
	}
	</style>
	
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
		<security:authorize access="isAnonymous()">
  			<a href="<spring:url value='/login' />" class="btn btn-default pull-right">Login</a>
		</security:authorize>
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
		<div class="list-container-small">
			<div class="thumbnail">
				<div class="caption">
					<p><span class="bold">Name:</span> ${customer.firstName} ${customer.lastName}</p>
					<p><span class="bold">Email:</span> ${customer.email}</p>
					<p><span class="bold">User:</span> ${customer.user.username}</p>
					<p><span class="bold">Address:</span> ${customer.address.street} ${customer.address.city}</p>
					<p>${customer.address.state}, ${customer.address.zipCode}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="footer-container">
		<p class="copyright-message">@Copyright: AKM Qamruzzaman</p>
	</div>
</body>
</html>
