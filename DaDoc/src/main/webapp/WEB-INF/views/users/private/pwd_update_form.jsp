<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update_form.do</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
	<div id="pwdUpdateFormContainer" class="container">
		<h1>비밀번호 변경 form 입니다.</h1>
		<form action="${pageContext.request.contextPath}/users/private/pwd_update.do" method="post">
			<input type="hidden" name="id" value="${ sessionScope.id }" />
			<div>
				<label for="pwd" class="form-label">현재 비밀번호</label>
				<input type="password" class="form-control" name="pwd" id="pwd" />
			</div>
			<div>
				<label for="newPwd" class="form-label">새로운 비밀번호</label>
				<small class="form-text text-muted"> : 5 ~ 10 글자 이내로 입력하세요.</small>
				<input v-model="inputNewPwd" v-on:input="newPwdCheck" 
						v-bind:class="{ 'is-valid': isNewPwdValid, 'is-invalid': !isNewPwdValid && isNewPwdInputed }" 
						type="password" name="newPwd" id="newPwd" class="form-control" />
				<%-- 가용하지 않을 때 feedback--%>
				<div class="invalid-feedback" id="pwd-invalid-feedback">{{newPwdInvalidFBMsg}}</div>
				<%-- 가용할 때 띄우는 feedback --%>
				<div class="valid-feedback" id="pwd-valid-feedback">사용할 수 있는 비밀번호 입니다.</div>
			</div>
			<div>
				<button @click.prevent="goUsersInfo">취소</button>
				<button @click="submitForm">수정</button>
			</div>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		// webcontent 위치
		const base_url = "http://localhost:8888/dadoc";
		
		let pwdUpdateFormContainer = new Vue({
			el: "#pwdUpdateFormContainer",
			data: {
				base_url,	//webcontent 위치
				//newPwd 유효성 검사
				isNewPwdValid: false,
				inputNewPwd: '',	//작성한 newPwd 를 model 로 관리
				isNewPwdInputed: false,	//newPwd 가 입력된 적이 있는지 -> 한 번이라도 입력되면 true
				newPwdInvalidFBMsg: '',	//newPwd 가 가용하지 X 메시지 (null / 가용X 둘 중 하나)
			},
			methods: {
				//비밀번호 수정을 취소하고, 사용자 info 페이지로 돌아가기
				goUsersInfo(){
					let result = confirm("수정사항을 취소하고, 나가시겠습니까?");
					if(result){
						//사용자 개인정보 페이지로 가기
						location.href = this.base_url + "/users/private/info.do";
					}
				},
				//form 제출
				submitForm(e){
					//제출 전에, 입력한 newPwd 의 가용성 다시 체크
					this.newPwdCheck();
					
					//유효성 검사 통과 X
					if(!this.isNewPwdValid){
						//form 전송 막기
						e.preventDefault();
						//사용자 알림
						alert("입력값을 확인해주세요.");
						return;
					}
					//통과 -> 그대로 form 전송
				},
				//새로 입력하는 newPwd 비밀번호의 가용성 체크
				newPwdCheck(){
					//입력 했음 -> isNewPwdInputed = true
					this.isNewPwdInputed = true;
					
					//입력이 공백 -> isNewPwdValid = false
					if(this.inputNewPwd === ''){
						//유효 X : isNewPwdValid = false
						this.isNewPwdValid = false;
						//newPwdInvalidFBMsg : 빈칸임을 알릭
						this.newPwdInvalidFBMsg = '필수 정보입니다.';
						//종료
						return;
					}
					
					// 비밀번호 정규식 : 5~10 글자 -> 아무 글자 5 ~ 10 글자
					const reg_pwd = /^.{5,10}$/;
					
					//만일 입력한 비밀번호(pwd)가 정규표현식과 매칭됨 -> 사용 가능
					if(reg_pwd.test(this.inputNewPwd)){
						this.isNewPwdValid = true;
					}else{
						//만일 입력한 비밀번호(pwd)가 정규표현식과 매칭되지 않는다면 -> 올바른 형식이 아님
						this.isNewPwdValid = false;
						this.newPwdInvalidFBMsg = '유효하지 않은 비밀번호입니다. 다시 입력해주세요.';
					}
				}
			}
		});
	</script>
</body>
</html>