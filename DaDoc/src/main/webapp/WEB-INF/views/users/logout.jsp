<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/logut.do</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
		//alert("로그아웃 되었습니다.");
		//home.do 로 이동하기
		swal({
		  	title: "로그아웃 되었습니다.",
		  	text: "좋은 하루 되세요~",
		  	icon: "success",
		  	button: "확인",
		})
		.then(function(){
			location.href = "${pageContext.request.contextPath}/";
		});
	</script>
</body>
</html>