<%@page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="base">
	<tiles:putAttribute name="title" value="Tin tức" />
	<tiles:putAttribute name="header" value="/WEB-INF/views/jsp/layout/header.jsp"/>
	<tiles:putAttribute name="body" value="/WEB-INF/views/jsp/layout/body.jsp"/>
	<tiles:putListAttribute name="stylesheets">
		<tiles:addAttribute value="/resources/css/news.css"/>
	</tiles:putListAttribute>
</tiles:insertDefinition>