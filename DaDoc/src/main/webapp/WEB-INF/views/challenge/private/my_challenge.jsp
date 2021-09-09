<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">	

	<title>mychallenge</title>	

	<meta name="keywords" content="HTML5 Template" />
	<meta name="description" content="Porto - Responsive HTML5 Template">
	<meta name="author" content="okler.net">

	<!-- Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
	

	<!-- Mobile Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">

	<!-- Web Fonts  -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800%7CShadows+Into+Light" rel="stylesheet" type="text/css">

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
	
	<!-- Demo CSS -->


	<!-- Skin CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/skins/default.css"> 

	<!-- Theme Custom CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/custom.css">

	<!-- Head Libs -->
	<script src="${pageContext.request.contextPath}/resources/vendor/modernizr/modernizr.min.js"></script>
	
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
	
	<!-- Theme Custom -->
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	
	<!-- Theme Initialization Files -->
	<script src="${pageContext.request.contextPath}/resources/js/theme.init.js"></script>
	
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
						<h1 class="text-dark font-weight-bold text-8 bold-family">나의 챌린지</h1>
						<span class="sub-title text-dark">${sessionScope.id }님 환영합니다!</span>
					</div>
	
					<div class="col-md-12 align-self-center order-1">
	
						<ul class="breadcrumb d-block text-center">
							<li><a href="${pageContext.request.contextPath}/users/private/info.do">info</a></li>
							<li class="active">My Challenge</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- 구분선 -->
	<div class="container">
		<div class="row">
			<div class="col">
				<hr class="solid my-5">

				<h4>${sessionScope.id }님이 만든 챌린지</h4>
			</div>
		</div>
	</div>
	
<c:forEach var="list" items="${myList }">
	<section class="call-to-action with-borders mb-5 appear-animation" data-appear-animation="fadeIn">
		<div class="col-sm-9 col-lg-9">
			<div class="call-to-action-content">
				<h3><strong class="font-weight-extra-bold">${list.title }</strong></h3>
				<p class="mb-0"><i class="icon-calendar icons" >${list.startDate } ~ ${list.endDate}</i></p>
			</div>
		</div>
		<div class="col-sm-3 col-lg-3">
			<div class="call-to-action-btn">
				<a data-class="${list.startDate }" href="${pageContext.request.contextPath}/challenge/private/detail.do?num=${list.num}&title=${list.title}" target="_blank" class="btn btn-rounded btn-warning box-shadow-2 mb-2 detailBtn">자세히 보기</a>
			</div>
		</div>
	</section>
</c:forEach>
	<!-- 구분선 -->
	<div class="container">
		<div class="row">
			<div class="col">
				<hr class="solid my-5">

				<h4>${sessionScope.id }님이 참여한 챌린지</h4>
			</div>
		</div>
	</div>
<c:forEach var="challenge" items="${myChallenge }">
	<section class="call-to-action with-borders mb-5 appear-animation" data-appear-animation="fadeIn">
		<div class="col-sm-9 col-lg-9">
			<div class="call-to-action-content">
				<h3><strong class="font-weight-extra-bold">${challenge.challengeTitle}</strong></h3>
				<p class="mb-0"><i class="icon-calendar icons" >${challenge.startDate } ~ ${challenge.endDate}</i></p>
			</div>
		</div>
		<div class="col-sm-3 col-lg-3">
			<div class="call-to-action-btn">
				<a data-class="${challenge.startDate }" href="${pageContext.request.contextPath}/challenge/private/detail.do?num=${challenge.num}&title=${challenge.challengeTitle}" target="_blank" class="btn btn-rounded btn-warning box-shadow-2 mb-2 detailBtn">자세히 보기</a>
			</div>
		</div>
	</section>
</c:forEach>
<script>
	
	//모든 상세보기 버튼을 기간 체크를 해본다.
	challengeExpired(".detailBtn");
	
	//기간이 지난 챌린지 비활성화 시키는 함수
	function challengeExpired(sel){
		//상세보기 버튼의 참조값을 모두 배열에 담는다.
		let detailBtns = document.querySelectorAll(sel);
		for(let i=0; i< detailBtns.length; i++){
				//챌린지에 배정된 시작날짜를 불러온다.
				const startDateValue = detailBtns[i].getAttribute("data-class");
				//시작날짜 문자열 -> 숫자형으로 변환
				const startDate = getStartDate(startDateValue);
				//현재날짜를 숫자형으로 구한다.
				const nowDate = getNowDate(new Date());
				//만약 시작날짜보다 현재날짜가 더 크다면 
				if(startDate<nowDate){
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
	function getStartDate(date){
	return Number(date.replace(/-/gi,'')); 
	}

</script>
</body>
</html>