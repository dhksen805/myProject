<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- CSS -->
<link rel="stylesheet" href="assets/css/reset18.css">
<link rel="stylesheet" href="assets/css/style18.css">
<link rel="stylesheet" href="assets/css/swiper.css">
<link rel="stylesheet" href="assets/css/font-awesome.css">


<style>
.poster{
float:left;

}
.poster1{
float:left;

}
.poster2 {
float:left;

}
.foot{
float:left;
clear:both;

}
</style>

</head>
<body>


	<!-- //header -->
	<jsp:include page="../inc/top.jsp" />
	<!-- //header -->
					<div class="movie_chart">
						<div class="swiper-container2">
							<div class="chart_cont1 swiper-wrapper">
									<div class="poster">
										<figure>
											<img src="../assets/img/end.jpg "
												width="300" height="300" alt="엔드게임">
										</figure>
										<h3>
											<span class="icon all ir_pm">15세</span> <strong>엔드게임</strong>
										</h3>
										<div class="infor_btn">
											<a href="#">상세보기</a>
										</div>
									</div>
								</div>
									<div class="poster">
										<figure>
											<img src="../assets/img/pae.jpg "
												width="300" height="300" alt="기생충">
										</figure>
										<h3>
											<span class="icon a12 ir_pm">19세</span> <strong>기생충</strong>
										</h3>
										<div class="infor_btn">
											<a href="#">상세보기</a>
										</div>
									</div>
								</div>
									<div class="poster1">
										<figure>
											<img src="../assets/img/spy.jpg "
												width="300" height="300" alt="스파이더맨">
										</figure>
										<h3>
											<span class="icon a15 ir_pm">12세</span> <strong>스파이더맨</strong>
										</h3>
										<div class="infor_btn">
											<a href="#">상세보기</a>
										</div>
									</div>
								</div>
									<div class="poster1">
										<figure>
											<img src="../assets/img/bds.jpg "
												width="300" height="300" alt="백두산">
										</figure>
										<h3>
											<span class="icon a19 ir_pm">15세</span> <strong>백두산</strong>
										</h3>
										<div class="infor_btn">
											<a href="#">상세보기</a>
										</div>
									</div>
									<div class="poster2">
										<figure>
											<img src="../assets/img/toy.jpg "
												width="300" height="300" alt="토이스토리">
										</figure>
										<h3>
											<span class="icon a19 ir_pm">전체관람가</span> <strong>토리스토리</strong>
										</h3>
										<div class="infor_btn">
											<a href="#">상세보기</a>
										</div>
									</div>
<div class="foot">
<jsp:include page="../inc/bottom.jsp" />
</div>
	<!-- 자바스크립트 라이브러리 -->
	<script src="assets/js/jquery.min_1.12.4.js"></script>
	<script src="assets/js/modernizr-custom.js"></script>
	<script src="assets/js/ie-checker.js"></script>
	<script src="assets/js/swiper.min.js"></script>
	<script>
		//배너 이미지 슬라이드
		var mySwiper = new Swiper('.swiper-container', {
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			pagination : {
				el : '.swiper-pagination',
				type : 'bullets',
			},
			autoplay : {
				delay : 5000,
			},
		});

		//영화차트 이미지 슬라이드
		var mySwiper = new Swiper('.swiper-container2', {
			slidesPerView : 4,
			spaceBetween : 24,
			//            mousewheel: {
			//                invert: true,
			//            },
			keyboard : {
				enabled : true,
				onlyInViewport : false,
			},
			//            autoplay: {
			//                delay: 6000,
			//            },
			breakpoints : {
				600 : {
					slidesPerView : 1.4,
					spaceBetween : 24
				},
				768 : {
					slidesPerView : 2,
					spaceBetween : 24
				},
				960 : {
					slidesPerView : 3,
					spaceBetween : 24
				}
			}
		});

		//영화차트 탭 메뉴
		var movBtn = $(".movie_title > ul > li");
		var movCont = $(".movie_chart > div");

		movCont.hide().eq(0).show();

		movBtn.click(function(e) {
			e.preventDefault();
			var target = $(this);
			var index = target.index();
			movBtn.removeClass("active");
			target.addClass("active");
			movCont.css("display", "none");
			movCont.eq(index).css("display", "block");
		});
	</script>
	
</body>
</html>