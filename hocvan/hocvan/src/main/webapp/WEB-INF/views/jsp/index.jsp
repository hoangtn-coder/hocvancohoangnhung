<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Học văn</title>
<!-- Bootstrap core CSS -->
<link href="<spring:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="<spring:url value="/resources/css/modern-business.css"/>" rel="stylesheet" />
</head>

<body>

	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.html">Trang Chủ</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="/hocvan/login">Đăng nhập</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/hocvan/login2">Login2</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/hocvan/coming-soon">Coming soon</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/hocvan/register">Đăng ký</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="about.html">About</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="services.html">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Portfolio </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="portfolio-1-col.html">1 Column
								Portfolio</a> <a class="dropdown-item" href="portfolio-2-col.html">2
								Column Portfolio</a> <a class="dropdown-item"
								href="portfolio-3-col.html">3 Column Portfolio</a> <a
								class="dropdown-item" href="portfolio-4-col.html">4 Column
								Portfolio</a> <a class="dropdown-item" href="portfolio-item.html">Single
								Portfolio Item</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Blog </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
							<a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
							<a class="dropdown-item" href="blog-post.html">Blog Post</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Other Pages </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="full-width.html">Full Width
								Page</a> <a class="dropdown-item" href="sidebar.html">Sidebar
								Page</a> <a class="dropdown-item" href="faq.html">FAQ</a> <a
								class="dropdown-item" href="404.html">404</a> <a
								class="dropdown-item" href="pricing.html">Pricing Table</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('<spring:url value="resources/img/img1.png"/>')">
					<div class="carousel-caption d-none d-md-block">
						<h3>First Slide</h3>
						<p>This is a description for the first slide.</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('<spring:url value="resources/img/img2.jpg"/>')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Second Slide</h3>
						<p>This is a description for the second slide.</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('http://placehold.it/1900x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Third Slide</h3>
						<p>This is a description for the third slide.</p>
					</div>
				</div>
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

	<!-- Page Content -->
	<div class="container">

		<h2 class="my-4"><span class="h2">Tin tức</span> nổi bật</h2>

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Bài viết 1</h4>
					<div class="card-body">
						<p class="card-text">Mô tả 1.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Bài viết 2</h4>
					<div class="card-body">
						<p class="card-text">Mô tả 2.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Bài viết 3</h4>
					<div class="card-body">
						<p class="card-text">Mô tả 2.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Portfolio Section -->
		<h2 class="my-4"><span class="h2">Tài liệu</span> tham khảo</h2>

		<div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="<spring:url value="resources/img/sach11.jpg"/>" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project One</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Amet numquam aspernatur eum quasi sapiente
							nesciunt? Voluptatibus sit, repellat sequi itaque deserunt,
							dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="<spring:url value="resources/img/sach12.jpg"/>" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project Two</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="<spring:url value="resources/img/docchieu.jpg"/>" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project Three</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Quos quisquam, error quod sed cumque, odio
							distinctio velit nostrum temporibus necessitatibus et facere
							atque iure perspiciatis mollitia recusandae vero vel quam!</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Features Section -->
		<!-- <div class="row">
			<div class="col-lg-6">
				<h2>Modern Business Features</h2>
				<p>The Modern Business template by Start Bootstrap includes:</p>
				<ul>
					<li><strong>Bootstrap v4</strong></li>
					<li>jQuery</li>
					<li>Font Awesome</li>
					<li>Working contact form with validation</li>
					<li>Unstyled page elements for easy customization</li>
				</ul>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Corporis, omnis doloremque non cum id reprehenderit, quisquam totam
					aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis
					quia dolorum ducimus unde.</p>
			</div>
			<div class="col-lg-6">
				<img class="img-fluid rounded" src="http://placehold.it/700x450"
					alt="">
			</div>
		</div> -->
		<!-- /.row -->

		
		<!-- Portfolio Section -->
		<h2 class="my-4"><span class="h2">Thành viên</span> dự án</h2>

		<div class="row">
			<div class="col-sm-4">
				<div class="team-member">
					<img class="mx-auto rounded-circle"
						src="<spring:url value="resources/img/1.jpg"/>" alt="">
					<h4>Kay Garland</h4>
					<p class="text-muted">Lead Designer</p>
					<ul class="list-inline social-buttons">
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-facebook-f"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-linkedin-in"></i>
						</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="team-member">
					<img class="mx-auto rounded-circle" src="<spring:url value="resources/img/2.jpg"/>" alt="">
					<h4>Larry Parker</h4>
					<p class="text-muted">Lead Marketer</p>
					<ul class="list-inline social-buttons">
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-facebook-f"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-linkedin-in"></i>
						</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="team-member">
					<img class="mx-auto rounded-circle" src="<spring:url value="resources/img/3.jpg"/>" alt="">
					<h4>Diana Pertersen</h4>
					<p class="text-muted">Lead Developer</p>
					<ul class="list-inline social-buttons">
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-facebook-f"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-linkedin-in"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3 col-sm-6">
				<a href="#"> <img class="img-fluid d-block mx-auto"
					src="<spring:url value="resources/img/envato.jpg"/>" alt="">
				</a>
			</div>
			<div class="col-md-3 col-sm-6">
				<a href="#"> <img class="img-fluid d-block mx-auto"
					src="<spring:url value="resources/img/designmodo.jpg"/>" alt="">
				</a>
			</div>
			<div class="col-md-3 col-sm-6">
				<a href="#"> <img class="img-fluid d-block mx-auto"
					src="<spring:url value="resources/img/themeforest.jpg"/>" alt="">
				</a>
			</div>
			<div class="col-md-3 col-sm-6">
				<a href="#"> <img class="img-fluid d-block mx-auto"
					src="<spring:url value="resources/img/creative-market.jpg"/>" alt="">
				</a>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="footer-contact">
						<a href="/" class="footer-logo"><img
							src="//theme.hstatic.net/1000240687/1000308104/14/footer_logo.png?v=403"
							alt="Sách ơi mở ra"></a>
						<p>SÁCH ƠI MỞ RA</p>
						<p>Địa chỉ: Số 49, Dịch Vọng, Cầu Giấy, Hà Nội</p>
						<p>
							Tổng đài hỗ trợ: <a href="tel:0169 670 8418">0169 670 8418</a>
						</p>
						<p>
							Email: <a href="mailto: sachoimora.ts@gmail.com">
								sachoimora.ts@gmail.com</a>
						</p>
						<p>
							Website: <a href="https://sachoimora.vn">https://sachoimora.vn</a>
						</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="footer-subscribe">
						<p class="footer-title">Đăng ký nhận tin</p>
						<p>
							Dự án phát triển văn hoá đọc với các hệ thống lớp học tích hợp
							"Đọc sách - Trải nghiệm - Hành động"<br> Sách ơi mở ra hiện
							có 2 cơ sở tại Cầu Giấy, Hà Đông<br> Đăng ký nhận tin! <br>



						</p>
						<form name="myForm" onsubmit="validateForm()"
							accept-charset="UTF-8" action="/account/contact"
							class="contact-form" method="post">
							<input name="form_type" type="hidden" value="customer"> <input
								name="utf8" type="hidden" value="✓">


							<div class="input-group">
								<input type="email" value="" placeholder="email@example.com"
									name="contact[email]" id="Email" class="input-group-field"
									aria-label="email@example.com" autocorrect="off"
									autocapitalize="off"> <input type="hidden"
									name="contact[tags]" value="newsletter"> <span
									class="input-group-btn">
									<button type="submit" class="btn">
										<i class="fa fa-paper-plane" aria-hidden="true"></i>
									</button>
								</span>
							</div>

						</form>

						<script>
						function validateForm() {
							var x = document.forms["myForm"]["contact[email]"].value;
							var atpos = x.indexOf("@");
							var dotpos = x.lastIndexOf(".");
							if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
								alert("Not a valid e-mail address");
								return false;
							}else{
								alert('Bạn đã đăng ký thành công');		
							}
						}
						</script>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="footer-connect">
						<p class="footer-title">Liên kết với chúng tôi</p>
						<iframe
							src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FHocVanCoHoangNhung%2F&tabs&width=255&height=300&small_header=true&adapt_container_width=true&hide_cover=false&show_facepile=true&appId=1650103138566297"
							width="255" height="300" style="border: none; overflow: hidden"
							scrolling="no" frameborder="0" allowTransparency="true"
							allow="encrypted-media"></iframe>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="footer-nav">
						<p class="footer-title">Liên kết nhanh</p>
						<ul class="no-bullets">

							<li><a href="/pages/gioi-thieu" title="Giới thiệu"><i
									class="fa fa-angle-right" aria-hidden="true"></i> Giới thiệu</a></li>

							<li><a href="/pages/nghe-thuat-doc" title="Chương trình"><i
									class="fa fa-angle-right" aria-hidden="true"></i> Chương trình</a>
							</li>

							<li><a href="/pages/tai-lieu" title="Tài liệu"><i
									class="fa fa-angle-right" aria-hidden="true"></i> Tài liệu</a></li>

							<li><a href="/pages/lich-hoc" title="Lịch học"><i
									class="fa fa-angle-right" aria-hidden="true"></i> Lịch học</a></li>

							<li><a href="/blogs/news" title="Tin tức"><i
									class="fa fa-angle-right" aria-hidden="true"></i> Tin tức</a></li>

							<li><a href="/pages/ve-chung-toi" title="Liên hệ"><i
									class="fa fa-angle-right" aria-hidden="true"></i> Liên hệ</a></li>

						</ul>
					</div>
				</div>
			</div>

			<p class="m-0 text-center text-white">Copyright &copy; 2019 by Học văn cô Hoàng Nhung. Powered by <a href="#">Hoangtn</a></p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="<spring:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script src="<spring:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

</body>

</html>
