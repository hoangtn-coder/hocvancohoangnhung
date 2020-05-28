<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="<spring:url value="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css"/>">
<script src="<spring:url value="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"/>"></script>

<c:if test="${totalPages > 1}">
	<%-- <nav aria-label="Page navigation">
		<ul class="pagination pull-right">
			<c:if test="${currentPage > 1}">
				<li class="prev"><a href="#" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<li class="">
				<a class="">
					<select class="form-control selectpicker" id="mPaging" onchange="doChangePage()" data-live-search="true">
						<c:forEach var="pageIndex" begin="1" end="${totalPages}">
							<c:choose>
								<c:when test="${pageIndex == currentPage}">
									<option selected="selected" value="${pageIndex}">${pageIndex}</option>		
								</c:when>
								<c:otherwise>
									<option value="${pageIndex}">${pageIndex}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				    </select>	
				</a>
				
			</li>
			<c:if test="${currentPage < totalPages}">
				<li class="next"><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav> --%>
	
	<!-- Pagination -->
    <ul class="pagination justify-content-center">
    	<c:if test="${currentPage > 1}">
    		<li class="page-item prev">
		        <a class="page-link" href="#" aria-label="Previous">
		          <span aria-hidden="true">«</span>
		          <span class="sr-only">Previous</span>
		        </a>
	    	</li>
    	</c:if>
    	
    	<c:forEach var="pageIndex" begin="1" end="${totalPages}">
    		<li class="page-item">
        		<c:choose>
					<c:when test="${pageIndex == currentPage}">
						<a class="page-link" href="#" style="font-weight: bold;">${pageIndex}</a>
					</c:when>
					<c:otherwise>
						<a class="page-link" href="#" onclick="doChangePage(${pageIndex})">${pageIndex}</a>
					</c:otherwise>
				</c:choose>
			</li>	
    	</c:forEach>
      
		<c:if test="${currentPage < totalPages}">
	      	<li class="page-item next">
		        <a class="page-link" href="#" aria-label="Next">
		          <span aria-hidden="true">»</span>
		          <span class="sr-only">Next</span>
		        </a>
	        </li>
		</c:if>
    </ul>
</c:if>

<script type="text/javascript">
	
	function doChangePage(page) {
		goToPage(page);
	}
	function onClickPrevPage() {
		var currentPage = parseInt($("#search-form-page").val());
		goToPage(currentPage - 1);
	}
	function onClickNextPage() {
		var currentPage = parseInt($("#search-form-page").val());
		goToPage(currentPage + 1);
	}
	function onClickPage() {
		var page = parseInt($(this).text());
		goToPage(page);
	}
	function goToPage(page) {
		$('#search-form-page').val(page);
		$('#search-form').submit();
	}
	function initPaging() {
		$('ul.pagination > li.prev > a').click(onClickPrevPage);
		$('ul.pagination > li.next > a').click(onClickNextPage);
		$('ul.pagination > li.page > a').click(onClickPage);
	}
	$(document).ready(initPaging);
</script>
