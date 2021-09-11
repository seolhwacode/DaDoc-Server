<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<!-- 외부 css 및 파일들 추가  -->
<jsp:include page="/include/resources_head.jsp"></jsp:include>
<style>
	/*페이지 헤더 색상 조정*/
	.page-header {
		background-color: #F9E0AE;
	}
	
	/* crumb 네비바 뒤로가기 */
	.page-header .breadcrumb{
		z-index: 0;
	}
	
	/* 전체 메인 컨텐츠 */
	.root-container{
		margin-bottom: 15%;
		margin-top: 10%;
	}
	
	/* 중앙정렬 & 아래 여백 추가 */
	.content-container{
		max-width: 600px;
		margin: 0 auto;
	}
	
	/* h1 - 아래 밑줄 */
	.content-container > h1{
		border-bottom: solid;
    	border-color: #682c0e;
	}
	
	.content-container p {
	    font-size: 1rem;
	    font-weight: bold;
	    color: #c24914;
	}
	
	/* 입력 input 세트 하나 감싸는 class : label, input, 오류&ok 메시지 */
	.form-item-wrapper{
		margin: 20px 0;
	}
	
	/* form 의 label */
	.form-item-wrapper label{
		font-size: 1rem;
		color: #424242;
		margin-bottom: 0;
	}
	
	/* form 의 small */
	.form-item-wrapper small{
		font-size: 0.9rem;
	    display: inline-block;
	    margin-top: 0;
	}
	
	/* text-muted 수정 */
	.text-muted{
		color: #545454 !important;
	}
	
	/* form 의 input */
	.form-item-wrapper .form-control{
		background-color: #f5f6f7;
		font-size: 1.0rem;
		height: 2.4rem;
		color: black;
	}
	
	/* form 의 회원 가입 버튼 */
	.content-container button{
		width: -webkit-fill-available;
	    height: 3.0rem;
	    font-size: 1.4rem;
	    padding: inherit;
	    background-color: #C24914;
	    color: #f9e0ae;
	    font-weight: bold;
	}
	
	/* 버튼 hover */
	.content-container button:hover{
		background-color: #8c3712;
		color: #f9e0ae;
	}
	
	/* 구분선 */
	hr{
		background-color: #682c0e;
	}
	
}
</style>
</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="signup" name="thisPage"/>
	</jsp:include>
	
	<!-- 페이지 헤더 -->
	<section class="page-header page-header-modern page-header-md">
		<div class="container">
			<div class="row">
				<div
					class="col-md-12 align-self-center p-static order-2 text-center">

					<h1 class="text-dark font-weight-bold text-8 bold-family">Sign Up</h1>
					<span class="sub-title text-dark">Join with DADOC</span>
				</div>

				<div class="col-md-12 align-self-center order-1">

					<ul class="breadcrumb d-block text-center">
						<li><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li class="active">Sign Up</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<!-- main content -->
	<div id="signup_form_container" class="container root-container">
		<div class="content-container">
			<h1>회원가입</h1>
			<p>* 이 포함된 사항은 필수 입력사항입니다. 반드시 입력해주세요.</p>
			<form action="${pageContext.request.contextPath}/users/signup.do" 
					@submit.prevent="onSubmit" ref="signupForm"
					method="post" id="signup_form">
				<!-- parameter 로 넘어온 isAdChecked 추가 : 0(동의X), 1(동의O) -->
				<input type="hidden" name="tos" value="${isAdChecked ? 1 : 0}" />
				<div class="form-item-wrapper">
					<%-- small : 작은 글씨 --%>
					<label for="id" class="form-label">*아이디</label>
					<small class="form-text text-muted"> : 영문자 소문자로 시작하고, 5 ~ 10글자 이내로 입력하세요.</small>
					<input v-model="inputId" v-on:input="idCheck" 
							v-bind:class="{ 'is-valid': isIdValid, 'is-invalid': !isIdValid && isIdInputed }" 
							type="text" name="id" id="id" class="form-control form-control-lg" />
					<%-- 내용이 없다가, id 사용 가능 / 불가능 메시지 띄워줌 --%>
					<%-- <div class="invalid-feedback invalid-id-feedback"></div> --%>
					
					<%-- 가용하지 않을 때 feedback--%>
					<div class="invalid-feedback" id="id-invalid-feedback">{{idInvalidFeedbackMsg}}</div>
					<%-- 가용할 때 띄우는 feedback --%>
					<div class="valid-feedback" id="id-valid-feedback">사용할 수 있는 아이디입니다.</div>
				</div>
				<div class="form-item-wrapper">
					<label for="pwd" class="form-label">*비밀번호</label>
					<small class="form-text text-muted"> : 5 ~ 10 글자 이내로 입력하세요.</small>
					<input v-model="inputPwd" v-on:input="pwdCheck"
							v-bind:class="{ 'is-valid': isPwdValid, 'is-invalid': !isPwdValid && isPwdInputed }" 
							type="password" name="pwd" id="pwd" class="form-control form-control-lg" />
					
					<%-- 가용하지 않을 때 feedback--%>
					<div class="invalid-feedback" id="pwd-invalid-feedback">{{pwdInvalidFeedbackMsg}}</div>
					<%-- 가용할 때 띄우는 feedback --%>
					<div class="valid-feedback" id="pwd-valid-feedback">사용할 수 있는 비밀번호 입니다.</div>
				</div>
				<div class="form-item-wrapper">
					<label for="pwd2" class="form-label">*비밀번호 확인</label>
					<!-- pwd 가 가용 X -> pwd2 는 뭘 입력해도 가용하지 않음 -->
					<input v-model="inputPwd2" v-on:input="pwd2Check"
							v-bind:class="{ 'is-valid': isPwd2Valid, 'is-invalid': !isPwd2Valid && isPwd2Inputed }" 
							type="password" name="pwd2" id="pwd2" class="form-control form-control-lg" />
					
					<%-- 비밀번호 확인 : 위의 비밀번호와 동일하게 입력하였는지 확인하기 --%>
					<%-- 가용하지 않을 때 feedback--%>
					<div class="invalid-feedback" id="pwd2-invalid-feedback">일치하지 않습니다.</div>
					<%-- 가용할 때 띄우는 feedback --%>
					<div class="valid-feedback" id="pwd2-valid-feedback">ok</div>
				</div>
				<div class="form-item-wrapper">
					<label for="nickname" class="form-label">*닉네임(활동명)</label>
					<small class="form-text text-muted"> : 2 ~ 10글자 이내로 입력하세요.</small>
					<input v-model="inputNick" v-on:input="nickCheck"
							v-bind:class="{ 'is-valid': isNickValid, 'is-invalid': !isNickValid && isNickInputed }" 
							type="text" name="nickname" id="nickname" class="form-control form-control-lg" />
					<!-- 존재하는 닉네임일 때 -> 사용 불가능한 닉네임을 알림 -->
					<div class="invalid-feedback" id="nickname-invalid-feedback">{{nickInvalidFeedbackMsg}}</div>
					<%-- 가용할 때 띄우는 feedback --%>
					<div class="valid-feedback" id="nickname-valid-feedback">사용할 수 있는 닉네임입니다.</div>
				</div>
				<div class="form-item-wrapper">
					<label for="name" class="form-label">*이름(실명)</label>
					<input v-model="inputName" v-on:input="nameCheck"
							v-bind:class="{ 'is-valid': isNameValid, 'is-invalid': !isNameValid && isNameInputed }" 
							type="text" name="name" id="name" class="form-control form-control-lg" />
					<!-- 빈칸일 때 -> 필수 정보임을 알림 -->
					<div class="invalid-feedback" id="name-invalid-feedback">필수 정보입니다.</div>
				</div>
				<div class="form-item-wrapper">
					<label for="sex" class="form-label">*성별</label>
					<%-- selected 안붙이고 select 에 value 로 붙여서 사용 안됨 -> javascript 로는 바꾸면 가능! --%>
					<select v-model:value="inputSex" v-on:change="sexCheck" 
							v-bind:class="{ 'is-valid': isSexValid, 'is-invalid': !isSexValid && isSexInputed }"
							name="sex" id="sex" class="form-control form-control-lg">
						<option value="not-selected" selected>성별</option>
						<option value='0'>남성</option>
						<option value='1'>여성</option>
						<option value='2'>그 외</option>
					</select>
					<!-- not-selected 일 때 -> 필수 정보임을 알림 -->
					<div class="invalid-feedback" id="sex-invalid-feedback">필수 정보입니다.</div>
				</div>
				<div class="form-item-wrapper">
					<label for="birth" class="form-label">*생년월일</label>
					<input v-model:value="inputBirth" v-on:input="birthCheck" 
							v-bind:class="{ 'is-valid': isBirthValid, 'is-invalid': !isBirthValid && isBirthInputed }"
							type="date" name="birth" id="birth" class="form-control form-control-lg" />
					<!-- 빈칸일 때 -> 필수 정보임을 알림 -->
					<div class="invalid-feedback" id="birth-invalid-feedback">필수 정보입니다.</div>
				</div>
				<div class="form-item-wrapper">
					<label for="tel" class="form-label">휴대전화번호</label>
					<small class="form-text text-muted"> : '-'를 제외하고 숫자만 입력해주세요.</small>
					<input v-model="inputTel" maxlength="11"
							type="text" name="tel" id="tel" 
							class="form-control form-control-lg" placeholder="01012341234" />
				</div>
				<div class="form-item-wrapper">
					<label for="email" class="form-label">이메일</label>
					<input v-model="inputEmail" v-on:input="emailCheck" 
							v-bind:class="{ 'is-valid': isEmailValid && !isEmailNull, 'is-invalid': !isEmailValid && isEmailInputed && !isEmailNull }"
							type="email" name="email" id="email" class="form-control form-control-lg" />
					<%-- email 형식 확인 : 가용한 이메일 형식인지 확인한다. --%>
					<div class="invalid-feedback" id="email-invalid-feedback">사용할 수 없는 이메일입니다.</div>
					<div class="valid-feedback" id="email-valid-feedback">ok</div>
				</div>
				<hr />
				<div class="form-item-wrapper">
					<p>비밀번호 분실 시에 작성할 질문을 선택해주세요.</p>
					<label for="pwd_question">*질문 선택</label>
					<select name="pwd_question" id="pwd_question" class="form-control form-control-lg">
						<option v-for="(item, index) in pwd_question_list" 
								v-bind:key="index" 
								v-bind:value="item.num">{{item.question}}</option>
					</select>
				</div>
				<div class="form-item-wrapper">
					<p>질문에 대한 답변을 작성해주세요. 단답형을 권장드립니다.</p>
					<!-- blur = focus out : 일 때 검사함 -->
					<input v-model="inputPwdAnswer" v-on:blur="answerCheck" 
							v-bind:class="{ 'is-valid' : isPwdAnswerValid, 'is-invalid': !isPwdAnswerValid && isFocused }"
							type="text" name="pwd_answer" id="pwd_answer" class="form-control form-control-lg" />
					<%-- 가용하지 않을 때 feedback--%>
					<div class="invalid-feedback" id="pwd-answer-invalid-feedback">필수 정보입니다.</div>
				</div>
				<br />
				<button type="submit" class="btn">회원 가입</button>
			</form>
		</div>
		
	</div>
	
	<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
	<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
	<!-- vue -->
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
				//id 유효성 검사
				isIdValid: false,	//아이디의 유효성 검사
				inputId: '',	//작성한 id를 model 로 관리
				idInvalidFeedbackMsg: '',	//id 가 가용하지 X 메시지 (null / 가용X 둘 중 하나)
				isIdInputed: false,	//id 가 입력된 적이 있는지 -> 한 번이라도 입력되면 true
				
				//pwd 유효성 검사
				isPwdValid: false,
				inputPwd: '',	//작성한 pwd 를 model 로 관리
				isPwdInputed: false,	//pwd 가 입력된 적이 있는지 -> 한 번이라도 입력되면 true
				pwdInvalidFeedbackMsg: '',	//pwd 가 가용하지 X 메시지 (null / 가용X 둘 중 하나)
				
				//pwd 재입력의 유효성 검사
				isPwd2Valid: false,	
				inputPwd2: '',	//작성한 pwd2 를 model 로 관리
				isPwd2Inputed: false,	//pwd2 가 입력된 적이 있는지 -> 한 번이라도 입력되면 true
				
				//nickName 유효성 검사
				isNickValid: false,
				inputNick: '',	//작성한 nickName 를 model 로 관리
				isNickInputed: false,	//nickName 가 입력된 적이 있는지 -> 한 번이라도 입력되면 true
				nickInvalidFeedbackMsg: '',	//nickName 가 가용하지 X 메시지 (null / 가용X 둘 중 하나)
				
				//name 유효성 검사
				isNameValid: false,
				inputName: '',		//작성한 name 을 model 로 관리
				isNameInputed: false,	//name 이 입력된 적 있는지 -> 한 번이라도 입력되면 true
				
				//sex 유효성 검사
				isSexValid: false,
				inputSex: 'not-selected',	//sex 의 선택 값을 model 로 관리
				isSexInputed: false,	//sex 가 입력된 적이 있는지 -> 한 번이라도 된 적 있다면 true
				
				//birth 생년월일 빈칸 검사
				isBirthValid: false,
				inputBirth: '',		//birth 의 선택 값을 model 로 관리
				isBirthInputed: false,	//birth 가 선택된 적이 있는지 -> 한 번이라도 입력된 적 있다면 true
				
				//tel 전화번호 유효성 검사(빈칸은 ok -> 필수사항 아님)
				inputTel: '',	//-> check 가 아닌, 입력자체를 막는 방식으로 진행
				
				//email 유효성 검사
				isEmailValid: false,
				inputEmail: '',		//email 입력값
				isEmailInputed: false,	//email 입력된 적 있는지 check
				isEmailNull: true,	//email 이 입력값 x -> invalid, valid 둘 다 X(제출 ok)
				
				//비밀번호 분실시 답변 검사
				isPwdAnswerValid: false,
				inputPwdAnswer: '',
				isFocused: false	//focus 된 적이 있으면 -> true
				
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
			watch: {
				//inputTel 을 계속 감시하면서, 숫자가 아닌 값이 입력되면 자동으로 공백으로 대체한다.
				inputTel: function(){
					//그 외의 다른 문자들 제외시키고 -> return
					return this.inputTel = this.inputTel.replace(/[^0-9]/g, '');
				}
			},
			methods: {
				//form 제출 -> 모든 유효성 검사 통과해야 제출 가능
				onSubmit(){
					//1. 모든 유효성 검사 다시 하기
					this.idCheck();
					this.pwdCheck();
					this.pwd2Check();
					this.nickCheck();
					this.nameCheck();
					this.sexCheck();
					this.birthCheck();
					this.emailCheck();
					this.answerCheck();

					//2. 모든 유효성 검사 통과해야함
					// id / pwd / pwd2 / nickname / name / sex / birth / eamil / pwd_answer
					let isFormValid = this.isIdValid && this.isPwdValid && 
							this.isPwd2Valid && this.isNickValid && this.isNameValid 
							&& this.isSexValid && this.isBirthValid && 
							(this.isEmailValid || this.isEmailNull) && this.isPwdAnswerValid;
					//3. 유효하지 X -> form 전송 막기
					if(!isFormValid){
						//사용자 알림
						alert("입력값을 확인해주세요.");
						return;
					}
					
					//4. 유효함 -> ajax 로 회원가입
					//* form 의 참조값 읽어옴
					const form = this.$refs.signupForm;
					//vue 의 객체 가져옴 -> 페이지 이동을 위해
					const self = this;
					//ajax 로 회원가입
					ajaxFormPromise(form)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						//data = { isSuccess: true/false } 회원가입 성공 여부
						if(data.isSuccess){
							//성공 -> confirm 으로 로그인하러 가기 / 홈으로 돌아가기 중 선택
							let isGoLogin = confirm('회원 가입 성공! 로그인하러 가시겠습니까?');
							if(isGoLogin){
								//-> 로그인 창으로 이동
								location.href = self.base_url + '/users/login_form.do';
							}else{
								//-> 홈페이지로 이동
								location.href = self.base_url + '/';
							}
						}else{
							//실패 -> 실패함을 alert 로 알림
							let isStay = confirm('회원 가입 실패ㅠㅠ 다시 진행하시겠습니까?');
							if(isStay){
								//남아서 다시 회원가입 진행
								return;
							}else{
								//-> 홈페이지로 이동
								location.href = self.base_url + '/';
							}
						}
					});
				},
				answerCheck(){
					//focus 된 적 있음
					this.isFocused = true;
					
					//입력된 값이 존재하는지 검사
					if(this.inputPwdAnswer == ''){
						//입력값 X -> isPwdAnswerValid -> false
						this.isPwdAnswerValid = false;
					}else{
						//입력값 O -> isPwdAnswerValid -> true
						this.isPwdAnswerValid = true;
					}
				},
				emailCheck(){
					//이메일 입력된 적 있음
					this.isEmailInputed = true;
					
					//입력이 빈칸 -> 제출 ok
					if(this.inputEmail == ''){
						//제출 ok
						this.isEmailValid = true;
						//입력 x -> valid, invalid 속성 제거하기
						this.isEmailNull = true;
						//종료
						return;
					}
					
					//입력이 있으면 false 하고 시작
					this.isEmailNull = false;
					
					//이메일 입력 정규식
					const email_reg = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
					
					//정규식에 맞는지 checks
					if(email_reg.test(this.inputEmail)){
						//정규식에 부합함
						this.isEmailValid = true;
					}else{
						//정규식에 부합 X
						this.isEmailValid = false;
					}
				},
				//생년월일 선택 여부 검사
				birthCheck(){
					console.log(this.inputBirth)
					
					//선택 했음
					this.isBirthInputed = true;
					
					//bith 값의 유효성 검사
					this.isBirthValid = Date.parse(this.inputBirth);
				},
				//성별 선택 여부 검사
				sexCheck(){
					//선택 했음
					this.isSexInputed = true;
					
					//선택 값이 'not-selected' -> 선택 X 와 같음
					if(this.inputSex == 'not-selected'){
						this.isSexValid = false;
					}else{
						this.isSexValid = true;
					}
				},			
				//입력한 이름의 빈칸 여부 검사
				nameCheck(){
					//입력 했음
					this.isNameInputed = true;
					
					//입력이 공백 -> isNameValid 는 false
					if(this.inputName == ''){
						//유효하지 X : isNameValid -> false
						this.isNameValid = false;
						//종료
						return;
					}else{
						//유효함 : isNameValid -> true
						this.isNameValid = true;
					}
				},
				//입력한 닉네임의 유효성 검사 함수
				nickCheck(){
					//입력했기 때문에 호출되는 함수 -> isPwdInputed
					this.isNickInputed = true;
					
					//입력이 공백 -> isNickValid 는 false / nickInvalidFeedbackMsg : "필수 사항입니다. 입력해주세요."
					if(this.inputNick == ''){
						//유효하지 X : isNickValid -> false
						this.isNickValid = false;
						//nickInvalidFeedbackMsg -> 빈칸임을 알림
						this.nickInvalidFeedbackMsg = '필수 정보입니다.';
						//종료
						return;
					}
					
					//닉네임 정규식
					//두 글자 이상, 10글자 이하
					const reg_nick = /^.{2,10}$/;
					
					//만일 입력한 닉네임이 정규표현식과 매칭되지 않는다면 -> 올바른 형식이 아님 -> DB 체크 안해도 됨
					if(!reg_nick.test(this.inputNick)){
						//유효하지 X : isNickNameValid -> false
						this.isNickValid = false;
						//idInvalidFeedbackMsg -> 유효하지 않음
						this.nickInvalidFeedbackMsg = '유효하지 않은 닉네임입니다. 다시 입력해주세요.';
						//종료
						return;
					}
					
					//Promise 객체 내부에서 사용할 vue 객체 this
					const self = this;
					
					fetch(this.base_url + "/ajax/users/check_nickname.do?inputNick=" + this.inputNick)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						// data : {"isExist" : true/false} 형태의 json
						//console.log(data);
						if(data.isExist){
							//동일한 닉네임 존재 -> 사용 X
							self.isNickValid = false;
							self.nickInvalidFeedbackMsg = '사용할 수 없는 닉네임입니다.';
						}else{
							//동일한 닉네임 존재 X -> 사용 O
							self.isNickValid = true;
						}
					});
					
				},
				//입력한 pwd 와 이를 재입력하는 pwd2 의 검사
				pwd2Check(){
					//입력했기 때문에 호출되는 함수 -> isPwd2Inputed 는 true
					this.isPwd2Inputed = true;
					
					//pwd 가 가용 X -> pwd2 는 뭘 입력해도 가용하지 않음
					//pwd 가용 X 또는 입력된 적 없음
					if(!this.isPwdValid || !this.isPwdInputed){
						//가용X
						this.isPwd2Valid = false;
						//종료
						return;
					}
					
					//입력이 공백 -> isPwd2Valid 는 false
					if(this.pwd2Input == ''){
						//유효하지 x : isPwd2Valid -> false
						this.isPwd2Valid = false;
						//종료
						return;
					}
					
					//inputPwd 와 inputPwd2 가 일치 -> pwd2 는 유효함
					if(this.inputPwd == this.inputPwd2){
						//유효 o : isPwd2Valid -> true
						this.isPwd2Valid = true;
					}else{
						//일치 x -> 유효하지 x
						this.isPwd2Valid = false;
					}
				},
				//입력한 pwd 유효성 검사하는 메소드
				pwdCheck(){
					//입력했기 때문에 호출되는 함수 -> isPwdInputed 는 true
					this.isPwdInputed = true;
					
					//입력이 공백 -> isPwdValid 는 false
					if(this.inputPwd == ''){
						//유효하지 x : isPwdValid -> false
						this.isPwdValid = false;
						//pwdInvalidFeedbackMsg -> 빈칸임을 알림
						this.pwdInvalidFeedbackMsg = '필수 정보입니다.';
						//종료
						return;
					}
					
					// 비밀번호 정규식 : 5~10 글자 -> 아무 글자 5 ~ 10 글자
					const reg_pwd = /^.{5,10}$/;
					
					//만일 입력한 비밀번호(pwd)가 정규표현식과 매칭됨 -> 사용 가능
					if(reg_pwd.test(this.inputPwd)){
						this.isPwdValid = true;
					}else{
						//만일 입력한 비밀번호(pwd)가 정규표현식과 매칭되지 않는다면 -> 올바른 형식이 아님
						this.isPwdValid = false;
						this.pwdInvalidFeedbackMsg = '유효하지 않은 비밀번호입니다. 다시 입력해주세요.';
					}
					
					//pwd2 에도 입력된 적 있음 -> pwd 입력란이 변하면 -> pwd2 확인란에도 변화
					if(this.isPwd2Inputed){
						this.pwd2Check();
					}
				},
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
						this.idInvalidFeedbackMsg = '필수 정보입니다.';
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
					fetch(this.base_url + "/ajax/users/check_id.do?inputId="+self.inputId)
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