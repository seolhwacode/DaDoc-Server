<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.do</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
</head>
<body>
	<div id="usersInfo" class="container">
		<!-- 사용되는 기능들 리스트 -->
		<div>
			<ul>
				<li><a v-bind:href="update_profile_link">프로필 사진 변경</a></li>
				<li><a href="${pageContext.request.contextPath}/users/private/update_form.do">개인정보 수정</a></li>
				<li><a href="">비밀번호 수정</a></li>
				<li><a href="">좋아요 표기한 책 모아보기</a></li>
				<li><a href="">작성한 게시글 모아보기</a></li>
				<li><a href="">작성한 댓글 모아보기</a></li>
				<li><a href="">좋아요 누른 게시글 모아보기</a></li>
				<li><a href="">태그 즐겨찾기</a></li>
				<li><a href="">참여 중인 챌린지</a></li>
				<li><a href="">좋아요 누른 챌린지</a></li>
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
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
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