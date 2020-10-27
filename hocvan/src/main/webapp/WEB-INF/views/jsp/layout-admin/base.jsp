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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	
	
	<title><tiles:getAsString name="title" /></title>
	
	<!-- Custom fonts for this template-->
	<link href="<spring:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" />
	<link href="<spring:url value="/resources/css/admin/fonts-googleapis.css"/>" rel="stylesheet">
	
	<!-- Custom fonts for this template-->
    <link href="<spring:url value="/resources/css/admin/sb-admin-2.min.css"/>" rel="stylesheet" />
    <link href="<spring:url value="/resources/css/admin/custom.css"/>" rel="stylesheet" />
    
    <c:forEach var="css" items="${stylesheets}">
		<link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>?v=20200527">
	</c:forEach>
	
</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
  	<tiles:insertAttribute name="menu" />
  	
  	<!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
    	<!-- Main Content -->
    	<div id="content">
    		<tiles:insertAttribute name="navbar" />
    		<tiles:insertAttribute name="body" />
    		
    		<!-- Begin Page Content -->
    		<div class="container-fluid">
    			<!-- Begin DivGrid -->
    			<div id="divGrid">
    				<tiles:insertAttribute name="divGrid" />
    			</div>
    			
    			<!-- Begin DivDetail -->
    			<div id="divDetail">
    				<tiles:insertAttribute name="divDetail" />
    				
    				<div class="row">
	          			<div class="col-xl-12 col-lg-7">
	          				<div class="card shadow mb-4">
	          					<div class="card-body">
	          						<div align="center" class="divaction">
							        	<input type="button" onclick="save();" value="Lưu" id="btnSave" class="btn btn-primary"> 
							        	<input type="button" onclick="showConfirmDel()" value="Xóa" id="btnDel" class="btn btn-danger"> 
							            <input type="button" onclick="cancel()" value="Bỏ qua" id="btlCancel" class="btn btn-secondary">
							            <!-- <a href="/hocvan/admin/management/news" class="btn btn-secondary">Bỏ qua</a> -->
							        </div>
	          					</div>
	          				</div>
	          			</div>
	          		</div>
    			</div>
    			
    			<!-- Modal Message -->
				<div id="myModal" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				    <!-- Modal content-->
				    <div class="modal-content msg">
				        <div class="alert alert-success alert-dismissible">
					  	</div>
				    </div>
				  </div>
				</div>
			
				<!-- Modal -->
				<div id="myModalDel" class="modal fade" role="dialog">
				  <div class="modal-dialog modal-sm">
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-body">
				        <p>Bạn có chắc chắn xóa bản ghi?</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
				        <input type="button" onclick="del()" value="Xóa" class="btn btn-danger" data-dismiss="modal"> 
				      </div>
				    </div>
				  </div>
				</div>
				
    		</div>
    		<!-- /.container-fluid -->
    	</div>
    	<!-- End of Main Content -->
    	
    	<!-- Footer -->
    	<tiles:insertAttribute name="footer" />
    	<!-- End of Footer -->
    </div>
  </div>
  <!-- End of Page Wrapper -->
  
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  
  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Sẵn sàng rời đi?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Chọn "Đăng xuất" bên dưới nếu bạn đã sẵn sàng kết thúc phiên hiện tại của mình.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
          
          <!-- logout spring security -->
          <form action="<c:url value="/j_spring_security_logout" />" method="post">
		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		    <input class="btn btn-primary" type="submit" value="Đăng xuất" />
		  </form>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Bootstrap core JavaScript -->
  <script src="<spring:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
  <script src="<spring:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	
  <!-- Core plugin JavaScript-->
  <script src="<spring:url value="/resources/vendor/jquery-easing/jquery.easing.min.js" />"></script>
	
  <!-- Custom scripts for all pages-->
  <script src="<spring:url value="/resources/js/admin/sb-admin-2.min.js" />"></script>
  
  <c:forEach var="script" items="${javascripts}">
	<script src="<c:url value="${script}"/>"></script>
  </c:forEach>
  
  <script src="<spring:url value="/resources/js/jquery.validate.min.js" />"></script>
  
  <!-- Custom scripts hoangtn-->
  <script src="<spring:url value="/resources/js/main.js" />"></script>
  <script src="<spring:url value="/resources/js/messages_vi.js" />"></script>
  
  <tiles:insertAttribute name="extra-scripts"/>
</body>
</html>