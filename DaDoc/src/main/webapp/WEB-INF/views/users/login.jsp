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
	<script>
		//url 있고 session 에 id 존재하면 -> 로그인 ok
		if( ${ !empty url and !empty id} ){
			let go = confirm("로그인 성공! 이전 페이지로 돌아가시겠습니까?");
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
