<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Mobile Metas -->

<jsp:include page="/include/resources_head.jsp"></jsp:include>

<!-- navbar css 추가 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/include/navbarcss.css">

<title>/challenge/register_form.jsp</title>

<style>
	/*사진 추가 이미지 크기 수정*/
	#noImage{
		width: 150px;
		height: 150px;
	}
	
	/*삽입한 이미지 크기 수정*/
	#previewImage{
		width: 150px;
		height: 150px;
	}
	
	/*페이지 헤더 색상 조정*/
	.page-header {
		background-color: #F9E0AE !important;
	}
	
	/*image선택하는 input 숨기기*/
	#imageForm{
		display: none;
	}
	
	/*챌린지 정보 form 색상 변경*/
	.info-section{
		background: #F7F6F2; !important
	}
</style>
</head>
<body>
<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="challenge" name="thisPage"/>
	</jsp:include>
	
		<!-- 페이지 헤더 -->
		<section class="page-header page-header-modern page-header-md">
			<div class="container">
				<div class="row">

					<div
						class="col-md-12 align-self-center p-static order-2 text-center">

						<h1 class="text-dark font-weight-bold text-8 bold-family">REGISTER</h1>
						<span class="sub-title text-dark">You can do with DADOC</span>
					</div>

					<div class="col-md-12 align-self-center order-1">

						<ul class="breadcrumb d-block text-center">
							<li><a href="${pageContext.request.contextPath}/challenge/main.do">MAIN</a></li>
							<li class="active">Register</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

				<div class="container">

					<form name="myForm" action="${pageContext.request.contextPath}/challenge/private/register.do" method="post" enctype="multipart/form-data" id="myForm" >
						<div class="row mt-5 mb-5">
							<div class="col-lg-4">

								<section class="info-section section-no-border p-5 mt-1 mb-4" data-plugin-sticky data-plugin-options="{'minWidth': 991, 'containerSelector': '.container', 'padding': {'top': 150}}">
									<div class="form-row">
										<div class="form-group col">
											<h4 class="mt-4 mb-4 pb-0 text-uppercase">챌린지 정보</h4>
										</div>
									</div>
									<!-- 시작일 종료일 -->
									<label for="startDate" class="form-control-label">시작일</label>
									<div class="form-row">
										<div class="form-group col">
											<div class="form-control-custom form-control-datepicker-custom">
												<input type="date" value="" class="form-control text-uppercase text-2" data-msg-required="This field is required." placeholder="시작일" name="startDate" id="startDate" required>
											</div>
										</div>
									</div>
									<label for="endDate" class="form-control-label">종료일</label>
									<div class="form-row">
										<div class="form-group col">
											<div class="form-control-custom form-control-datepicker-custom">
												<input type="date" value="" class="form-control text-uppercase text-2" data-msg-required="This field is required." placeholder="종료일" name="endDate" id="endDate" required>
											</div>
										</div>
									</div>
									<!-- 카테고리 -->
									<label for="type" class="form-control-label">챌린지 유형</label>
									<div class="form-row">
										<div class="form-group col">
											<div class="form-control-custom">
												<select class="form-control text-uppercase text-2" name="type" id="type" data-msg-required="This field is required." required>
													<option value="">선택</option>
													<option value="premium">프리미엄</option>
													<option value="normal">일반</option>
												</select>
											</div>
										</div>
									</div>
									<!-- 인증 횟수 -->
									<label for="period" class="form-control-label">인증 횟수</label>
									<div class="form-row">
										<div class="form-group col">
											<div class="form-control-custom">
												<select class="form-control text-uppercase text-2" name="period" id="period" data-msg-required="This field is required." required>
													<option value="">선택</option>
													<option value=1>1</option>
													<option value=2>2</option>
													<option value=3>3</option>
													<option value=4>4</option>
													<option value=5>5</option>
													<option value=6>6</option>
													<option value=7>7</option>
													<option value=8>8</option>
													<option value=9>9</option>
													<option value=10>10</option>
												</select>
											</div>
										</div>
									</div>
								</section>

							</div>
							<div class="col-lg-8">

								<section class="section section-quaternary section-no-border text-light p-5 mt-1 mb-4">
									<div class="row">
										<div class="col">
											<h4 class="mt-4 mb-4 pb-0 text-uppercase">카테고리를 선택하세요</h4>
										</div>
									</div>
									<div class="row">
										<div class="col-1 text-center">
											<label class="mt-4 mb-4">
												<input type="radio" checked="checked" name="category" id="category" value="reading">
											</label>
										</div>
										<div class="col-2 d-none d-sm-block">
											<img src="${pageContext.request.contextPath}/resources/images/reading.png" class="img-fluid" alt="">
										</div>
										<div class="col-11 col-sm-9">
											<h5 class="mt-0 mb-0">독서</h5>
											<div class="room-suite-info">
												<ul>
													<li><label>Example | </label>	<span>영어 원서 1일 1페이지 읽기</span></li>
													<li><label>Example | </label>	<span>해리포터 시리즈 끝내기</span></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-1 text-center">
											<label class="mt-4 mb-4">
												<input type="radio" name="category" id="category" value="writing">
											</label>
										</div>
										<div class="col-2 d-none d-sm-block">
											<img src="${pageContext.request.contextPath}/resources/images/writing.png" class="img-fluid" alt="">
										</div>
										<div class="col-11 col-sm-9">
											<h5 class="mt-0 mb-0">필사</h5>
											<div class="room-suite-info">
												<ul>
													<li><label>Example | </label>	<span>윤동주 시집 필사 챌린지</span></li>
													<li><label>Example | </label>	<span>하루에 하나씩 써가는 작은 아씨들</span></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-1 text-center">
											<label class="mt-4 mb-4">
												<input type="radio" name="category" id="category" value="listening">
											</label>
										</div>
										<div class="col-2 d-none d-sm-block">
											<img src="${pageContext.request.contextPath}/resources/images/listening.png" class="img-fluid" alt="">
										</div>
										<div class="col-11 col-sm-9">
											<h5 class="mt-0 mb-0">낭독</h5>
											<div class="room-suite-info">
												<ul>
													<li><label>Example | </label>	<span>나도 오디오북 만들기</span></li>
													<li><label>Example | </label>	<span>릴레이 달러구트 꿈백화점 낭독</span></li>
												</ul>
											</div>
										</div>
									</div>
								</section>

								<section class="section section-quaternary section-no-border text-light p-5 mt-1 mb-4">
									<div class="row">
										<div class="col">
											<h4 class="mt-4 mb-4 pb-0 text-uppercase">챌린지 상세 정보</h4>
										</div>
									</div>
									
									<!-- id와 image 보내기 폼 -->
									<input id="writer" name="writer" type="hidden" value="${sessionScope.id }" />
									<input type="hidden" name="image" id="image" value="" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>	
									
									<div class="form-row">
										<div class="form-group col">
											<label for="title" class="form-control-label">챌린지 제목</label>
											<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요...">
										</div>	
									</div>

									<div class="form-row">
										<div class="form-group col">
											<label for="description" class="form-control-label">챌린지 설명</label>
											<input type="text" class="form-control" id="description" name="description" placeholder="설명을 입력하세요...">
										</div>				
									</div>	
									
									<div class="form-row">
										<div class="form-group col">
											<label for="description" class="form-control-label">챌린지 대표 이미지</label>
											<div class="imagePreview">
												<a id="imageLink" href="javascript:">
													<c:choose>
														<c:when test="${empty dto.image }">
															<img id="noImage" src="${pageContext.request.contextPath}/resources/images/noImage.png">
														</c:when>
														<c:otherwise>
															<img id="previewImage" src="${pageContext.request.contextPath}${dto.image}" />
														</c:otherwise>
													</c:choose>
												</a>
											</div>
										</div>				
									</div>	
								</section>

								<div class="row">
									<div class="col">
										<input type="submit" value="등록" class="btn btn-primary btn-lg btn-block text-uppercase p-4 mb-4">
									</div>
								</div>

							</div>
						</div>
					</form>
						<form name="imgForm" action="${pageContext.request.contextPath}/challenge/private/ajax_image_upload.do" method="post" id="imageForm" enctype="multipart/form-data">
							<input type="file" name="preImage" id="preImage" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
						</form>
				</div>
				
<!-- footer -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<!-- 외부에서 가져오는 js 파일 -->
<jsp:include page="/include/resources_js.jsp"></jsp:include>
<!-- 네비게이션 바 js -->
<script src="${pageContext.request.contextPath}/include/navbarjs.js"></script>

<script>
	
	//프로필 이미지 링크를 클릭하면
	document.querySelector("#imageLink").addEventListener("click",function(){
		//input type = "file"을 강제로 클릭
		document.querySelector("#preImage").click();
	});
	//이미지를 선택했을 때 실행할 함수 등록
	document.querySelector("#preImage").addEventListener("change",function(){
		let form=document.querySelector("#imageForm");
		//ajax로 폼 전송
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			let img=`<img id="previewImage" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			document.querySelector("#imageLink").innerHTML=img;
			//input name="image"요소의 value값으로 이미지 경로 넣어주기
			document.querySelector("input[name=image]").value=data.imagePath;
		});
	});
	
</script>
</body>
</html>