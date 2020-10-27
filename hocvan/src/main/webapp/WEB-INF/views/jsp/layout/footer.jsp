<%@page language="java" pageEncoding="UTF-8"%>
<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="footer-contact">
						<!-- <a href="/" class="footer-logo"><img
							src="//theme.hstatic.net/1000240687/1000308104/14/footer_logo.png?v=403"
							alt="Sách ơi mở ra"></a> -->
						<h6>Học Văn Cô Hoàng Nhung</h6>
						<p>Địa chỉ:...</p>
						<p>
							Tổng đài hỗ trợ: <a href="tel:0169 670 8418">0169 670 8418</a>
						</p>
						<p>
							Email: <a href="mailto: hocvancohoangnhung@gmail.com">
								hocvancohoangnhung@gmail.com</a>
						</p>
						<p>
							Website: <a href="https://hocvancohoangnhung.com">https://hocvancohoangnhung.com</a>
						</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="footer-subscribe">
						<h6>Đăng ký nhận tin</h6>
						<p>
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
						<!-- <p class="footer-title">Liên kết với chúng tôi</p> -->
						<h6>Liên kết với chúng tôi</h6>
						<iframe
							src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FHocVanCoHoangNhung%2F&tabs&width=255&height=300&small_header=true&adapt_container_width=true&hide_cover=false&show_facepile=true&appId=1650103138566297"
							width="255" height="300" style="border: none; overflow: hidden"
							scrolling="no" frameborder="0" allowTransparency="true"
							allow="encrypted-media"></iframe>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="footer-nav">
						<h6>Liên kết nhanh</h6>
						<ul class="no-bullets">

							<li><a href="#" title="Giới thiệu"><i
									class="fa fa-angle-right" aria-hidden="true"></i> Giới thiệu</a>
							</li>

							<li><a href="#" title="Lớp học"><i
									class="fa fa-angle-right" aria-hidden="true"></i> Lớp học</a>
							</li>

							<li><a href="#" title="Tài liệu"><i
									class="fa fa-angle-right" aria-hidden="true"></i> Tài liệu</a>
							</li>

							<li><a href="#" title="Tin tức"><i
									class="fa fa-angle-right" aria-hidden="true"></i> Tin tức</a>
							</li>

							<li><a href="#" title="Liên hệ"><i
									class="fa fa-angle-right" aria-hidden="true"></i> Liên hệ</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<p class="m-0 text-center text-white">Copyright &copy; 2019 by Học văn cô Hoàng Nhung. Powered by <a href="#">Hoangtn</a></p>
		</div>
		<!-- /.container -->
	</footer>
