<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Helo Spring MVC + JDBC</title>
</head>
<body>
	<a href="<c:url value="/customer-list" />" >List Customer</a><br />
	<h1>View Customer:</h1>	
	Customer ID: ${customer.id} <br/>
	Customer Name: ${customer.name} <br/>
	Customer Address: ${customer.address} <br/>
</body>
</html>