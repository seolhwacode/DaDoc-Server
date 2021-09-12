<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd/result.do</title>
<!-- 외부 css 및 파일들 추가  -->
<jsp:include page="/include/resources_head.jsp"></jsp:include>
<style>
	/*페이지 헤더 색상 조정*/
	.page-header {
		background-color: #F9E0AE;
	}
	
	/* crumb 네비바 뒤로가기 */
	.page-header .breadcrumb{
		z-index: 0;
	}
	
	/* 전체 메인 컨텐츠 & 아래 여백 추가 */
	.root-container{
		margin-bottom: 10%;
		margin-top: 10%;
	}
	
	/* 중앙정렬  */
	.content-container{
		max-width: 100%;
		margin: 0 auto;
	}
	
	/* h1, 순서 - 아래 밑줄 / flex 로 배치 */
	.content-container .content-head {
		border-bottom: solid;
	  	border-color: #682c0e;
	  	display: flex;
	    justify-content: space-between;
	    align-items: flex-end;
	    margin-bottom: 30px;
	}
	
	/* h1 - 아래 패딩 제거 */
	.content-container .content-head h1{
	    margin-bottom: 0;
	}
	
	/* 현재 진행 상황 */
	.content-container .content-head .now{
		color: #FC8621;
		font-weight: bold;
	}
	
	/* result-wrapper 를 중앙정렬  */
	.content-main{
		display: flex;
	    justify-content: center;
	    margin: 100px 0;
	}
	
	/* 결과창 메인 내용 - 사이즈 고정 */
	.result-wrapper{
		width: 400px;
		font-size: 1rem;
	    color: black;
	}
	
	/* 글귀 진하게 하기 */
	.result-wrapper > p{
		font-size: 1rem;
	    color: black;
	}
	
	/* 로그인, 다시 찾기 버튼 */
	.btn-main{
		width: -webkit-fill-available;
	    background-color: #C24914;
	    color: #f9e0ae;
	    font-weight: bold;
	    font-size: 1.0rem;
	    margin-top: 20px;
	}
	
	.btn-main:hover {
		background-color: #8c3712;
		color: #f9e0ae;
	}
	
	/* 홈으로 가기 버튼 */
	.btn-home{
		width: -webkit-fill-available;
		background-color: #c1c1c1;
	    color: black;
	    font-weight: bold;
	    font-size: 1.0rem;
	    margin-top: 10px;
	}
	
	.btn-home:hover {
		background-color: #949494;
		color: black;
	}
	
	.new-pwd{
		font-size: 2rem;
		font-weight: bolder;
	}
}
}
</style>
</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp"></jsp:include>
	
	<!-- 페이지 헤더 -->
	<section class="page-header page-header-modern page-header-md">
		<div class="container">
			<div class="row">
				<div class="col-md-12 align-self-center p-static order-2 text-center">
					<h1 class="text-dark font-weight-bold text-8 bold-family">Forgot password</h1>
					<span class="sub-title text-dark">You with DADOC</span>
				</div>
				<div class="col-md-12 align-self-center order-1">
					<ul class="breadcrumb d-block text-center">
						<li><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li class="active">Forgot password</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<!-- main-content -->
	<div class="container root-container">
		<div class="content-container">
			<div class="content-head">
				<h1>비밀번호 찾기</h1>
				<div>
					<span>01. 아이디 입력</span> > <span>02. 본인 확인</span> > <span class="now">03. 비밀번호 재설정</span>
				</div>
			</div>
			<div class="content-main">
				<c:choose>
					<c:when test="${ requestScope.isCorrect }">
						<div class="result-wrapper">
							<p>새로운 비밀번호는 아래와 같습니다. <br/> 로그인 후, 비밀번호를 변경해주세요.</p>
							<br />
							<div class="new-pwd">${ requestScope.newPwd }</div>
							<a href="${pageContext.request.contextPath}/users/login_form.do" class="btn btn-main">로그인하러 가기</a>
							<a href="${pageContext.request.contextPath}/" class="btn btn-home">홈으로 가기</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="result-wrapper">
							<p>정답이 일치하지 않습니다.</p>
							<a href="${pageContext.request.contextPath}/users/pwd/input_id.do" class="btn btn-main">비밀번호 찾기로 돌아가기</a>
							<a href="${pageContext.request.contextPath}/" class="btn btn-home">홈으로 가기</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
	<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
</body>
</html>