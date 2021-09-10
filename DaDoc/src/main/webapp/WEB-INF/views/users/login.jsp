<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.do</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
</head>
<body>
<%-- 	<div class="container">
		<h1>로그인 결과 페이지</h1>
		<c:choose>
			<c:when test="${not empty sessionScope.id }">
				<div class="alert alert-success align-items-center text-center">
					<strong>${sessionScope.id }</strong> 님이 로그인 되었습니다.
					<br />
					<a class="alert-link me-2" href="${requestScope.url }">이전 페이지로 돌아가기</a>
					<a class="alert-link" href="${pageContext.request.contextPath}/home.do">홈으로 가기</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="alert alert-danger align-items-center text-center"> 
					아이디 혹은 비밀번호가 틀렸습니다.
					<br />
					<a class="alert-link me-2" href="${pageContext.request.contextPath}/users/login_form.do?url=${requestScope.encodeUrl}">다시 시도</a>
					<a class="alert-link" href="${pageContext.request.contextPath}/">홈으로 가기</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div> --%>
	<script>
		//url 있고 session 에 id 존재하면 -> 로그인 ok
		if( ${ !empty url and !empty id} ){
			let go = confirm("어느 페이지로 이동하시겠습니까?");
			if(go){
				//이전 페이지로 이동
				location.href = "${requestScope.url }";
			}else{
				//홈으로 이동
				location.href = "${pageContext.request.contextPath}/home.do";
			}
		}else{
			//뭔가 잘못된 접근
			alert('잘못된 접근입니다.');
			location.href = "${pageContext.request.contextPath}/";
		}
		
	</script>
</body>
</html>
