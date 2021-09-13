<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- navbar -->
<div class="nav-header">
 	<div class="left">
		<h2 class="word-rotator clip">
 			<span class="word-rotator-words">
				<b class="is-visible">내가 찾을 수 있는 책은</b>
				<b>읽고 싶은 책, 읽었던 책</b>
				<b>혼자서는 어려웠던 책 읽기,</b>
				<b>여기서</b>
			</span>
		</h2>
	</div>
	<div class="cen">
		<b class="da">'DA'</b>
	</div>
	<div class="right">
		<h2 class="word-rotator clip">
			<span class="word-rotator-words">
				<b class="is-visible">있다!</b>
				<b>같이 나눠봐요!</b>
				<b>함께 도전해봐요!</b>
				<b>할 수 있어요, <span>다독</span></b>
			</span>
		</h2>
	</div>
</div>
<!-- navbar -->
<div>
	<div id="navbar">
		<a class="nav-item ${ param.thisPage eq 'home' ? 'active' : '' }" href="${pageContext.request.contextPath}/">홈</a>
		<a class="nav-item ${ param.thisPage eq 'challenge' ? 'active' : '' }" href="${pageContext.request.contextPath}/challenge/main.do">챌린지</a>
	  	<a class="nav-item ${ param.thisPage eq 'notice' ? 'active' : '' }" href="${pageContext.request.contextPath}/notice/list.do">공지</a>
	  	<a class="nav-item ${ param.thisPage eq 'booksearch' ? 'active' : '' }" href="${pageContext.request.contextPath}/booksearch/search_list.do">도서 검색</a>
	  	<c:choose>
			<c:when test="${ empty sessionScope.id }">
				<a class="nav-users nav-item ${ param.thisPage eq 'login' ? 'active' : '' }" href="${pageContext.request.contextPath}/users/login_form.do?url=${ empty param.url ? '' : param.url }">로그인</a>
				<a class="nav-users nav-item ${ param.thisPage eq 'signup' ? 'active' : '' }" href="${pageContext.request.contextPath}/users/signup_tos.do">회원가입</a>
			</c:when>
			<c:otherwise>
				<a class="nav-users nav-item" href="${pageContext.request.contextPath}/users/private/logout.do">로그아웃</a>				
				<a class="nav-users nav-item ${ param.thisPage eq 'userInfo' ? 'active' : '' }" href="${pageContext.request.contextPath}/users/private/info.do">개인 페이지</a>
				<a href="${pageContext.request.contextPath}/users/private/info.do">
					<img class="nav-users nav-profile" src="${pageContext.request.contextPath}${ userProfile }" alt="" />
				</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>