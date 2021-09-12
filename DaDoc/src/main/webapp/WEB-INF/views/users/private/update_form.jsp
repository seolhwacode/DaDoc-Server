<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update_form.do</title>
<!-- 외부 css 및 파일들 추가  -->
<jsp:include page="/include/resources_head.jsp"></jsp:include>
<!-- 사용자 페이지에서만 사용하는 공통 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/include/users/users_template.css">
<!-- 탈퇴 모달에서 사용되는 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/include/users/leave_modal.css">
<style>
	/*페이지 헤더 색상 조정*/
	.page-header {
		background-color: #F9E0AE;
	}
	
	/* crumb 네비바 뒤로가기 */
	.page-header .breadcrumb{
		z-index: 0;
	}
	
	/* 전체 메인 컨텐츠 & 아래 여백 추가 */
	.root-container{
		margin-bottom: 10%;
		margin-top: 10%;
	}
	
	/* 중앙정렬  */
	.content-container{
		max-width: 100%;
		margin: 0 auto;
	}
	
	/* 오른쪽 내부 - h1 - 아래 밑줄 */
	.content-container .right-content > h1{
		border-bottom: solid;
	  	border-color: #682c0e;
	}
	
	/* 오른쪽 내부 패딩 추가 */
	.right-content{
		padding-left: 30px;
	}
	
	/* 테이블 오른쪽 margin 없애기 */
	.content-container .right-content table{
		width: 100%;
		font-size: 1rem;
	}
	
	/* form 의 input 크기 조절 */
	.content-container .right-content .form-control{
		height: 40px;
	}
	
	/* form 의 table tr */
	.content-container .right-content table tr{
		vertical-align: baseline;
	}
	
	/* form 의 td 안의 content 를 감싸고 있는 div - margin-bottom 으로 사이 간격 */
	.content-container .right-content table td div{
		margin-bottom: 10px;
	}
	
	.content-container .right-content .btn-wrapper{
	    display: flex;
		justify-content: center;
		margin-top: 20px;
	}
	
	.content-container .right-content .btn-wrapper .cancel-btn{
		width: -webkit-fill-available;
		background-color: #c1c1c1;
	    color: black;
	    font-weight: bold;
	    font-size: 1.2rem;
	    margin-right: 5px;
	}
	
	.content-container .right-content .btn-wrapper .cancel-btn:hover {
		background-color: #949494;
		color: black;
	}
	
	.content-container .right-content .btn-wrapper .update-btn{
		width: -webkit-fill-available;
	    background-color: #C24914;
	    color: #f9e0ae;
	    font-weight: bold;
	    font-size: 1.2rem;
	    margin-left: 5px;
	}
	
	.content-container .right-content .btn-wrapper .update-btn:hover {
		background-color: #8c3712;
	}
	
	/* 비밀번호 변경 버튼 */
	.btn-pwd{
	    background-color: #c1c1c1;
	    color: #000000;
	    font-size: 0.9rem;
	    font-weight: bold;
	}
}
</style>
</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="userInfo" name="thisPage"/>
	</jsp:include>
	
	<!-- 페이지 헤더 -->
	<section class="page-header page-header-modern page-header-md">
		<div class="container">
			<div class="row">
				<div class="col-md-12 align-self-center p-static order-2 text-center">
					<h1 class="text-dark font-weight-bold text-8 bold-family">Update Profile</h1>
					<span class="sub-title text-dark">You with DADOC</span>
				</div>
				<div class="col-md-12 align-self-center order-1">
					<ul class="breadcrumb d-block text-center">
						<li><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/users/private/info.do">User Information</a></li>
						<li class="active">Update Profile</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<!-- main content -->
	<div id="updateContainer" class="container root-container">
		<div class="content-container">
			<div class="row">
				<jsp:include page="/include/users/users_template.jsp">
					<jsp:param value="update" name="myPage"/>
				</jsp:include>
				<!-- 오른쪽 실제 content -->
				<div class="col-md-9 right-content">
					<h1>개인정보 수정</h1>
					<span>* 이 포함된 사항은 필수 입력사항입니다. 반드시 입력해주세요.</span>
					<form action="${pageContext.request.contextPath}/users/private/update.do" 
							@submit="onSubmit" 
							method="post" id="update_form">
						<!-- id 는 가져가야한다. -->
						<input type="hidden" name="id" v-bind:value="id" />
						<!-- vue 를 사용하여 model 로 관리하면 false 값은 보내지지 않는다 -> 따로 hidden 으로 관리 -->
						<input type="hidden" name="tos" v-bind:value="inputTos ? 1 : 0" />
						<table>
							<!-- id -->
							<tr>
								<th scope="row">아이디</th>
								<td>
									<div>
										{{ id }}
									</div>
								</td>
							</tr>
							<!-- 비밀번호 -->
							<tr>
								<th scope="row">*비밀번호</th>
								<td>
									<div>
										<button @click.prevent="pwdUpdateForm" class="btn btn-pwd">비밀번호 변경하기</button>
									</div>
								</td>
							</tr>
							<!-- 닉네임 -->
							<tr>
								<th scope="row">*닉네임(활동명)</th>
								<td>
									<div>
										<small class="form-text text-muted">2 ~ 10글자 이내로 입력하세요.</small>
										<input v-model="inputNick" v-on:input="nickCheck"
												v-bind:class="{ 'is-valid': isNickValid, 'is-invalid': !isNickValid && isNickInputed }" 
												type="text" name="nickname" id="nickname" class="form-control" />
										<!-- 존재하는 닉네임일 때 -> 사용 불가능한 닉네임을 알림 -->
										<div class="invalid-feedback" id="nickname-invalid-feedback">{{nickInvalidFeedbackMsg}}</div>
										<%-- 가용할 때 띄우는 feedback --%>
										<div class="valid-feedback" id="nickname-valid-feedback">{{nickValidFeedbackMsg}}</div>
									</div>
								</td>
							</tr>
							<!-- 이름 -->
							<tr>
								<th scope="row">*이름</th>
								<td>
									<div>
										<input v-model="inputName" v-on:input="nameCheck"
												v-bind:class="{ 'is-valid': isNameValid, 'is-invalid': !isNameValid && isNameInputed }" 
												type="text" name="name" id="name" class="form-control" />
										<!-- 빈칸일 때 -> 필수 정보임을 알림 -->
										<div class="invalid-feedback" id="name-invalid-feedback">필수 정보입니다.</div>
									</div>
								</td>
							</tr>
							<!-- 성별 -->
							<tr>
								<th scope="row">*성별</th>
								<td>
									<div>
										<%-- selected 안붙이고 select 에 value 로 붙여서 사용 안됨 -> javascript 로는 바꾸면 가능! --%>
										<select v-model:value="inputSex" v-on:change="sexCheck" 
												v-bind:class="{ 'is-valid': isSexValid, 'is-invalid': !isSexValid && isSexInputed }"
												name="sex" id="sex" class="form-control">
											<option value="not-selected" selected>성별</option>
											<option value='0'>남성</option>
											<option value='1'>여성</option>
											<option value='2'>그 외</option>
										</select>
										<!-- not-selected 일 때 -> 필수 정보임을 알림 -->
										<div class="invalid-feedback" id="sex-invalid-feedback">필수 정보입니다.</div>
									</div>
								</td>
							</tr>
							<!-- 생년월일 -->
							<tr>
								<th scope="row">*생년월일</th>
								<td>
									<div>
										<input v-model:value="inputBirth" v-on:input="birthCheck" 
												v-bind:class="{ 'is-valid': isBirthValid, 'is-invalid': !isBirthValid && isBirthInputed }"
												type="date" name="birth" id="birth" class="form-control" />
										<!-- 빈칸일 때 -> 필수 정보임을 알림 -->
										<div class="invalid-feedback" id="birth-invalid-feedback">필수 정보입니다.</div>
									</div>
								</td>
							</tr>
							
							
							<!-- 필수 X -->
							
							
							<!-- 휴대전화번호 -->
							<tr>
								<th scope="row">휴대전화번호</th>
								<td>
									<div>
										<small class="form-text text-muted"> : '-'를 제외하고 숫자만 입력해주세요.</small>
										<input v-model="inputTel" maxlength="11"
												type="text" name="tel" id="tel" 
												class="form-control" placeholder="01012341234" />
									</div>
								</td>
							</tr>
							<!-- 이메일 -->
							<tr>
								<th scope="row">이메일</th>
								<td>
									<div>
										<input v-model="inputEmail" v-on:input="emailCheck" 
												v-bind:class="{ 'is-valid': isEmailValid && !isEmailNull, 'is-invalid': !isEmailValid && isEmailInputed && !isEmailNull }"
												type="email" name="email" id="email" class="form-control" />
										<%-- email 형식 확인 : 가용한 이메일 형식인지 확인한다. --%>
										<div class="invalid-feedback" id="email-invalid-feedback">사용할 수 없는 이메일입니다.</div>
										<div class="valid-feedback" id="email-valid-feedback">ok</div>
									</div>
								</td>
							</tr>
							
							
							
							<!-- 비밀번호 분실시에 사용할 질문 -->
							<tr>
								<th scope="row">*질문 선택</th>
								<td>
									<div>
										<span>비밀번호 분실 시에 작성할 질문을 선택해주세요.</span>
										<select v-model:value="inputPwdQuestion" name="pwd_question" id="pwd_question" class="form-control">
											<option v-for="(item, index) in pwd_question_list" 
													v-bind:key="index" 
													v-bind:value="item.num">{{item.question}}</option>
										</select>
									</div>
								</td>
							</tr>
							<!-- 비밀번호 분실시 질문에 대한 답변 -->
							<tr>
								<th scope="row">*답변</th>
								<td>
									<div>
										<span>질문에 대한 답변을 작성해주세요. 단답형을 권장드립니다.</span>
										<!-- blur = focus out : 일 때 검사함 -->
										<input v-model="inputPwdAnswer" v-on:blur="answerCheck" 
												v-bind:class="{ 'is-valid' : isPwdAnswerValid, 'is-invalid': !isPwdAnswerValid && isFocused }"
												type="text" name="pwd_answer" id="pwd_answer" class="form-control" />
										<%-- 가용하지 않을 때 feedback--%>
										<div class="invalid-feedback" id="pwd-answer-invalid-feedback">필수 정보입니다.</div>
									</div>
								</td>
							</tr>
							<!-- 광고 동의 -->
							<tr>
								<th>광고 수신 동의(선택)</th>
								<td>
									<div>
										<label for="tos">
											<input v-model="inputTos" 
													type="checkbox" id="tos" />
											광고 수신 동의
										</label>
									</div>
								</td>
							</tr>
						</table>
						
						<div class="btn-wrapper">
							<button @click.prevent="cancel" class="btn cancel-btn">취소</button>
							<button type="submit" class="btn update-btn">수정</button>	
						</div>
					</form>	
				</div>
			</div>
		
		</div>
	</div>
	
	<!-- 탈퇴 모달 -->
	<jsp:include page="/include/users/leave_modal.jsp"></jsp:include>
	
	<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
	<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
	
	<!-- vue -->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	
	<!-- 탈퇴 모달 js 파일 가져오기 -->
	<script src="${pageContext.request.contextPath}/include/users/leave_modal.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>

	<script>
		// webcontent 위치
		const base_url = "http://localhost:8888/dadoc";
		
		let usersInfo = new Vue({
			el: '#updateContainer',
			data: {
				//개인정보 data : UsersDto 의 데이터를 josn 으로 받아서 넣기
				base_url,
				id: '${ sessionScope.id }',
				userData: {},
				profileSrc: '',	//프로필 사진 img 의 src 에 들어가는 부분
				pwd_question_list: [],	//비밀번호 분실시의 질문 리스트
				update_profile_link: '',	//프로필 수정으로 가는 링크
				inputTos: false,	//광고 수신 동의 : true(1) / false(0)
				
				
				//유효성 검사
				//nickName 유효성 검사
				isNickValid: false,
				inputNick: '',	//작성한 nickName 를 model 로 관리
				isNickInputed: false,	//nickName 가 입력된 적이 있는지 -> 한 번이라도 입력되면 true
				nickInvalidFeedbackMsg: '',	//nickName 가 가용하지 X 메시지 (null / 가용X 둘 중 하나)
				nickValidFeedbackMsg: '',	//nickName 이 가용할 때 메시지(그냥 사용 가능 / 원래의 아이디)
				
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
				inputPwdQuestion: 1,	//비밀번호 질문 선택 -> 기본 1
				isPwdAnswerValid: false,
				inputPwdAnswer: '',
				isFocused: false	//focus 된 적이 있으면 -> true
			},
			methods: {
				//취소 버튼
				cancel(){
					let result = confirm("작성하신 내용은 저장되지 않습니다. 페이지에서 나가시겠습니까?");
					if(result){//yes
						location.href = base_url + "/users/private/info.do";
					}
				},
				//비밀번호 수정 페이지로 이동
				pwdUpdateForm(){
					location.href = base_url + "/users/private/pwd_update_form.do";
				},
				//form 제출 -> 모든 유효성 검사 통과해야 제출 가능
				onSubmit(e){
					//모든 유효성 검사 다시 하기
					this.nickCheck();
					this.nameCheck();
					this.sexCheck();
					this.birthCheck();
					this.emailCheck();
					this.answerCheck();

					//모든 유효성 검사 통과해야함
					// nickname / name / sex / birth / eamil / pwd_answer
					let isFormValid = this.isNickValid && this.isNameValid 
							&& this.isSexValid && this.isBirthValid && 
							(this.isEmailValid || this.isEmailNull) && this.isPwdAnswerValid;
					//유효하지 X -> form 전송 막기
					if(!isFormValid){
						//form 전송 막기
						e.preventDefault();
						//사용자 알림
						alert("입력값을 확인해주세요.");
						return;
					}
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
				//-> 현재 닉네임과 동일한 것은 사용 가능해야한다.
				nickCheck(){
					//입력했기 때문에 호출되는 함수 -> isPwdInputed
					this.isNickInputed = true;
					
					//입력이 공백 -> isNickValid 는 false / nickInvalidFeedbackMsg : "필수 사항입니다. 입력해주세요."
					if(this.inputNick == ''){
						//유효하지 X : isNickValid -> false
						this.isNickNameValid = false;
						//nickInvalidFeedbackMsg -> 빈칸임을 알림
						this.nickInvalidFeedbackMsg = '필수 정보입니다.';
						//종료
						return;
					}
					
					// -> 현재 닉네임과 동일한 것은 사용 가능해야한다.
					if(this.inputNick == this.userData.nickname){
						//사용 가능
						this.isNickValid = true;
						this.nickValidFeedbackMsg = '현재 사용 중인 닉네임입니다.';
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
							self.nickValidFeedbackMsg = '사용할 수 있는 닉네임입니다.';
						}
					});
					
				},
				//모든 내용을 기본으로 만들기
				reset(){
					this.inputNick = this.userData.nickname;
					this.inputName = this.userData.name;
					this.inputSex = this.userData.sex;
					this.inputBirth = this.userData.birth;
					//휴대전화 : null 이 올 수 있음 -> 체크 필요
					if(this.userData.tel == '' || this.userData.tel == null){
						this.inputTel = '';
					}else{
						this.inputTel = this.userData.tel;
					}
					//이메일 : null 이 올 수 있음 -> 체크 필요
					if(this.userData.email == '' || this.userData.email == null){
						this.inputEmail = '';
					}else{
						this.inputEmail = this.userData.email;
					}
					this.inputPwdQuestion = this.userData.pwd_question;
					this.inputPwdAnswer = this.userData.pwd_answer;
					//광고 수신 동의 -> 0 : 동의 X(false) / 1 : 동의 O(true)
					if(this.userData.tos == 0){
						this.inputTos = false;
					}else{
						this.inputTos = true;
					}
				}
			},
			watch: {
				//inputTel 을 계속 감시하면서, 숫자가 아닌 값이 입력되면 자동으로 공백으로 대체한다.
				inputTel: function(){
					//그 외의 다른 문자들 제외시키고 -> return
					return this.inputTel = this.inputTel.replace(/[^0-9]/g, '');
				}
			},
			created(){
				//dadoc_users table 에서 기본 정보 가져오기
				let self = this;
				
				fetch(this.base_url + "/users/private/ajax_get_user_all.do?id=" + this.id)
				.then(function(response){
					return response.json();
				})
				.then(function(data){
					console.log(data);
					//사용자 데이터 담기
					self.userData = data;
					//프로필 사진 출력을 위한 path 만들기
					self.profileSrc = self.base_url + data.profile;
					//프로필 수정 페이지로 가는 링크
					self.update_profile_link = self.base_url + '/users/private/update_profile_form.do?profile=' + data.profile;
					
					//db 에서 가져온 사용자 데이터로 form 에 들어갈 model 의 값 초기화
					self.reset()
				});
				
				//ajax 로 DB 에서 비밀번호 질문 리스트 읽어오기
				ajaxPromise(base_url + "/ajax/users/pwd_question_list.do", "post")
				.then(function(response){
					return response.json();
				})
				.then(function(data){
					//data : pwd_question_list 가 들어있음
					self.pwd_question_list = data;
				});
			}
		});
	</script>
</body>
</html>