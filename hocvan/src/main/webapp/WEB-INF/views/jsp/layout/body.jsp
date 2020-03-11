<%@page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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