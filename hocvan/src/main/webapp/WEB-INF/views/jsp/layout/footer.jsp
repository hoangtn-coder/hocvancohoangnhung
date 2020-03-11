<%@page language="java" pageEncoding="UTF-8"%>
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
