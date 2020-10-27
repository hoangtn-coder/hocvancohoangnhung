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
	
	<style type="text/css">
		.scroll-to-top {
		    position: fixed;
		    right: 1rem;
		    bottom: 1rem;
		    display: none;
		    width: 2.75rem;
		    height: 2.75rem;
		    text-align: center;
		    color: #fff;
		    background: rgba(90, 92, 105, .5);
		    line-height: 46px;
		}
		.rounded {
		    border-radius: .35rem!important;
		}
	</style>
	<!-- <title>Học văn</title> -->
	<%-- <tiles:importAttribute name="title" scope="request" />
	<title><spring:message code="${title}" /></title> --%>
	<%-- <title><tiles:getAsString name="title" /></title> --%>
	
	<title><tiles:insertAttribute name="title"/></title>
	
	<c:forEach var="css" items="${stylesheets}">
		<%-- <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>?v=20200527"> --%>
		<link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
	</c:forEach>
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
	<link href="<spring:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" />
	
	<!-- Bootstrap core CSS -->
	<link href="<spring:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" />
	
	<!-- Custom styles for this template -->
	<link href="<spring:url value="/resources/css/modern-business.css"/>" rel="stylesheet" />
	
	<c:forEach var="script" items="${javascripts}">
		<%-- <script src="<c:url value="${script}"/>?v=20200527"></script> --%>
		<script src="<c:url value="${script}"/>"></script>
	</c:forEach>
	
	<!-- Bootstrap core JavaScript -->
	<script src="<spring:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script src="<spring:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</head>
<body>
  <tiles:insertAttribute name="navbar" />
  <tiles:insertAttribute name="header" />
  <tiles:insertAttribute name="body" />
  
  <!-- Scroll to Top Button-->
	<a id="back-to-top" class="scroll-to-top rounded" href="#">
    	<i class="fas fa-angle-up"></i>
  	</a>

	<tiles:insertAttribute name="footer" />
  <tiles:insertAttribute name="extra-scripts"/>
</body>
<script type="text/javascript">
	$(window).scroll(function () {
	    if ($(this).scrollTop() > 50) {
	        $('#back-to-top').fadeIn();
	    } else {
	        $('#back-to-top').fadeOut();
	    }
	});
	// scroll body to 0px on click
	$('#back-to-top').click(function () {
	    $('#back-to-top').tooltip('hide');
	    $('body,html').animate({
	        scrollTop: 0
	    }, 800);
	    return false;
	});
</script>
</html>