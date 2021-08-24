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
	<div id="signup_form_container" class="container">
		<h1>회원가입 페이지</h1>
		<p>* 이 포함된 사항은 필수 입력사항입니다. 반드시 입력해주세요.</p>
		<form action="${pageContext.request.contextPath}/users/signup.do" method="post" id="signup_form">
			<!-- parameter 로 넘어온 isAdChecked 추가 : 0(동의X), 1(동의O) -->
			<input type="hidden" name="tos" value="${isAdChecked ? 1 : 0}" />
			<div>
				<%-- small : 작은 글씨 --%>
				<label for="id" class="form-label">*아이디</label>
				<small class="form-text text-muted"> : 영문자 소문자로 시작하고, 5 ~ 10글자 이내로 입력하세요.</small>
				<input v-model="inputId" v-on:input="idCheck" 
						v-bind:class="{ 'is-valid': isIdValid, 'is-invalid': !isIdValid && isIdInputed }" 
						type="text" name="id" id="id" class="form-control" />
				<%-- 내용이 없다가, id 사용 가능 / 불가능 메시지 띄워줌 --%>
				<%-- <div class="invalid-feedback invalid-id-feedback"></div> --%>
				
				<%-- 가용하지 않을 때 feedback--%>
				<div class="invalid-feedback" id="id-invalid-feedback">{{idInvalidFeedbackMsg}}</div>
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
				<label for="pwd2" class="form-label">*비밀번호 확인</label>
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
				<select name="sex" id="sex" class="form-select">
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
			<div>
				<p>비밀번호 분실 시에 작성할 질문을 선택해주세요.</p>
				<label for="pwd_question">*질문 선택</label>
				<select name="pwd_question" id="pwd_question" class="form-select">
					<option v-for="(item, index) in pwd_question_list" 
							v-bind:key="index" 
							v-bind:value="item.num">{{item.question}}</option>
				</select>
			</div>
			<div>
				<p>질문에 대한 답변을 작성해주세요. 단답형을 권장드립니다.</p>
				<input type="text" name="pwd_answer" id="pwd_answer" class="form-control" />
			</div>
			<br />
			<button type="submit" class="btn btn-primary">가입</button>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script>
		// webcontent 위치
		const base_url = "http://localhost:8888/dadoc";
		
		//화면 전체 container 감싸는 view(app)
		let app = new Vue({
			el: "#signup_form_container",
			data : {
				pwd_question_list: [],	//비밀번호 분실 시에 사용할 질문 list
				base_url,
				isIdValid: false,	//아이디의 유효성 검사
				inputId: '',	//작성한 id를 model 로 관리
				idInvalidFeedbackMsg: '',	//id 가 가용하지 X 메시지 (null / 가용X 둘 중 하나)
				isIdInputed: false,	//id 가 입력된 적이 있는지 -> 한 번이라도 입력되면 true
				
			},
			created(){//처음 vue 생성될 때(화면 처음 구성할 때)
				//vue 객체
				let self = this;
				//ajax 로 DB 에서 비밀번호 질문 리스트 읽어오기
				ajaxPromise(base_url + "/ajax/users/pwd_question_list.do", "post")
				.then(function(response){
					return response.json();
				})
				.then(function(data){
					//data : pwd_question_list 가 들어있음
					self.pwd_question_list = data;
				});
			},
			methods: {
				//id 유효성 검사하는 메소드
				idCheck(){
					//console.log("id입력");
					//입력했기 때문에 호출되는 함수 -> isIdInputed 는 true
					this.isIdInputed = true;
					
					//입력이 공백 -> isIdValid 는 false / idInvalidFeedbackMsg : "필수 사항입니다. 입력해주세요."
					if(this.inputId == ''){
						//유효하지 X : isIdValid -> false
						this.isIdValid = false;
						//idInvalidFeedbackMsg -> 빈칸임을 알림
						this.idInvalidFeedbackMsg = '필수 사항입니다. 입력해주세요.';
						//종료
						return;
					}
					
					//입력한 아이디를 검증할 정규 표현식
					//첫 글자는 영문자 소문자로 시작, 총 5~10 글자
					//정규식 내부에 {} 등의 내부에 빈칸을 띄우면 오류가 난다.
					const reg_id = /^[a-z].{4,9}$/;
					
					//만일 입력한 아이디가 정규표현식과 매칭되지 않는다면 -> 올바른 형식이 아님 -> DB 체크 안해도 됨
					if(!reg_id.test(this.inputId)){
						//유효하지 X : isValid -> false
						this.isIdValid = false;
						//idInvalidFeedbackMsg -> 유효하지 않음
						this.idInvalidFeedbackMsg = '유효하지 않은 아이디입니다. 다시 입력해주세요.';
						//종료
						return;
					}
					
					//Promise 객체 내부에서 사용할 vue 객체 this
					const self = this;
					
					//ajax 로 db 에 해당 id 가 존재하는지 check
					fetch(base_url + "/ajax/users/check_id.do?inputId="+self.inputId)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						// data : {"isExist" : true/false} 형태의 json
						//console.log(data);
						// 같은 id 가 존재 -> 사용 X -> 유효하지 X
						if(data.isExist){
							//유효하지 X : isValid -> false
							self.isIdValid = false;
							//idInvalidFeedbackMsg -> 사용할 수 없는 id
							self.idInvalidFeedbackMsg = '사용할 수 없는 id 입니다.';
						}else{
							//사용 가능! : isIdValid -> true
							self.isIdValid = true;
						}
					});
				}
			}
		});
	</script>
	
</body>
</html>