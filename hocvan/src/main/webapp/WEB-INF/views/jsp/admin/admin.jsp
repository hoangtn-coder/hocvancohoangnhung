<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="base-admin">
	<tiles:putAttribute name="title" value="Admin" />
	<%-- <tiles:putAttribute name="body">
	</tiles:putAttribute> --%>
</tiles:insertDefinition>