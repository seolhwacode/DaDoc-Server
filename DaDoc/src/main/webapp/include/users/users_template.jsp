<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 왼쪽의 slider & 프로필 사진 -->
<div class="col-md-3 mt-4 mt-md-0 left-content">
	<div class="d-flex justify-content-center mb-4">
		<a href="${pageContext.request.contextPath}/users/private/update_profile_form.do?profile=${ userProfile }">
			<div class="profile-image-outer-container">
				<!-- *수정 : background 색 변경 -->
				<div class="profile-image-inner-container">
					<!-- *수정 : 크기 400 X 400 고정으로 수정 -->
					<img src="${pageContext.request.contextPath}${ userProfile }" alt="프로필사진">
					<span class="profile-image-button bg-color-dark">
						<i class="fas fa-camera text-light"></i>
					</span>
				</div>
			</div>
		</a>
	</div>
	<!-- 개인정보 메뉴 -->
	<aside class="sidebar mt-2" id="sidebar">
		<ul class="nav nav-list flex-column mb-5">
			<li class="nav-item"><a class="nav-link ${ param.myPage eq 'info' ? 'text-dark active' : '' }" href="${pageContext.request.contextPath}/users/private/info.do">내 정보</a></li>
			<li class="nav-item"><a class="nav-link ${ param.myPage eq 'profileUpdate' ? 'text-dark active' : '' }" href="${pageContext.request.contextPath}/users/private/update_profile_form.do?profile=${ userProfile }">프로필 사진 변경</a></li>
			<li class="nav-item"><a class="nav-link ${ param.myPage eq 'update' ? 'text-dark active' : '' }" href="${pageContext.request.contextPath}/users/private/update_form.do">개인정보 수정</a></li>
			<li class="nav-item"><a class="nav-link ${ param.myPage eq 'pwdUpdate' ? 'text-dark active' : '' }" href="${pageContext.request.contextPath}/users/private/pwd_update_form.do">비밀번호 수정</a></li>
			<li class="nav-item"><a class="nav-link ${ param.myPage eq 'myChallenge' ? 'text-dark active' : '' }" href="${pageContext.request.contextPath}/challenge/private/my_challenge.do">나의 챌린지</a></li>
			<li class="nav-item"><a class="nav-link ${ param.myPage eq '' ? 'text-dark active' : '' }" href="#">좋아하는 책</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="modal" data-target="#leaveModal" href="javascript:">탈퇴</a></li>
		</ul>
	</aside>
</div>