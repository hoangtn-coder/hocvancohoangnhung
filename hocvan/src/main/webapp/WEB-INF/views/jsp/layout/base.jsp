<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<html>
<head>
  	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!-- <title>Học văn</title> -->
	<title><tiles:getAsString name="title" /></title>
	
	<!-- Bootstrap core CSS -->
	<link href="<spring:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" />
	
	<!-- Custom styles for this template -->
	<link href="<spring:url value="/resources/css/modern-business.css"/>" rel="stylesheet" />
	
	<!-- Bootstrap core JavaScript -->
	<script src="<spring:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script src="<spring:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</head>
<body>
  <tiles:insertAttribute name="navbar" />
  <tiles:insertAttribute name="header" />
  <tiles:insertAttribute name="body" />
  <tiles:insertAttribute name="footer" />
</body>
</html>