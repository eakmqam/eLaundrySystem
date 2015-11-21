<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>eLaundry System</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/controls.css"/>
</head>
<body>
	<form:form modelAttribute="laundryItem" action="laundryItem" method="post">
		<fieldset class="add-form-small">
			<legend>Add Service Item</legend>
			<table>
				<form:hidden path="itemId" id="itemId"></form:hidden>
				<tr>
					<td class="align-right"><label for="service">Service: </label></td>
					<td>
						<form:select path="service" class="input-large">
							<c:forEach var="laundryService" items="${laundryServices}">
								<form:option value="${laundryService}">${laundryService.name}</form:option>
							</c:forEach>
						</form:select>
						<form:errors path="service" cssClass="error-message"/>
					</td>
				</tr>
				<tr class="blank-row"><td colspan="2"></td></tr>
				<tr>
					<td class="align-right"><label for="name">Name: </label></td>
					<td>
						<form:input path="name" class="input-large" />*
						<form:errors path="name" cssClass="error-message"/>
					</td>
				</tr>
				<tr class="blank-row"><td colspan="2"></td></tr>
				<tr>
					<td class="align-right vertical-align"><label for="description">Description: </label></td>
					<td class="vertical-align">
						<form:textarea path="description" class="input-large" row="5" />*
						<form:errors path="description" cssClass="error-message"/>
					</td>
				</tr>
				<tr class="blank-row"><td colspan="2"></td></tr>
				<tr>
					<td class="align-right"><label for="price">Price: </label></td>
					<td>
						<form:input path="price" class="input-small" />*
						<form:errors path="price" cssClass="error-message"/>
					</td>
				</tr>
				<tr class="blank-row"><td colspan="2"></td></tr>
				<tr>
					<td class="align-right"><label for="status">Status: </label></td>
					<td>
						<form:select path="status" class="input-small">
							<form:option value="Active">Active</form:option>
							<form:option value="Inactive">Inactive</form:option>
						</form:select>
					</td>
				</tr>
				<tr class="blank-row"><td colspan="2"></td></tr>
				<tr>
					<td>&nbsp;</td>
					<td>
						<input type="submit" value="Save">
					</td>
				</tr>
			</table>
		</fieldset>
	</form:form>
</body>
</html>