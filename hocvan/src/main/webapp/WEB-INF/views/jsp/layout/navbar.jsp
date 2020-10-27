<%@page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand"  href="index.html">
			<%-- <img class="" src="<spring:url value="resources/img/logo.PNG"/>" alt=""> --%>
			Trang Chủ
			</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<!-- <li class="nav-item"><a class="nav-link" href="/hocvan/login2">Login2</a>
					</li> -->
					<!-- <li class="nav-item"><a class="nav-link" href="/hocvan/coming-soon">Coming soon</a>
					</li> -->
					<li class="nav-item"><a class="nav-link" href="contact.html">Giới thiệu</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdown" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Lớp học </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="portfolio-1-col.html">Văn 9</a> 
							<a class="dropdown-item" href="portfolio-2-col.html">Văn 10</a> 
							<a class="dropdown-item" href="portfolio-3-col.html">Văn 12</a> 
						</div>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdown1" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Tài liệu </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown1">
							<a class="dropdown-item" href="portfolio-1-col.html">Văn 9</a> 
							<a class="dropdown-item" href="portfolio-2-col.html">Văn 10</a> 
							<a class="dropdown-item" href="portfolio-3-col.html">Văn 12</a> 
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="/hocvan/news">Tin tức</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact.html">Liên hệ</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/hocvan/register">Đăng ký</a>
					</li>	
					<li class="nav-item"><a class="nav-link" href="/hocvan/login">Đăng nhập</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>