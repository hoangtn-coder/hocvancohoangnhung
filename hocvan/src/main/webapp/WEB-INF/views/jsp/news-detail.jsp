<%@page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

  <tiles:putAttribute name="title" value="${titleNews}" />
  
  <!-- Page Content -->
  <div class="container">
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3"><c:out value="${titleNews}" />
      <!-- <small>by
        <a href="#">Start Bootstrap</a>
      </small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Trang chủ</a>
      </li>
      <li class="breadcrumb-item active">Tin tức</li>
      	<c:if test="${not empty titleNews}">
      		<li class="breadcrumb-item active">${titleNews}</li>
      	</c:if>
    </ol>

    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <!-- Preview Image -->
        <img class="img-fluid rounded" src='<c:url value="${previewImage}" />' alt="">
        <!-- <img class="img-fluid rounded" src='resources/img/img2.jpg' alt=""> -->

        <hr>

        <!-- Date/Time -->
        <!-- <p>Posted on January 1, 2017 at 12:00 PM</p> -->
        <p><c:out value="${createDate}" /></p>

        <hr>

        <!-- Post Content -->
        
        <c:out value="${content}" escapeXml="false"/>
        <hr>

        <!-- Comments Form -->
<!--         <div class="card my-4">
          <h5 class="card-header">Leave a Comment:</h5>
          <div class="card-body">
            <form>
              <div class="form-group">
                <textarea class="form-control" rows="3"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
          </div>
        </div> -->

        <!-- Single Comment -->
<!--         <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
          </div>
        </div> -->

        <!-- Comment with nested comments -->
        <!-- <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">Commenter Name</h5>
            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

            <div class="media mt-4">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
              <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
              </div>
            </div>

          </div>
        </div> -->

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">
        
        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">Bài viết gần đây</h5>
          <div class="card-body">
	          <c:forEach items="${lstNews}" var="item" varStatus="loop">
	          	<div class="item-news">
	                <h3 class="title-news">
	                	<a href="/hocvan/news-detail?newsId=<c:out value="${item.id}" />" title="<c:out value="${item.title}" />">
	                	<img class="img-fluid rounded" src='<c:url value="${item.previewImage}" />' alt="<c:url value="${item.title}" />"></a>
	                    <a href="/hocvan/news-detail?newsId=<c:out value="${item.id}" />" 
	                    	title="<c:out value="${item.title}" />">
	                        <c:out value="${item.title}" />
	                    </a>
	                </h3>
	            </div>
	            <hr>
			  </c:forEach>
          </div>
        </div>

        <!-- Tag Widget -->
        <div class="card my-4">
          <h5 class="card-header">Tag</h5>
          <div class="card-body">
          	<div class="tag-widget">
          		<c:forEach items="${lsTagtWidget}" var="item" varStatus="loop">
          			<a href="<c:out value="${item.urlWidget}" />"><c:out value="${item.titleWidget}" /></a>
          		</c:forEach>
          	</div>
          </div>
        </div>

      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->