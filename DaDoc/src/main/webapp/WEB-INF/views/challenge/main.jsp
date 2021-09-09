<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Porto - Responsive HTML5 Template">
<meta name="author" content="okler.net">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">

<!-- Web Fonts  -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800%7CShadows+Into+Light"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/animate/animate.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/owl.carousel/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/owl.carousel/assets/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.min.css">

<!-- Theme CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css_porto/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css_porto/theme-elements.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css_porto/theme-blog.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css_porto/theme-shop.css">

<!-- Demo CSS -->


<!-- Skin CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css_porto/skins/default.css">

<!-- Theme Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css_porto/custom.css">

<!-- Head Libs -->
<script
	src="${pageContext.request.contextPath}/resources/vendor/modernizr/modernizr.min.js"></script>

<!-- Theme Base, Components and Settings -->
<script src="${pageContext.request.contextPath}/resources/js/theme.js"></script>

<!-- Theme Custom -->
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

<!-- Theme Initialization Files -->
<script src="${pageContext.request.contextPath}/resources/js/theme.init.js"></script>
<title>CHALLENGE</title>
<!-- CSS -->
<style>

/*페이지 모든 폰트 sans 적용*/
.bold-family {
	font-family: 'Noto Sans KR', sans-serif;
}

/*페이지 헤더 색상 조정*/
.page-header {
	background-color: #F9E0AE !important;
}

/*챌린지 개설 버튼 위치 조정*/
#challengeBtn {
	position: absolute;
	top: 200px;
	right: 20px;
}

/*챌린지 이미지 크기 통일*/
.img-thumbnail {
	width: 225px;
	height: 206px;
}

/*챌린지 검색 그룹*/
.search-group {
	display: flex;
	justify-content: center;
	margin: 0 0 30px;
}

/*챌린지 검색 input 크기 조절 */
.search-input {
	width: 200px;
}

/*페이징 처리*/
.pagination {
	margin-bottom: 50px;
}

/*챌린지 설명 부분 크기 고정*/
#challenge-description{
	width: 210px;
	height: 110px;
	margin-bottom: 20px;
}

/*챌린지명 색깔*/
.titleLink{
	color:#966C3B;
}

/*상세보기 버튼에 마우스를 올렸을 때*/
.detailBtn:hover{
	background-color: #966C3B;
	border : 1px solid white;
}

/*상세보기 CSS */
.detailBtn{
	background-color: #D0AF84;
	border : 1px solid white;
	width:100px;
	height:35px;
	margin: 8px 40px;
}

/*비활성화 된 버튼*/
.disabled-class:hover{
	border : 0.1px solid white;
	background-color: #C8C2BC; !important
	
}
</style>
</head>
<body>
	<div role="main" class="main">
		<!-- 페이지 헤더 -->
		<section class="page-header page-header-modern page-header-md">
			<div class="container">
				<div class="row">

					<div
						class="col-md-12 align-self-center p-static order-2 text-center">

						<h1 class="text-dark font-weight-bold text-8 bold-family">CHALLENGE</h1>
						<span class="sub-title text-dark">You can do with DADOC</span>
					</div>

					<div class="col-md-12 align-self-center order-1">

						<ul class="breadcrumb d-block text-center">
							<li><a href="${pageContext.request.contextPath}/">Home</a></li>
							<li class="active">Challenge</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
	<!-- 페이지 메인  -->
	<div class="container py-4">
	<!-- 로그인 할 때만 새로운 챌린지를 개설할 수 있다. -->
		<c:choose>
			<c:when test="${not empty sessionScope.id}">
				<button id="challengeBtn" type="button"
				onclick="location.href='${pageContext.request.contextPath}/challenge/private/register_form.do'"
				class="btn btn-rounded btn-tertiary mb-2">새로운 챌린지 개설하기</button>
			</c:when>
		</c:choose>
		<div class="row">
			<div class="col">
				<div class="blog-posts">
					<div class="row">
						<c:forEach var="tmp" items="${list }">
							<div class="col-md-4 col-lg-3">
								<article class="post post-medium border-0 pb-0 mb-5">
									<div class="post-image">
										<img
											class="img-fluid img-thumbnail img-thumbnail-no-borders rounded-0"
											src="${pageContext.request.contextPath }${tmp.image}" />
									</div>

									<div class="post-content">
										<h2
											class="font-weight-semibold text-5 line-height-6 mt-3 mb-2 bold-family">
											<p class="titleLink">${tmp.title }</p>
										</h2>
										<p id="challenge-description">${tmp.description}</p>
										<div class="post-meta">
											<span><i class="far fa-user"></i> By ${tmp.writer }</span> 
											<span><i class="far fa-folder"></i> ${tmp.type },${tmp.category }</span> 
											<span><i class="icon-calendar icons" > ${tmp.startDate } ~ ${tmp.endDate}</i></span>
											<button type="button" data-class="${tmp.endDate }" class="detailBtn btn btn-rounded btn-warning mb-2" onclick="location.href='${pageContext.request.contextPath}/challenge/private/detail.do?num=${tmp.num}&title=${tmp.title}'">자세히 보기</button>
										</div>
									</div>
								</article>
							</div>
						</c:forEach>
					</div>
					
				</div>
			</div>

		</div>
	</div>


	<!-- 챌린지 검색 -->
	<div style="clear: both;"></div>
	<div class="search-group">
		<form action="main.do" method="get">
			<label class="bold-family" for="category">카테고리 검색</label> <select
				name="category_name" id="category_name">
				<option value="" ${category_name eq ''? 'selected' : '' }>ALL</option>
				<option value="writing"
					${category_name eq 'writing' ? 'selected' : '' }>writing</option>
				<option value="reading"
					${category_name eq 'reading' ? 'selected' : '' }>reading</option>
				<option value="speaking"
					${category_name eq 'speaking' ? 'selected' : '' }>speaking</option>
			</select> <label class="bold-family" for="condition">검색조건</label> <select
				name="condition" id="condition">
				<option value="title_content"
					${condition eq 'title_description' ? 'selected' : '' }>제목+내용</option>
				<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
				<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
			</select>
			<div class="input-group">
				<input class="form-control text-1 search-input" id="keyword"
					name=keyword " type="search" value="${keyword }"
					placeholder="Search..." />
				<button class="btn" type="submit">
					<i class="fa fa-search header-nav-top-icon"></i>
				</button>
			</div>
		</form>
	</div>


	<!-- 페이징 처리 -->
	<nav>
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${startPageNum ne 1 }">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/challenge/main.do?pageNum=${startPageNum - 1}">Prev</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled"><a class="page-link"
						href="javascript:">Prev</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<c:choose>
					<c:when test="${i eq pageNum }">
						<li class="page-item active"><a class="page-link"
							href="${pageContext.request.contextPath}/challenge/main.do?pageNum=${i}">${i }</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/challenge/main.do?pageNum=${i}">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/challenge/main.do?pageNum=${endPageNum + 1}">Next</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled"><a class="page-link"
						href="javascript:">Next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
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
				detailBtns[i].disabled=true;
				//해당 버튼을 dsiabled-class를 넣고 CSS를 적용한다.
				detailBtns[i].classList.add("disabled-class");
				detailBtns[i].style.backgroundColor="#C8C2BC";
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
</body>
</html>




