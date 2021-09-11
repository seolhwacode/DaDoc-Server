<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    swal({
	  	title: "수정 완료!",
	  	text: "${id}님의 챌린지 정보가 수정되었습니다.",
	  	icon: "success",
	  	buttons: true,
	})
	.then(function(willUpdate){
	  	if (willUpdate) {
	    	location.href = "${pageContext.request.contextPath}/challenge/private/detail.do?num=${param.num}&title=${param.title}";
	  	}
	});
</script>
</body>
</html>