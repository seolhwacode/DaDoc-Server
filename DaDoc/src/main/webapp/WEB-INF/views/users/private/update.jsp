<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.do</title>
<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
		//alert("회원 정보를 수정했습니다.");
		swal({
			title: "회원 정보를 수정했습니다.",
			icon: "success",
		  	buttons: {
		    	ok: {
		    		text: "확인"
		    	}
		  	}
		})
		.then(function(){
			location.href = "${pageContext.request.contextPath}/users/private/info.do";
		});
	</script>
</body>
</html>