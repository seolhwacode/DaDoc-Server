<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
</head>
<body>
	<div class="container">
		<h1>회원가입 페이지</h1>
		<p>* 이 포함된 사항은 필수 입력사항입니다. 반드시 입력해주세요.</p>
		<form action="${pageContext.request.contextPath}/users/signup.do" method="post" id="signup_form">
			<div>
				<%-- small : 작은 글씨 --%>
				<label for="id" class="form-label">*아이디</label>
				<small class="form-text text-muted"> : 영문자 소문자로 시작하고, 5 ~ 10글자 이내로 입력하세요.</small>
				<input type="text" name="id" id="id" class="form-control" />
				<%-- 내용이 없다가, id 사용 가능 / 불가능 메시지 띄워줌 --%>
				<%-- <div class="invalid-feedback invalid-id-feedback"></div> --%>
				
				<%-- 가용하지 않을 때 feedback--%>
				<div class="invalid-feedback" id="id-invalid-feedback"></div>
				<%-- 가용할 때 띄우는 feedback --%>
				<div class="valid-feedback" id="id-valid-feedback">사용할 수 있는 아이디입니다.</div>
			</div>
			<div>
				<label for="pwd" class="form-label">*비밀번호</label>
				<small class="form-text text-muted"> : 5 ~ 10 글자 이내로 입력하세요.</small>
				<input type="password" name="pwd" id="pwd" class="form-control" />
				
				<%-- 가용하지 않을 때 feedback--%>
				<div class="invalid-feedback" id="pwd-invalid-feedback">비밀번호 형식에 맞지 않습니다.</div>
				<%-- 가용할 때 띄우는 feedback --%>
				<div class="valid-feedback" id="pwd-valid-feedback">사용할 수 있는 비밀번호 입니다.</div>				
				
			</div>
			<div>
				<label for="pwd" class="form-label">*비밀번호 확인</label>
				<input type="password" name="pwd2" id="pwd2" class="form-control" />
				
				<%-- 비밀번호 확인 : 위의 비밀번호와 동일하게 입력하였는지 확인하기 --%>
				<%-- 가용하지 않을 때 feedback--%>
				<div class="invalid-feedback" id="pwd2-invalid-feedback">일치하지 않습니다.</div>
				<%-- 가용할 때 띄우는 feedback --%>
				<div class="valid-feedback" id="pwd2-valid-feedback">ok</div>
			</div>
			<div>
				<label for="nickname" class="form-label">*닉네임(활동명)</label>
				<input type="text" name="nickname" id="nickname" class="form-control" />
				<!-- 빈칸일 때 -> 필수 정보임을 알림 -->
				<!-- 존재하는 닉네임일 때 -> 사용 불가능한 닉네임을 알림 -->
				<div class="invalid-feedback" id="nickname-invalid-feedback"></div>
			</div>
			<div>
				<label for="name" class="form-label">*이름(실명)</label>
				<input type="text" name="name" id="name" class="form-control" />
				<!-- 빈칸일 때 -> 필수 정보임을 알림 -->
				<div class="invalid-feedback" id="name-invalid-feedback">필수 정보입니다.</div>
			</div>
			<div>
				<label for="sex" class="form-label">*성별</label>
				<%-- selected 안붙이고 select 에 value 로 붙여서 사용 안됨 -> javascript 로는 바꾸면 가능! --%>
				<select name="sex" id="sex">
					<option value="not-selected" selected>성별</option>
					<option value="man" >남성</option>
					<option value="woman">여성</option>
					<option value="else">그 외</option>
				</select>
				<!-- not-selected 일 때 -> 필수 정보임을 알림 -->
				<div class="invalid-feedback" id="sex-invalid-feedback">필수 정보입니다.</div>
			</div>
			
			<div>
				<label for="birth" class="form-label">*생년월일</label>
				<input type="date" name="birth" id="birth" class="form-control" />
				<!-- 빈칸일 때 -> 필수 정보임을 알림 -->
				<div class="invalid-feedback" id="name-invalid-feedback">필수 정보입니다.</div>
			</div>
			
			
			<div>
				<label for="tel" class="form-label">휴대전화번호</label>
				<input type="text" name="tel" id="tel" class="form-control" />
			</div>
			<div>
				<label for="email" class="form-label">이메일</label>
				<input type="text" name="email" id="email" class="form-control" />
				<%-- email 형식 확인 : 가용한 이메일 형식인지 확인한다. --%>
				<div class="invalid-feedback" id="email-invalid-feedback">사용할 수 없는 이메일입니다.</div>
				<div class="valid-feedback" id="email-valid-feedback">ok</div>
			</div>
			<br />
			<button type="submit" class="btn btn-primary">가입</button>
		</form>
	</div>
</body>
</html>