<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.do</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
		//url 있고 session 에 id 존재하면 -> 로그인 ok
		if( ${ !empty url and !empty id} ){
			/* let go = confirm("로그인 성공! 이전 페이지로 돌아가시겠습니까?");
			if(go){
				//이전 페이지로 이동
				location.href = "${requestScope.url }";
			}else{
				//홈으로 이동
				location.href = "${pageContext.request.contextPath}/home.do";
			} */
			swal({
				title: "로그인 성공!",
				text: "이전 페이지로 돌아가시겠습니까?",
				icon: "success",
			  	buttons: {
			    	back: {
			    		text: "이전 페이지로",
			    		value: "back"
			    	},
			    	home: {
			    		text: "홈으로",
			    		value: "home"
			    	}
			  	}
			})
			.then(function(value){
				switch (value) {
				case "home":
					//-> 홈페이지로 이동
					location.href = "${pageContext.request.contextPath}";
					break;
				case "back":
					//이전 페이지로 가기
					location.href = "${requestScope.url }";
					break;
				default:
					//-> 홈페이지로 이동
					location.href = "${pageContext.request.contextPath}";
					break;
				}
			});			
		}else{
			//뭔가 잘못된 접근
			//alert('잘못된 접근입니다.');
			//location.href = "${pageContext.request.contextPath}/";
			swal({
				title: "잘못된 접근입니다.",
				icon: "warning",
			  	buttons: {
			    	ok: {
			    		text: "확인"
			    	}
			  	}
			})
			.then(function(){
				location.href = "${pageContext.request.contextPath}/";
			});
		}
		
	</script>
</body>
</html>
