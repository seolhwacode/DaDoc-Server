<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd/question.do</title>
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
	
	/* form 내부 중앙정렬 */
	 .content-container .form-wrapper {
		display: flex;
	    justify-content: center;
	    font-size: 1rem;
	}
	
	/* 중앙 정렬 */
	.content-container .content-main{
		display: flex;
	    flex-direction: column;
	    align-items: flex-start;
	    margin: 100px 0;
	    width: 400px;
	}
	
	/* 제출 버튼 */
	.content-main .btn-submit{
		width: -webkit-fill-available;
	    background-color: #C24914;
	    color: #F9E0AE;
	    font-weight: bold;
	    font-size: 1.0rem;
	    margin-top: 20px;
	}
	
	.content-main .btn-submit:hover{
		background-color: #8c3712;
	}
	
	/* id 출력 강조 */
	.content-main > p > span{
		color: #C24914;
		font-size: 1.1rem;
		font-weight: bold;
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
	
	<!-- main content -->
	<div class="container root-container">
		<div class="content-container">
			<div class="content-head">
				<h1>비밀번호 찾기</h1>
				<div>
					<span>01. 아이디 입력</span> > <span class="now">02. 본인 확인</span> > <span>03. 비밀번호 재설정</span>
				</div>
			</div>
			<div class="form-wrapper">
				<form action="${pageContext.request.contextPath}/users/pwd/result.do" method="post">
					<div class="content-main">
						<p>id : <span>${ requestScope.id }</span></p>
						<!-- 입력한 id 또한 같이 넘어감 -->
						<input type="hidden" name="id" value="${ requestScope.id }" />
						<p>질문 : ${ requestScope.question }</p>
						<input type="text" name="answer" class="form-control form-control-lg" placeholder="질문에 대한 답을 입력해주세요." />
						<button type="submit" class="btn btn-submit">제출</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
	<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
</body>
</html>