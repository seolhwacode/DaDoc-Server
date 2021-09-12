<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/leave.do</title>
<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${ isSuccess }">
			<script>
				//alert("성공적으로 탈퇴했습니다.");
				swal({
					title: "탈퇴에 성공했습니다.",
					text: "이용해주셔서 감사합니다.",
					icon: "success",
				  	buttons: {
				    	goHome: {
				    		text: "홈으로 가기",
				    		value: true
				    	}
				  	}
				})
				.then(function(value){
				  	location.href = "${pageContext.request.contextPath}/";
				});
			</script>
		</c:when>
		<c:otherwise>
			<script>
				//alert("탈퇴하지 못했습니다.");
				swal({
					title: "탈퇴에 실패했습니다.",
					icon: "warning",
				  	buttons: {
				    	goHome: {
				    		text: "홈으로 가기",
				    		value: "home"
				    	},
				    	goUserPage: {
				    		text: "개인정보 페이지로 가기",
				    		value: "users"
				    	}
				  	}
				})
				.then((value) => {
					switch (value) {
					case "home":
						location.href = "${pageContext.request.contextPath}";
						break;
					case "users":
						location.href = "${pageContext.request.contextPath}/users/private/info.do";
						break;
					default:
						location.href = "${pageContext.request.contextPath}";
					}
				  	
				});
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>