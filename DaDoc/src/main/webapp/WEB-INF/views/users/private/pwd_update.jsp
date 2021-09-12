<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.do</title>
<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>	
	<script>
		if(${ isSuccess }){
			//alert("성공적으로 탈퇴했습니다.");
			swal({
				title: "성공적으로 비밀번호를 변경하였습니다.",
				text: "자동으로 로그아웃 되었습니다.",
				icon: "success",
			  	buttons: {
			    	login: {
			    		text: "로그인하러 가기",
			    		value: "login"
			    	},
			    	home: {
			    		text: "홈으로 가기",
			    		value: "home"
			    	}
			  	}
			})
			.then(function(value){
				switch (value) {
				case "home":
					//홈으로
					location.href = "${pageContext.request.contextPath}";
					break;
				case "login":
					//로그인
					location.href = "${pageContext.request.contextPath}/users/login_form.do";
					break;
				default:
					//home 으로 (기본)
					location.href = "${pageContext.request.contextPath}";
				}
			});
		}else{
			//실패
			swal({
				title: "비밀번호 변경에 실패했습니다.",
				icon: "error",
			  	buttons: {
			    	user: {
			    		text: "개인정보 페이지로",
			    		value: "user"
			    	},
			    	home: {
			    		text: "홈으로 가기",
			    		value: "home"
			    	}
			  	}
			})
			.then(function(value){
				switch (value) {
				case "home":
					//홈으로
					location.href = "${pageContext.request.contextPath}";
					break;
				case "user":
					//사용자 기본 페이지로 가기
					location.href = "${pageContext.request.contextPath}/users/private/info.do";
					break;
				default:
					//home 으로 (기본)
					location.href = "${pageContext.request.contextPath}";
				}
			});
		}
	</script>
</body>
</html>