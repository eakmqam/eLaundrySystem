<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainLayout.css"/>
	<title>eLaundry System</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1><spring:message code="welcome.message"/></h1><br />
				<p>Language : <a href="?language=en">English</a></p> 
				<security:authorize access="isAuthenticated()">
  					Welcome  <security:authentication property="principal.username" />
  					<br />
  					<a href="<c:url value="/j_spring_security_logout" />" class="btn btn-danger btn-mini pull-right">logout</a>	
				</security:authorize>
			</div>	 
 			<div class="container">
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
			</div>	
	 			<div class="pull-left"> <h3>${SpecialBlurb}</h3> </div>
		</div>	
	</section>
	
</body>
</html>
