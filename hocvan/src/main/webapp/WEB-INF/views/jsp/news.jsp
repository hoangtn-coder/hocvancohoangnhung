<%@page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <!-- <h1 class="mt-4 mb-3">Tin tức
      <small>by
        <a href="#">Start Bootstrap</a>
      </small>
    </h1> -->
    
    <p></p>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Trang chủ</a>
      </li>
      <li class="breadcrumb-item active">Tin tức</li>
    </ol>
    
    <form id="search-form" action="<spring:url value="/news-search"/>" method="GET">
   		<input type="hidden" name="page" id="search-form-page" value="${currentPage}" />
		<%-- <div class="col-xs-12 col-sm-6 col-md-4">
			<div class="form-group">
				<input type="text"
					class="form-control" id="search-form-text" name="keyWord" value="${keyWord}">
			</div>
		</div>
		<div class="col-xs-12">
			<button id="btnSearch" type="submit" class="btn btn-primary">
				Tìm Kiếm
			</button>
		</div> --%>
		
		<div class="card mb-4">	
			<div class="card-body">
				<div class="input-group">
					<input type="text" class="form-control" id="txtKeyWord" name="keyWord" placeholder="Tìm kiếm..." value="${keyWord}">
					<span class="input-group-append">
						<button class="btn btn-secondary" type="submit"><i class="fa fa-search"></i></button>
					</span>
				</div>
			</div>
		</div>
	</form>

	<!-- row -->
    <div class="row">
    	<c:forEach items="${lstNews}" var="item" varStatus="loop">
    		<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
		        <div class="card h-100">
		          <a href="/hocvan/news-detail?newsId=<c:out value="${item.id}" />" title="<c:out value="${item.title}" />">
		          	<img class="card-img-top" src='<c:url value="${item.previewImage}" />' alt="<c:out value="${item.title}" />">
		          </a>
		          <div class="card-body item-news">
		            <h3 class="title-news">
		              <a href="/hocvan/news-detail?newsId=<c:out value="${item.id}" />"><c:out value="${item.title}" /></a>
		            </h3>
		            <p class="card-text"><c:out value="${item.description}" /></p>
		          </div>
		        </div>
	    	</div>
    	</c:forEach>
    </div>
    
    <jsp:include page="../jsp/common/paging.jsp"></jsp:include>
    
  </div>
  <!-- /.container -->
  
  <tiles:putAttribute name="extra-scripts">
  	<script type="text/javascript">
  		
  	function findData(){
  		var keyWord =$("#txtKeyWord").val();
		$.ajax({
            url: '/hocvan/news-search?keyWord=' + keyWord,
            method: 'GET'
        });
	}
  	
  	</script>
  </tiles:putAttribute>
  
  