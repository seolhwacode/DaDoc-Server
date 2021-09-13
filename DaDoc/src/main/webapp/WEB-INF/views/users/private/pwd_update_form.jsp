<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update_form.do</title>
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
	
	/* 왼쪽 form 적절하게 위치시키기 */
	.right-content .form-container{
		margin: auto;
	    max-width: 500px;
	    padding-top: 100px;
	    font-size: 1rem;
	    color: black;
	}
	
	/* 오른쪽 form - small 글씨 크기, 출력 display 위치 변경 */
	.right-content .form-container small {
		display: inline-block;
	    font-size: 0.9rem;
	}
	
	/* 오른쪽 form - input */
	.right-content .form-container .form-control{
		height: 40px;
	}
	
	/* 오른쪽 form - input : focus*/
	.right-content .form-container .form-control:focus{
	    border-width: 2px;
	}
	
	/* 버튼을 정렬 */
	.right-content .form-container .btn-container{
		display: flex;
		justify-content: center;
		margin-top: 20px;
	}
	
	/* 취소버튼 */
	.content-container .right-content .btn-container .cancel-btn{
		width: -webkit-fill-available;
		background-color: #c1c1c1;
	    color: black;
	    font-weight: bold;
	    font-size: 1.2rem;
	    margin-right: 5px;
	}
	
	/* 취소버튼 */
	.content-container .right-content .btn-container .cancel-btn:hover{
		background-color: #949494;
		color: black;
	}
	
	/* 수정 버튼 */
	.content-container .right-content .btn-container .update-btn{
		width: -webkit-fill-available;
	    background-color: #C24914;
	    color: #f9e0ae;
	    font-weight: bold;
	    font-size: 1.2rem;
	    margin-left: 5px;
	}
	
	/* 수정 버튼 */
	.content-container .right-content .btn-container .update-btn:hover{
		background-color: #8c3712;
	}
	
	
</style>
</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="pwdUpdate" name="thisPage"/>
	</jsp:include>
	
	<!-- 페이지 헤더 -->
	<section class="page-header page-header-modern page-header-md">
		<div class="container">
			<div class="row">
				<div class="col-md-12 align-self-center p-static order-2 text-center">
					<h1 class="text-dark font-weight-bold text-8 bold-family">Update Password</h1>
					<span class="sub-title text-dark">You with DADOC</span>
				</div>
				<div class="col-md-12 align-self-center order-1">
					<ul class="breadcrumb d-block text-center">
						<li><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/users/private/info.do">User Information</a></li>
						<li class="active">Update Password</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<div id="pwdUpdateFormContainer" class="container root-container">
		<div class="content-container">
			<div class="row">
				<jsp:include page="/include/users/users_template.jsp">
					<jsp:param value="pwdUpdate" name="myPage"/>
				</jsp:include>
				<!-- 오른쪽 실제 content -->
				<div class="col-md-9 right-content">
					<h1>비밀번호 변경</h1>
					<div class="form-container">
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
							<div class="btn-container">
								<button @click.prevent="goUsersInfo" class="btn cancel-btn">취소</button>
								<button @click="submitForm" class="btn update-btn">수정</button>
							</div>
						</form>
					</div>
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
					/* let result = confirm("수정사항을 취소하고, 나가시겠습니까?");
					if(result){
						//사용자 개인정보 페이지로 가기
						location.href = this.base_url + "/users/private/info.do";
					} */
					let self = this;
					swal({
						title: "수정사항을 취소하고, 나가시겠습니까?",
						text: "수정사항은 저장되지 않습니다.",
						icon: "warning",
					  	buttons: {
					  		no:{
					  			text: "취소",
					  			value: false
					  		},
					    	ok: {
					    		text: "확인",
					    		value: true
					    	}
					  	}
					})
					.then(function(value){
						//사용자 개인정보 페이지로 가기
						if(value){
							//확인 -> 페이지 이동함
							location.href = self.base_url + "/users/private/info.do";
						}
						//아니면 이동 X
					});
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
						//alert("입력값을 확인해주세요.");
						swal({
							title: "입력값을 확인해주세요.",
							icon: "warning",
						  	buttons: {
						    	ok: {
						    		text: "확인"
						    	}
						  	}
						});
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