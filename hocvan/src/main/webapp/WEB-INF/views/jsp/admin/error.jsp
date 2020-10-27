<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="base-admin">
	<tiles:putAttribute name="title" value="Error" />
	<tiles:putAttribute name="menu" value="" />
    <tiles:putAttribute name="navbar" value="" />
    <tiles:putAttribute name="footer" value="/WEB-INF/views/jsp/layout-admin/footer.jsp" />
	<tiles:putAttribute name="body">
		<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- 404 Error Text -->
          <div class="text-center">
            <div class="error-404 mx-auto" data-text="404">
            <p>404</p></div>
            <p class="lead text-gray-800 mb-5">Không tìm thấy trang</p>
            <!-- <p class="text-gray-500 mb-0">It looks like you found a glitch in the matrix...</p> -->
            <a href="dashboard.html">&larr; Quay lại Dashboard</a>
          </div>

        </div>
        <!-- /.container-fluid -->
	</tiles:putAttribute>
</tiles:insertDefinition>    