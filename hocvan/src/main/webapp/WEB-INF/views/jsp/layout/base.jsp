<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 

<tiles:importAttribute name="javascripts" ignore="true" />
<tiles:importAttribute name="stylesheets" ignore="true" />

<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!-- <title>Học văn</title> -->
	<%-- <tiles:importAttribute name="title" scope="request" />
	<title><spring:message code="${title}" /></title> --%>
	<%-- <title><tiles:getAsString name="title" /></title> --%>
	
	<title><tiles:insertAttribute name="title"/></title>
	
	<c:forEach var="css" items="${stylesheets}">
		<link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>?v=20200527">
	</c:forEach>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- Bootstrap core CSS -->
	<link href="<spring:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" />
	
	<!-- Custom styles for this template -->
	<link href="<spring:url value="/resources/css/modern-business.css"/>" rel="stylesheet" />
	
	<c:forEach var="script" items="${javascripts}">
		<script src="<c:url value="${script}"/>?v=20200527"></script>
	</c:forEach>
	
	<!-- Bootstrap core JavaScript -->
	<script src="<spring:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script src="<spring:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</head>
<body>
  <tiles:insertAttribute name="navbar" />
  <tiles:insertAttribute name="header" />
  <tiles:insertAttribute name="body" />
  <tiles:insertAttribute name="footer" />
  <tiles:insertAttribute name="extra-scripts"/>
</body>
</html>