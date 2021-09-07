<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/leave.do</title>
</head>
<body>
	<div id="leaveContainer" class="container">
		<div v-if="isSuccess">
			<p>성공적으로 탈퇴했습니다.</p>
			<p>감사합니다.</p>
			<div>
				<a v-bind:href="base_url">홈으로 가기</a>
			</div>
		</div>
		<div v-else>
			<p>탈퇴에 실패했습니다.</p>
			<div>
				<a v-bind:href="users_info_url">개인정보 페이지로 돌아가기</a>
				<a v-bind:href="base_url">홈으로 가기</a>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		// webcontent 위치
		const base_url = "http://localhost:8888/dadoc";
		let pwdUpdateContainer = new Vue({
			el: '#leaveContainer',
			data: {
				base_url,
				login_url: base_url + '/users/login_form.do',
				users_info_url: base_url + '/users/private/info.do',
				isSuccess: ${ isSuccess },
				
			}
		});
	</script>
</body>
</html>