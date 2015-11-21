<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainLayout.css"/>
	<title>eLaundry System</title>
</head>
<body class="body-container">
	<div class="header-container">
		<div style="float:left;">
			<img src="./resources/images/AKMLogo.png" alt="AKM" />
			<div class="banner-message" style="float:right;"><h1><spring:message code="welcome.message"/></h1></div>
		</div>
	</div>
	<div class="menu-container">
		<security:authorize access="isAnonymous()">
  			<a href="<spring:url value='/login' />" class="btn btn-default pull-right">Login</a>
  			<a href="<spring:url value='/customers/add' />" class="btn btn-default"> 
				<span class="glyphicon-hand-left glyphicon"></span>Customer Signup
			</a>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
			
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
		<div class="panel panel-default login-box">
		  	<div class="panel-heading">
		    	<h3 class="panel-title">Please sign in</h3>
		 	</div>
		  	<div class="panel-body">
			  	<c:if test="${not empty error}">
					<div class="alert alert-danger">
						<spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/><br />
					</div>
				</c:if>
			    	<form action="<spring:url value="/j_spring_security_check"></spring:url>" method="post">
	                   <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form:input-large" placeholder="User Name" name='j_username' type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class=" form:input-large" placeholder="Password" name='j_password'  type="password" value="">
			    		</div>
			    		<input class="btn btn-lg btn-success btn-mini" type="submit" value="Login">
			    	</fieldset>
			      	</form>
			    </div>
		</div>
	</div>
	<div class="footer-container">
		<p class="copyright-message">@Copyright: AKM Qamruzzaman</p>
	</div>
</body>
