<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
			<img src="../resources/images/AKMLogo.png" alt="AKM" />
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
			<a href="<spring:url value='/customers/add' />" class="btn btn-default"> 
				<span class="glyphicon-hand-left glyphicon"></span>Customer Signup
			</a>
			<a href="<spring:url value='/customers/list' />" class="btn btn-default"> 
				<span class="glyphicon-hand-left glyphicon"></span>Customers
			</a>
			<a href="<spring:url value='/services/' />" class="btn btn-default">
				<span class="glyphicon-hand-left glyphicon"></span>Service
			</a>
			<a href="<spring:url value='/orders/placeOrder' />" class="btn btn-default">
				<span class="glyphicon-hand-left glyphicon"></span>Place an Order
			</a>	
			<a href="<spring:url value='/orders/changeOrderStatus' />" class="btn btn-default">
				<span class="glyphicon-hand-left glyphicon"></span>Orders Placed
			</a>			
		</security:authorize>
		<div class="language-change">
			View in: <a href="?language=en">English</a>
		</div>
	</div>
	<div class="content-container">
		<div class="list-container-medium">
			<form:form modelAttribute="newCustomer" class="form-horizontal">
				<h3>Add new Customer</h3>				
				<table>
					<tr>
						<td><spring:message code="addCustomer.form.firstName.label"/></td>
						<td><form:input path="firstName" type="text" /></td>
						<td><form:errors path="firstName" cssClass="errorMessage"/></td>
					</tr>
					<tr>
						<td><spring:message code="addCustomer.form.middleName.label"/></td>
						<td><form:input path="middleName" type="text" /></td>
						<td><form:errors path="middleName" cssClass="errorMessage"/></td>
					</tr>
					<tr>
						<td><spring:message code="addCustomer.form.lastName.label"/></td>
						<td><form:input path="lastName" type="text" /></td>
						<td><form:errors path="lastName" cssClass="errorMessage"/></td>
					</tr>
					<tr>
						<td><spring:message code="addCustomer.form.dateOfBirth.label"/></td>
						<td><form:input path="dateOfBirth" type="text" placeholder="MM-DD-YYYY"/></td>
						<td><form:errors path="dateOfBirth" cssClass="errorMessage"/></td>
					</tr>
					<tr>
						<td><spring:message code="addCustomer.form.street.label"/></td>
						<td><form:input path="address.street" type="text" /></td>
						<td><form:errors path="address.street" cssClass="errorMessage"/></td>
					</tr>
					<tr>
						<td><spring:message code="addCustomer.form.city.label"/></td>
						<td><form:input path="address.city" type="text" /></td>
						<td><form:errors path="address.city" cssClass="errorMessage"/></td>
					</tr>
					<tr>
						<td><spring:message code="addCustomer.form.state.label"/></td>
						<td><form:input path="address.state" type="text" /></td>
						<td><form:errors path="address.state" cssClass="errorMessage"/></td>
					</tr>
					
					<tr>
						<td><spring:message code="addCustomer.form.zipCode.label"/></td>
						<td><form:input path="address.zipCode" type="text" /></td>
						<td><form:errors path="address.zipCode" cssClass="errorMessage"/></td>
					</tr>
					<tr>
						<td><spring:message code="addCustomer.form.phone.label"/></td>
						<td><form:input path="phone" type="text" placeholder="222-222-2222"/></td>
						<td><form:errors path="phone" cssClass="errorMessage"/></td>
					</tr>
					<tr>
						<td><spring:message code="addCustomer.form.email.label"/></td>
						<td><form:input path="email" type="text" /></td>
						<td><form:errors path="email" cssClass="errorMessage"/></td>
					</tr>
					<tr>
						<td><spring:message code="addCustomer.form.gender.label"/></td>
						<td><form:radiobutton path="gender" value="M"/><spring:message code="addCustomer.form.gender.male.label"/> <form:radiobutton path="gender" value="F"/><spring:message code="addCustomer.form.gender.female.label"/></td>
						<td></td>
					</tr>
					<tr>
						<td><spring:message code="addCustomer.form.user.username.label"/></td>
						<td><form:input path="user.username" type="text" /></td>
						<td><form:errors path="user.username" cssClass="errorMessage"/><span class="errorMessage">${usernameerror}</span></td>
					</tr>
					<tr>
						<td><spring:message code="addCustomer.form.user.password.label"/></td>
						<td><form:input path="user.password" type="password" /></td>
						<td><form:errors path="user.password" cssClass="errorMessage"/></td>
					</tr>
				</table>
				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-primary" value ="Add"/>
					</div>
				</div>
			</div>
		</form:form>
	</div>
	<div class="footer-container">
		<p class="copyright-message">@Copyright: AKM Qamruzzaman</p>
	</div>
</body>
</html>
