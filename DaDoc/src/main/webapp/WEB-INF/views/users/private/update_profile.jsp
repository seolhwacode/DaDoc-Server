<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update_profile.do</title>
<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
		//alert("프로필을 수정하였습니다.");
		swal({
		  	title: "프로필을 수정하였습니다.",
		  	icon: "success",
		})
		.then(function(){
			location.href = "${pageContext.request.contextPath}/users/private/info.do";
		});
	</script>
</body>
</html>