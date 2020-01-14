<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Helo Spring MVC + JDBC</title>
</head>
<body>
	<a href="<c:url value="/customer-list" />">List Customer</a>
	<br />

	<h1>Edit Customer:</h1>
	<c:url value="/updateCustomer" var="updateCustomer" />
	<form:form action="${updateCustomer}" method="POST" modelAttribute="customer">
	    Id: <form:input path="id" readonly="true" /> <br/> <br/>
    	Name: <form:input path="name" /> <br/> <br/>
    	Address: <form:input path="address" /> <br/> <br/>
		<button type="submit">Submit</button>
	</form:form>

</body>
</html>