<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.do</title>
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
	
	/* 오른쪽 내부 - 리스트 출력 - 색 변경 */
	.list.list-ordened.list-ordened-style-3 li:before{
		background-color: #682c0e;
		height: 26px;
	}
	
	/* 오른쪽 내부 - 리스트 출력 - ol 왼쪽 패딩 줄이기 */
	.right-content .list{
		padding-left: 20px;
	}
	
	/* 오른쪽 내부 - 리스트 출력 - li 왼쪽 패딩추가, 글씨크기 키우기, 아래 margin 늘리기 */
	.list.list-ordened.list-ordened-style-2 li, .list.list-ordened.list-ordened-style-3 li {
	    padding-left: 40px;
    	font-size: 1rem;
    	margin-bottom: 20px;
	}
	
	/* 오른쪽 내부 - 리스트 - li 에서 개인정보 출력하는 span 부분 강조 */
	.right-content .list li span{
	    /* font-size: 1.2rem; */
	    font-weight: 600;
	    color: #682c0e;
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
				<div
					class="col-md-12 align-self-center p-static order-2 text-center">

					<h1 class="text-dark font-weight-bold text-8 bold-family">User Information</h1>
					<span class="sub-title text-dark">You with DADOC</span>
				</div>

				<div class="col-md-12 align-self-center order-1">

					<ul class="breadcrumb d-block text-center">
						<li><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li class="active">User Information</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<!-- main content -->
	<div id="usersInfo" class="container root-container">
		<div class="content-container">
			<div class="row">
				<jsp:include page="/include/users/users_template.jsp">
					<jsp:param value="info" name="myPage"/>
				</jsp:include>
				<!-- 오른쪽 실제 content -->
				<div class="col-md-9 right-content">
					<!-- 메인에 출력할 개인정보 data -->
					<h1>내 정보</h1>
					<ol class="list list-ordened list-ordened-style-3">
						<li>아이디  :  <span>{{userData.id}}</span></li>
						<li>닉네임  :  <span>{{userData.nickname}}</span></li>
						<li>이름  :  <span>{{userData.name}}</span></li>
						<li>성별  :  <span>{{sex}}</span></li>
						<li>생일  :  <span>{{userData.birth}}</span></li>
						<li>전화번호  :  <span>{{userData.tel}}</span></li>
						<li>이메일  :  <span>{{userData.email}}</span></li>
						<li>가입일  :  <span>{{userData.regdate}}</span></li>
						<li>비밀번호 찾기 질문  :  <span>{{pwd_question}}</span></li>
						<li>비밀번호 찾기 답  :  <span>{{userData.pwd_answer}}</span></li>
						<li>광고 수신 동의  :  <span>{{userData.tos == 0 ? '동의하지 않음' : '동의함'}}</span></li>
					</ol>
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
		
		let usersInfo = new Vue({
			el: "#usersInfo",
			data: {
				//개인정보 data : UsersDto 의 데이터를 josn 으로 받아서 넣기
				base_url,
				id: '${ sessionScope.id }',
				userData: {},
				profilePath: '',
				pwd_question: '',
				sex: '',
				update_profile_link: ''
			},
			methods: {
				
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
					self.userData = data;
					//프로필 사진 출력을 위한 path 만들기
					self.profilePath = self.base_url + data.profile;
					//출력을 위한 성별 구분하여 string 넣기
					if(data.sex == 0){
						self.sex = '남성';
					}else if(data.sex == 1){
						self.sex = '여성';
					}else{
						self.sex = '그 외';
					}
					//
					self.update_profile_link = '${pageContext.request.contextPath}/users/private/update_profile_form.do?profile=' + data.profile;
				});
				
				//pwd_question table 에서 해당 번호에 맞는 질문 가져오기
				fetch(this.base_url + "/ajax/users/get_question.do?id=" + this.id)
				.then(function(response){
					return response.json();
				})
				.then(function(data){
					console.log(data);
					self.pwd_question = data.question;
				});
			}
		});
	</script>
</body>
</html>