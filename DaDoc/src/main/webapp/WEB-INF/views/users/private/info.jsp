<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.do</title>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script> --%>

<!-- Vendor CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.min.css">

</head>
<body>
	<div id="usersInfo" class="container">
		<!-- 사용되는 기능들 리스트 -->
		<div>
			<ul>
				<li><a v-bind:href="update_profile_link">프로필 사진 변경</a></li>
				<li><a href="${pageContext.request.contextPath}/users/private/update_form.do">개인정보 수정</a></li>
				<li><a href="${pageContext.request.contextPath}/users/private/pwd_update_form.do">비밀번호 수정</a></li>
				<li><a href="">좋아요 표기한 책 모아보기</a></li>
				<li><a href="">작성한 댓글 모아보기</a></li>
				<li><a href="">참여 중인 챌린지</a></li>
				<li><a data-toggle="modal" data-target="#leaveModal" href="javascript:">탈퇴</a></li>
			</ul>
		</div>
		<!-- 메인에 출력할 개인정보 data -->
		<div>
			<ul>
				<li>
					1. 프로필 : 
					<a v-bind:href="update_profile_link">
						<img v-bind:src="profilePath" alt="프로필사진" />
					</a>
					{{profilePath}}
				</li>
				<li>2. 아이디 : {{userData.id}}</li>
				<li>3. 닉네임 : {{userData.nickname}}</li>
				<li>4. 이름 : {{userData.name}}</li>
				<li>5. 성별 : {{sex}}</li>
				<li>6. 생일 : {{userData.birth}}</li>
				<li>7. 전화번호 : {{userData.tel}}</li>
				<li>8. 이메일 : {{userData.email}}</li>
				<li>9. 가입일 : {{userData.regdate}}</li>
				<li>10. 비밀번호 찾기 질문 : {{pwd_question}}</li>
				<li>11. 비밀번호 찾기 답 : {{userData.pwd_answer}}</li>
				<li>12. 광고 수신 동의 : {{userData.tos == 0 ? '동의하지 않음' : '동의함'}}</li>
			</ul>
		</div>
		
		<!-- 탈퇴 모달 -->
		<!-- Modal -->
		<div class="modal fade" id="leaveModal" tabindex="-1" role="dialog" aria-labelledby="formModalLabel" aria-hidden="true">
		  	<div class="modal-dialog modal-md modal-dialog-centered">
		    	<div class="modal-content">
		      		<div class="modal-header">
		        		<h5 class="modal-title">탈퇴 확인</h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		      		</div>
		      		<div class="modal-body">
		        		<div>
		        			<div>
		        				<p>정말로 탈퇴하시겠습니까?</p>
		        				<p>탈퇴를 원하시면 아래 입력란에 <strong>탈퇴하기</strong>를 입력해주세요.</p>
		        			</div>
		        			<div>
		        				<input type="text" v-model="leaveCheckInput" />
		        			</div>
		        		</div>
		      		</div>
		      		<div class="modal-footer">
		        		<button @click="clearModalInput" type="button" 
		        				class="btn btn-secondary" data-dismiss="modal">
		        				취소
		        		</button>
		        		<button @click="clickLeave" type="button" 
		        				class="btn btn-primary" data-dismiss="modal">
		        				탈퇴
		        		</button>
		      		</div>
		    	</div>
		  	</div>
		</div>
	</div>
	
	<!-- Vendor -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.appear/jquery.appear.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.cookie/jquery.cookie.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/popper/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.validation/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.gmap/jquery.gmap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.lazyload/jquery.lazyload.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/isotope/jquery.isotope.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/vide/jquery.vide.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/vivus/vivus.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
				update_profile_link: '',
				
				//탈퇴 체크
				leaveCheckInput: '',
			},
			methods: {
				//모달의 내용 지우기
				clearModalInput(){
					this.leaveCheckInput = '';
				},
				//모달의 탈퇴 버튼 클릭
				clickLeave(e){
					//탈퇴하기를 제대로 입력 X
					if(this.leaveCheckInput !== '탈퇴하기'){
						//이벤트 막고
						e.preventDefault();
						//입력 틀림 알리기
						alert("입력이 틀렸습니다.");
						//모달 내용 지우기
						this.clearModalInput();
						//탈퇴 X
						return;
					}
					//탈퇴 진행
					location.href = this.base_url + "/users/private/leave.do";
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