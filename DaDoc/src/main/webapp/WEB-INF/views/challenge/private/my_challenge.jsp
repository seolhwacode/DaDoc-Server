<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">	

	<title>MY CHALLENGE</title>	

	<meta name="keywords" content="HTML5 Template" />
	<meta name="description" content="Porto - Responsive HTML5 Template">
	<meta name="author" content="okler.net">

	<!-- Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon" href="img/apple-touch-icon.png">

	<!-- Mobile Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">

	<!-- Web Fonts  -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800%7CShadows+Into+Light%7COswald" rel="stylesheet" type="text/css">

	
	<!-- Vendor CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/owl.carousel/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/owl.carousel/assets/owl.theme.default.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.min.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/theme.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/theme-elements.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/theme-blog.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/theme-shop.css">

	<!-- Current Page CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/rs-plugin/css/settings.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/rs-plugin/css/layers.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/rs-plugin/css/navigation.css">
	
	<!-- Demo CSS -->


	<!-- Skin CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/skins/default.css"> 

	<!-- Theme Custom CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/custom.css">

	<!-- Head Libs -->
	<script src="${pageContext.request.contextPath}/resources/vendor/modernizr/modernizr.min.js"></script>
	
	<style>
		/*페이지 헤더 색상 조정*/
		.page-header {
			background-color: #F9E0AE !important;
		}
		
	</style>
</head>
<body>

	<div role="main" class="main">
		<!-- 페이지 헤더 -->
		<section class="page-header page-header-modern page-header-md">
			<div class="container">
				<div class="row">
					<div class="col-md-12 align-self-center p-static order-2 text-center">
						<h1 class="text-dark font-weight-bold text-8 bold-family">My Challenge</h1>
						<span class="sub-title text-dark">${sessionScope.id }님의 챌린지</span>
					</div>
	
					<div class="col-md-12 align-self-center order-1">
	
						<ul class="breadcrumb d-block text-center">
							<li><a href="${pageContext.request.contextPath}/users/info.do">Challenge</a></li>
							<li class="active">My Challenge</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<!-- section -->
	<section class="section section-default">
		<div class="container">
			<div class="row">
				<div class="col">
					<h4 class="mb-0">나의 챌린지</h4>
					<p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eros ipsum, facilisis eget scelerisque non, fermentum at tellus.</p>
				</div>
			</div>
		</div>
	</section>
	<!-- 갤러리 -->
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="appear-animation" data-appear-animation="fadeIn" data-appear-animation-delay="500">
					<ul class="nav nav-pills sort-source sort-source-style-3" data-sort-id="portfolio" data-option-key="filter" data-plugin-options="{'layoutMode': 'masonry', 'filter': '*'}">
						<li class="nav-item active" data-option-value="*"><a class="nav-link text-1 text-uppercase active" href="#">모두 보기</a></li>
						<!-- data-option-value를 설정해줘야한다. -->
						<li class="nav-item" data-option-value=".made"><a class="nav-link text-1 text-uppercase" href="#">내가 만든 챌린지</a></li>
						<li class="nav-item" data-option-value=".register"><a class="nav-link text-1 text-uppercase" href="#">내가 참여한 챌린지</a></li>
					</ul>
	
					<div class="sort-destination-loader sort-destination-loader-showing mt-4 pt-2">
						<div class="row portfolio-list sort-destination" data-sort-id="portfolio">
							<!-- 내가 만든 챌린지 -->
							<c:forEach var="list" items="${myList }">
								<div class="col-sm-6 col-lg-3 isotope-item made">
									<div class="portfolio-item">
										<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
											<span class="thumb-info-wrapper border-radius-0">
												<img src="${pageContext.request.contextPath}${list.image}" class="img-fluid border-radius-0" alt="">
												<span class="thumb-info-title">
													<span class="thumb-info-inner">${list.title }</span>
													<button data-class="${list.endDate }" type="button" class="btn btn-outline btn-rounded btn-warning mb-2 detailBtn" onclick="location.href='${pageContext.request.contextPath}/challenge/private/detail.do?num=${list.num}&title=${list.title}'">Go!</button>
												</span>
											</span>
										</span>
									</div>
								</div>
							</c:forEach>
							<!-- 내가 참여한 챌린지 -->
							<c:forEach var="challenge" items="${myChallenge }">
								<div class="col-sm-6 col-lg-3 isotope-item register">
									<div class="portfolio-item">
										<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
											<span class="thumb-info-wrapper border-radius-0">
												<img src="${pageContext.request.contextPath}${challenge.image}" class="img-fluid border-radius-0" alt="">
												<span class="thumb-info-title">
													<span class="thumb-info-inner">${challenge.challengeTitle }</span>
													<button data-class="${challenge.endDate }" type="button" class="btn btn-outline btn-rounded btn-warning mb-2 detailBtn" onclick="location.href='${pageContext.request.contextPath}/challenge/private/detail.do?num=${challenge.num}&title=${challenge.challengeTitle}'">Go!</button>
												</span>
											</span>
										</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- section -->
	<section class="section section-default">
		<div class="container">
			<div class="row">
				<div class="col">
					<h4 class="mb-0">나의 인증샷</h4>
					<p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eros ipsum, facilisis eget scelerisque non, fermentum at tellus.</p>
				</div>
			</div>
		</div>
	</section>
	<!-- 갤러리 -->
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="appear-animation" data-appear-animation="fadeIn" data-appear-animation-delay="500">
					<ul class="nav nav-pills sort-source sort-source-style-3" data-sort-id="portfolio" data-option-key="filter" data-plugin-options="{'layoutMode': 'masonry', 'filter': '*'}">
						<li class="nav-item active" data-option-value="*"><a class="nav-link text-1 text-uppercase active" href="#">모두보기</a></li>
						<c:forEach var="photo" items="${photoList }">
							<li class="nav-item" data-option-value=".${photo.challengeTitle }"><a class="nav-link text-1 text-uppercase" href="#">${photo.challengeTitle}</a></li>
						</c:forEach>
					</ul>
					
					<div class="sort-destination-loader sort-destination-loader-showing mt-4 pt-2">
						<div class="row portfolio-list sort-destination" data-sort-id="portfolio">
							<!-- 카드 넣을 곳 -->
							<c:forEach var="photo" items="${photoList }">
								<div class="col-sm-6 col-lg-3 isotope-item ${photo.challengeTitle }">
									<div class="portfolio-item">
											<span class="thumb-info thumb-info-centered-info thumb-info-no-borders border-radius-0">
												<span class="thumb-info-wrapper border-radius-0">
													<img src="${pageContext.request.contextPath}${photo.imagePath}" class="img-fluid border-radius-0" alt="">
													<span class="thumb-info-title">
														<span class="thumb-info-inner">${photo.challengeTitle }</span>
														<span class="thumb-info-inner">${photo.regdate }</span>
													</span>
												</span>
											</span>
									</div>
								</div>
							</c:forEach>			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	//모든 상세보기 버튼을 기간 체크를 해본다.
	challengeExpired(".detailBtn");
	
	//기간이 지난 챌린지 비활성화 시키는 함수
	function challengeExpired(sel){
		//상세보기 버튼의 참조값을 모두 배열에 담는다.
		let detailBtns = document.querySelectorAll(sel);
		for(let i=0; i< detailBtns.length; i++){
				//챌린지에 배정된 시작날짜를 불러온다.
				const endDateValue = detailBtns[i].getAttribute("data-class");
				//시작날짜 문자열 -> 숫자형으로 변환
				const endDate = getEndDate(endDateValue);
				//현재날짜를 숫자형으로 구한다.
				const nowDate = getNowDate(new Date());
				//만약 시작날짜보다 현재날짜가 더 크다면 
				if(endDate<nowDate){
					//해당 버튼을 비활성화 시킨다.
					detailBtns[i].removeAttribute('href');
					//해당 버튼을 dsiabled-class를 넣고 CSS를 적용한다.
					detailBtns[i].classList.add("btn-quaternary");
					detailBtns[i].classList.remove("btn-warning");
					detailBtns[i].innerText="지난 챌린지"
				}
		}
	}
	
	//현재 날짜를 구하고 숫자로 변형하는 함수
	function getNowDate(date){
		let nowYear = String(date.getFullYear());
		let nowMonth = date.getMonth()+1;
		    nowMonth = nowMonth >= 10? nowMonth : '0' + nowMonth;
		let nowDay = date.getDate();
		    nowDay = nowDay >=10 ? nowDay : '0' + nowDay
	
		let nowTime = nowYear.concat(nowMonth,nowDay);
	
		  return Number(nowTime);
		  
		}
	
	//신청 날짜를 구하고 숫자로 변형하는 함수
	function getEndDate(date){
	return Number(date.replace(/-/gi,'')); 
	}
</script>

	<!-- Vendor -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.appear/jquery.appear.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.cookie/jquery.cookie.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/popper/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/common/common.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.validation/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.gmap/jquery.gmap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.lazyload/jquery.lazyload.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/isotope/jquery.isotope.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/vide/jquery.vide.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/vivus/vivus.min.js"></script>
	
	<!-- Theme Base, Components and Settings -->
	<script src="${pageContext.request.contextPath}/resources/js/theme.js"></script>
	
	<!-- Current Page Vendor and Views -->
	<script src="${pageContext.request.contextPath}/resources/vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	
	<!-- Theme Custom -->
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	
	<!-- Theme Initialization Files -->
	<script src="${pageContext.request.contextPath}/resources/js/theme.init.js"></script>
</body>
</html>