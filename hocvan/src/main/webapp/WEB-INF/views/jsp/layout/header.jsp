<%@page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<c:forEach items="${lstSlide}" var="item" varStatus="loop">
					<c:choose>
						<c:when test="${loop.index == 0}">
							<li data-target="#carouselExampleIndicators" data-slide-to="${loop.index}" class="active"></li>
						</c:when>
						<c:otherwise>
							<li data-target="#carouselExampleIndicators" data-slide-to="${loop.index}"></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- <li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li> -->
			</ol>
			<div class="carousel-inner" role="listbox">
			
				<c:forEach items="${lstSlide}" var="item" varStatus="loop">
					<c:choose>
						<c:when test="${loop.index == 0}">
							<div class="carousel-item active"
								style="background-image: url('<c:url value="${item.imagePath}" />')">
							</div>
						</c:when>
						<c:otherwise>
							<div class="carousel-item"
								style="background-image: url('<c:url value="${item.imagePath}" />')">
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- Slide One - Set the background image for this slide in the line below -->
				<%-- <div class="carousel-item active"
					style="background-image: url('<spring:url value="resources/img/img1.png"/>')">
					<div class="carousel-caption d-none d-md-block">
						<h3>First Slide</h3>
						<p>This is a description for the first slide.</p>
					</div>
				</div> --%>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<%-- <div class="carousel-item"
					style="background-image: url('<spring:url value="resources/img/img2.jpg"/>')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Second Slide</h3>
						<p>This is a description for the second slide.</p>
					</div>
				</div> --%>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<!-- <div class="carousel-item"
					style="background-image: url('http://placehold.it/1900x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Third Slide</h3>
						<p>This is a description for the third slide.</p>
					</div>
				</div> -->
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>