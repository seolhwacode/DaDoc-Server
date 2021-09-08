<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">	

	<title>DETAIL</title>	

	<meta name="keywords" content="HTML5 Template" />
	<meta name="description" content="Porto - Responsive HTML5 Template">
	<meta name="author" content="okler.net">

	<!-- Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
	

	<!-- Mobile Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">

	<!-- Web Fonts  -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800%7CShadows+Into+Light" rel="stylesheet" type="text/css">

	<!-- Vendor CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/owl.carousel/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/owl.carousel/assets/owl.theme.default.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.min.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/theme.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/theme-elements.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/theme-blog.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/theme-shop.css">
	
	<!-- Demo CSS -->


	<!-- Skin CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/skins/default.css"> 

	<!-- Theme Custom CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css_porto/custom.css">

	<!-- Head Libs -->
	<script src="${pageContext.request.contextPath}/resources/vendor/modernizr/modernizr.min.js"></script>
	
	<!-- Vendor -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.appear/jquery.appear.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.cookie/jquery.cookie.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/popper/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/common/common.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.validation/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.gmap/jquery.gmap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery.lazyload/jquery.lazyload.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/isotope/jquery.isotope.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/vide/jquery.vide.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/vivus/vivus.min.js"></script>
	
	<!-- Theme Base, Components and Settings -->
	<script src="${pageContext.request.contextPath}/resources/js/theme.js"></script>
	
	<!-- Theme Custom -->
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	
	<!-- Theme Initialization Files -->
	<script src="${pageContext.request.contextPath}/resources/js/theme.init.js"></script>
	
	<style>
		#linkImg {
			width: 40px;
			height: 40px;
		}
		
		/*페이지 헤더 색상 조정*/
		.page-header {
			background-color: #F9E0AE !important;
		}
		
		/* 댓글에 댓글을 다는 폼과 수정폼은 일단 숨긴다. */
		 .form-hide{
			display: none;
		}
		
		/*댓글 더 보는 버튼 일단 숨기기 (댓글이 10개가 넘어가면 볼 수 있음)*/
		#moreBtn{
			display: none;
		}
	</style>


<body>
	<div role="main" class="main">
		<!-- 페이지 헤더 -->
		<section class="page-header page-header-modern page-header-md">
			<div class="container">
				<div class="row">
					<div class="col-md-12 align-self-center p-static order-2 text-center">
						<h1 class="text-dark font-weight-bold text-8 bold-family">${dto.title }</h1>
						<span class="sub-title text-dark">by ${dto.writer}</span>
					</div>
	
					<div class="col-md-12 align-self-center order-1">
	
						<ul class="breadcrumb d-block text-center">
							<li><a href="${pageContext.request.contextPath}/challenge/main.do">Challenge</a></li>
							<li class="active">detail</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<!-- 페이지 메인 -->
	<section class="section bg-color-grey section-height-3 border-0 mt-5 mb-0">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="row align-items-center pt-4 appear-animation" data-appear-animation="fadeInLeftShorter">
						<div class="col-md-4 mb-4 mb-md-0">
							<img class="img-fluid scale-2 pr-5 pr-md-0 my-4" src="${pageContext.request.contextPath }${dto.image}" alt="layout styles" />
						</div>
						<div class="col-md-8 pl-md-5">
							<h2 class="font-weight-normal text-6 mb-3"><strong class="font-weight-extra-bold">${dto.writer } 님의 </strong> ${dto.title }</h2>
							<p class="text-4">${dto.description }</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur imperdiet hendrerit volutpat. Sed in nunc nec ligula consectetur mollis in vel justo. Vestibulum ante ipsum primis in faucibus orci.</p>
							<a><i class="icon-camera icons"></i><span class="name"> 인증 ${dto.period} 회 </span></a>
							<br />
							<span><i class="far fa-folder"></i> ${dto.type } > ${dto.category }</span> 
							<br />
							<span><i class="icon-calendar icons" > ${dto.startDate } ~ ${dto.endDate}</i></span>
						</div>
					</div>
					<c:if test="${dto.writer eq id }">
						<!-- 수정 -->
						<a href="update_form.do?num=${dto.num }"><i class="icon-pencil icons"></i><span class="name">수정</span></a>
						<!-- 삭제 -->
						<a href="javascript:deleteChallenge();"><i class="icon-trash icons"></i><span class="name">삭제</span></a>
					</c:if>
					
					<!-- 구분선 -->
					<hr class="solid my-5">
				
					<!-- 공유하기 칸 -->
					<div class="post-block mt-5 post-share">
						<!-- 공유 api -->
						<a class="icon" id="btnFacebook" href="javascript:shareFacebook();"><img
							src="${pageContext.request.contextPath}/resources/images/icon-facebook.png" /></a>
						<a class="icon" id="btnTwitter" href="javascript:shareTwitter();"><img
							src="${pageContext.request.contextPath}/resources/images/icon-twitter.png" /></a>
						<a class="icon" id="btnKakao" href="javascript:shareKakao();"><img
							src="${pageContext.request.contextPath}/resources/images/icon-kakao.png" /></a>
						<a class="icon" id="btnLink" href="javascript:shareLink();"><img id="linkImg"
							src="${pageContext.request.contextPath}/resources/images/icon-link.png" /></a>
					</div>
				</div>
			</div>
		</div>
	</section>			
				
	<!-- 구분 선 -->
	<hr class="solid my-5">
		
	<!-- 몇명이 참여했는지 출력하는 부분 -->
	<div class="container pt-4">
		<div class="row text-center pt-4 mt-5">
			<div class="col">
				<h2 class="font-weight-bold text-8 mb-2">
					<span>지금까지 ${dto.title}에 참여한 다독인의 수는 </span>
					<div class="row counters counters-text-dark">
						<div class="counter">
							<strong data-to="${challengers }" data-append="+">0</strong>
						</div>
					</div>
					<span> ${challengers }명 입니다!</span>
				</h2>
				<h4 class="text-primary lead tall text-4">여러분의 도전을 DADOC이 응원합니다!</h4>
			</div>
		</div>
		<!-- 참가자 인증샷 출력부분 -->
		<div class="row text-center mt-5 pb-5 mb-5">
			<div class="owl-carousel owl-theme carousel-center-active-item mb-0" data-plugin-options="{'responsive': {'0': {'items': 1}, '476': {'items': 1}, '768': {'items': 5}, '992': {'items': 7}, '1200': {'items': 7}}, 'autoplay': true, 'autoplayTimeout': 3000, 'dots': false}">
				<c:forEach var="tmp" items="${photoList }">
					<div>
						<img class="img-fluid" src="${pageContext.request.contextPath }${tmp.image}" alt="">
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- 구분 선 -->
	<hr class="solid my-5">
		
	<!-- 챌린지 참여 버튼 -->
	<section class="call-to-action call-to-action-strong-grey content-align-center call-to-action-in-footer">
		<div class="container py-5">
			<div class="row py-3">
				<div class="col-md-9 col-lg-9">
					<div class="call-to-action-content">
						<h2 class="font-weight-normal text-7 mb-0"> ${challengers }명이 <strong>${sessionScope.id }</strong>님과 함께 도전하고 싶어합니다.
						<p class="mb-0">챌린지 신청을 해 더 멋진 다독인이 되어보세요.</p>
					</div>
				</div>
				<div class="col-md-3 col-lg-3">
					<!-- Button trigger modal -->
					<button class="btn btn-modern btn-primary" data-toggle="modal" data-target="#defaultModal">
							챌린지 신청하기
					</button>
				</div>
			</div>
		</div>
		<!-- 챌린지 신청 모달 -->
		<div class="modal fade" id="defaultModal" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="defaultModalLabel">Default Modal Title</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pellentesque neque eget diam posuere porta. Quisque ut nulla at nunc <a href="#">vehicula</a> lacinia. Proin adipiscing porta tellus, ut feugiat nibh adipiscing sit amet. In eu justo a felis faucibus ornare vel id metus. Vestibulum ante ipsum primis in faucibus.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pellentesque neque eget diam posuere porta. Quisque ut nulla at nunc <a href="#">vehicula</a> lacinia. Proin adipiscing porta tellus, ut feugiat nibh adipiscing sit amet. In eu justo a felis faucibus ornare vel id metus. Vestibulum ante ipsum primis in faucibus.</p>
						<div class="btn-group-toggle" data-toggle="buttons">
					  	<label class="btn btn-primary mb-2">
					    	<input type="checkbox" checked autocomplete="off"> 모두 동의합니다.
					  	</label>
					  	</div>
					</div>
					<div class="modal-footer">
						<form action="${pageContext.request.contextPath}/challenge/insertChallenger.do" method="post">
							<input type="hidden" name="id" id="id" value="${sessionScope.id }" />
							<input type="hidden" name="challengeTitle" id="challengeTitle" value="${dto.title}" /> 
							<input type="hidden" name="period" id="period" value="${dto.period}" />
							<button type="submit" class="btn btn-warning">신청하기</button>
							<button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
			
	<!-- 댓글  목록-->
	<div id="comments" class="post-block mt-5 post-comments comments">
		<!-- 댓글 개수 및 구분선 -->
		<h4 class="mb-3">comments(33)</h4>
		<!-- 댓글 목록 -->
		<ul class="comments-list">
			<c:forEach var="tmp" items="${commentList }">
				<c:choose>
					<c:when test="${tmp.deleted eq 'yes' }">
						<li>삭제된 댓글입니다.</li>
					</c:when>
					<c:otherwise>
						<c:if test="${tmp.num eq tmp.comment_group }">
							<li id="reli${tmp.num }">
								<div class="comment">
									<div class="img-thumbnail img-thumbnail-no-borders d-none d-sm-block">
										<c:if test="${empty tmp.profile }">
										<img class="avatar" alt="" src="img/avatars/avatar-2.jpg">
										</c:if>
										<c:if test="${not empty tmp.profile }">
											<img class="profile-image" src="${pageContext.request.contextPath}${tmp.profile }"/>
										</c:if>
									</div>
								<div class="comment-block">
									<div class="comment-arrow"></div>
									<span class="comment-by">
										<strong>${tmp.writer }</strong>
											<c:if test="${tmp.num ne tmp.comment_group }">
												@<i>${tmp.target_id }</i>
											</c:if>
										<span class="float-right">
											<span> <a data-num="${tmp.num }" href="javascript:" class="reply-link"><i class="fas fa-reply" id="reply-icon">Reply</i></a></span>
											<c:if test="${tmp.writer eq id }">
											<i class="icon-pencil icons edit-icons"><a data-num="${tmp.num }" class="update-link" href="javascript:">Edit</a></i> 
											<i class="icon-trash icons"><a data-num="${tmp.num }" class="delete-link" href="javascript:">Delete</a></i>
											</c:if>
										</span>
									</span>
										<p id="pre${tmp.num }">${tmp.content }</p>
										<span class="date float-right">${tmp.regdate }</span>
								</div>
								</div>
							</li>												
						</c:if>
					
						<!-- 대댓글 -->
						<c:if test="${tmp.num ne tmp.comment_group }">
							<li id="reli${tmp.num }">
								<div class="comment">
									<div class="img-thumbnail img-thumbnail-no-borders d-none d-sm-block">
										<c:if test="${empty tmp.profile }">
											<img class="avatar" alt="" src="img/avatars/avatar-2.jpg">
										</c:if>
										<c:if test="${not empty tmp.profile }">
											<img class="profile-image" src="${pageContext.request.contextPath}${tmp.profile }"/>
										</c:if>								
									</div>
									<div class="comment-block">
										<div class="comment-arrow"></div>
										<span class="comment-by">
											<strong>${tmp.writer }</strong>
											<c:if test="${tmp.num ne tmp.comment_group }">
												@<i>${tmp.target_id }</i>
											</c:if>
											<span class="float-right">
											<span><i class="fas fa-reply"><a data-num="${tmp.num }" href="javascript:" class="reply-link">Reply</a></i></span>
											<c:if test="${tmp.writer eq id }">
												<i class="icon-pencil icons"><a data-num="${tmp.num }" class="update-link" href="javascript:">Edit</a></i> 
												<i class="icon-trash icons"><a data-num="${tmp.num }" class="delete-link" href="javascript:">Delete</a></i>
											</c:if>
										</span>
										<p id="pre${tmp.num }">${tmp.content }</p>
										<span class="date float-right">${tmp.regdate }</span>
									</div>
								</div>
							</li>
						</c:if>
				
						<!-- 답 댓글 폼 -->
						<form id="reForm${tmp.num }" class="re-insert-form comment-form form-hide" action="comment_insert.do" method="post">
							<input type="hidden" name="title" value="${dto.title }" />
							<input type="hidden" name="ref_group" value="${dto.num }"/>
							<input type="hidden" name="target_id" value="${tmp.writer }"/>
							<input type="hidden" name="comment_group" value="${tmp.comment_group }"/>
							<textarea name="content"></textarea>
							<button type="submit">등록</button>
						</form>
						
						<!-- 수정 폼 -->
						<c:if test="${tmp.writer eq id }">
						<form id="updateForm${tmp.num }" class="update-form comment-form form-hide" action="comment_update.do" method="post">
							<input type="hidden" name="num" value="${tmp.num }" />
							<textarea name="content">${tmp.content }</textarea>
							<button type="submit">수정</button>
						</form>
						</c:if>
						
					</c:otherwise>
				</c:choose>	
			</c:forEach>
		</ul>
	</div>
	
	<div class="comment-more">
		<button href="javascript:" type="button" id="moreBtn" class="btn btn-outline btn-rounded btn-quaternary mb-2">더보기</button>
	</div>
	
	<!-- comment 작성 창 -->
		<div class="post-block mt-5 post-leave-comment">
			<h4 class="mb-3">Leave a comment</h4>
				<!-- 원글에 댓글을 작성할 폼 -->
				<form class="comment-form insert-form" action="comment_insert.do" method="post">
					<!-- 원글의 글번호가 댓글의 ref_group 번호가 된다. -->
					<input type="hidden" name="ref_group" value="${dto.num }"/>
					<!--  원글의 title도 보내준다. -->
					<input type="hidden" name="title" value="${dto.title }" />
					<!-- 원글의 작성자가 댓글의 대상자가 된다. -->
					<input type="hidden" name="target_id" value="${dto.writer }"/>		
					<input type="text" name="content" id="content" />											
					<button type="submit">등록</button>
				</form>
		</div>
							

	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script>
	
	//[댓글 페이지네이션]
	//댓글의 현재 페이지 번호를 관리할 변수를 만들고 초기값 1 대입하기
	let currentPage=1;
	//마지막 페이지는 totalPageCount다.
	let lastPage=${totalPageCount};
	//moreBtn의 참조값을 담아준다.
	const moreBtn = document.querySelector("#moreBtn");
	//전체 댓글 개수가 출력할 댓글의 수보다 많으면 더보기 버튼을 보이게 한다.
	if(${totalRow} >= ${pageRowCount}){
		moreBtn.style.display='block';
	}
	//더보기 버튼을 누르면
	moreBtn.addEventListener("click",function(){
		//현재 댓글 페이지를 1 증가 시키고
		currentPage++;
		//현재 페이지가 마지막 페이지보다 작거나 같을 때 댓글 페이지 출력하기
		if(currentPage <= lastPage){
			/*
			해당 페이지의 내용을 ajax 요청을 통해서 받아온다.
			"pageNum=xxx&num=xxx" 형식으로 GET 방식 파라미터를 전달한다. 
			*/
			ajaxPromise("ajax_comment_list.do", "post", "pageNum="+currentPage+"&num=${dto.num}")
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				//data 에는 html text 가 들어있다.
				document.querySelector(".comments ul")
				.insertAdjacentHTML("beforeend", data);
				
				//새로 추가된 댓글 li 요소 안에 있는 a 요소를 찾아서 이벤트 리스너 등록 하기 
				addUpdateListener(".page-"+currentPage+" .update-link");
				addDeleteListener(".page-"+currentPage+" .delete-link");
				addReplyListener(".page-"+currentPage+" .reply-link");
				//새로 추가된 댓글 li 요소 안에 있는 댓글 수정폼에 이벤트 리스너 등록하기
				addUpdateFormListener(".page-"+currentPage+" .update-form");
			});
			
			if(currentPage == lastPage){
				moreBtn.style.display="none";
			}
		}
	});
	
	
	
	
	//detail.jsp 페이지 로딩 시점에 만들어진 1 페이지에 해당하는 댓글에 이벤트 리스너 등록하기
	
	addUpdateFormListener(".update-form");
	addUpdateListener(".update-link");
	addDeleteListener(".delete-link");
	addReplyListener(".reply-link");
	
	//챌린지 삭제
	function deleteChallenge(){
		let isDelete = confirm("챌린지를 삭제하시겠습니까?");
		if(isDelete){
			location.href="delete.do?num=${dto.num}";
		}
	}
	
	//트위터 공유 기능
	function shareTwitter() {
	    let sendText = "${dto.title}"; // 전달할 텍스트
	    let sendUrl ='http://localhost:8888/dadoc/challenge/detail.do?num=${dto.num}&title=${dto.title}'; // 전달할 URL
	    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}
	
	//페이스북 공유 기능
	function shareFacebook() {
	    let sendUrl ='http://localhost:8888/dadoc/challenge/detail.do?num=${dto.num}&title=${dto.title}'; // 전달할 URL
	    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
	}
	
	//카카오톡 공유 기능
	function shareKakao() {
		
		//사용할 앱의 Javascript 키 설정
		Kakao.init('bf9f19162b3842dc04a97ab5fff88c41');
		
		//카카오링크 버튼 생성
		Kakao.Link.createDefaultButton({
			container: '#btnKakao',
			objectType: 'feed',
			content: {
				title: '${dto.title}',
				description: '${dto.description}',
				imageUrl: 'https://postfiles.pstatic.net/MjAyMTA4MzFfODYg/MDAxNjMwNDE0MzcxOTEy.gZKTe2cymjpZcXqxQ9hvCJ14cCggHrX97NjTO-lDJCMg.cYbqOibC4HCqCOFmQyqa774j3dQLyTwm2hddSI4_RhQg.PNG.jhe2525/DADOC.png?type=w773',
				link:{
					mobileWebUrl: 'http://localhost:8888/dadoc/challenge/detail.do?num=${dto.num}&title=${dto.title}',
					webUrl: 'http://localhost:8888/dadoc/challenge/detail.do?num=${dto.num}&title=${dto.title}'
				}
			}
		});
	}
	
	//url 복사 기능
	function shareLink(){
		let url = window.document.location.href;
		let dummy = document.createElement("textarea");
		document.body.appendChild(dummy);
		dummy.value=url;
		dummy.select();
		document.execCommand("copy");
		document.body.removeChild(dummy);
		alert("복사 되었습니다.");
	}

	
	
	//[인자로 전달되는 선택자를 이용해서 이벤트 리스너를 등록하는 함수들]
	
	//댓글 수정 폼 열기
	function addUpdateListener(sel){
		//댓글 수정 링크의 참조값을 배열에 담아오기
		//sel은 '.page-xxx .update-link' 형식의 내용이다.
		let updateLinks=document.querySelectorAll(sel);
		for(let i=0; i<updateLinks.length; i++){
			updateLinks[i].addEventListener("click", function(){
				//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value값을 읽어온다.
				const num = this.getAttribute("data-num"); //댓글의 글 번호
				const form = document.querySelector("#updateForm"+num);
				let current = this.innerText;
				if(current=='Edit'){
					form.style.display='block';
					this.innerText='Cancel';
				}else if(current=='Cancel'){
					this.innerText='Edit';
					form.style.display='none';
				}
				
			});
		}
	}
	
	//댓글 수정하기
	function addUpdateFormListener(sel){
		//댓글 수정 폼의 참조값을 배열에 담아오기
		let updateForms=document.querySelectorAll(sel);
		for(let i=0; i<updateForms.length; i++){
			//폼에 submit 이벤트가 일어났을 때 호출되는 함수 등록
			updateForms[i].addEventListener("submit", function(e){
				//submit이벤트가 일어난 form의 참조값을 form이라는 변수에 담기
				const form=this;
				//폼 제출을 막는다.
				e.preventDefault();
				//이벤트가 일어난 폼을 ajax 전송하도록 한다.
				ajaxFormPromise(form)
				.then(function(response){
					return response.json();
				})
				.then(function(data){
					if(data.isSuccess){
						const num=form.querySelector("input[name=num]").value;
						const content=form.querySelector("textarea[name=content]").value;
						//수정폼에 입력한 value 값을 pre 요소에도 출력하기
						document.querySelector("#pre"+num).innerText=content;
						form.style.display="none";
					}
				});
			});
		}
	}
	
	//댓글 삭제
	function addDeleteListener(sel){
		//댓글 삭제 링크의 참조값을 배열에 담아오기
		let deleteLinks=document.querySelectorAll(sel);
		for(let i=0; i<deleteLinks.length; i++){
			deleteLinks[i].addEventListener("click", function(){
				//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다.
				const num = this.getAttribute("data-num"); //댓글의 글 번호
				const isDelete=confirm("댓글을 삭제하시겠습니까?");
				if(isDelete){
					//gura_util.js에 있는 함수를 이용해서 ajax요청
					ajaxPromise("comment_delete.do", "post", "num="+num)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						//만일 삭제 성공이면
						if(data.isSuccess){
							//댓글이 있는 곳에 삭제된 댓글입니다를 출력해준다.
							document.querySelector("#reli"+num).innerText='삭제된 댓글입니다.';
						}
					});
				}
			});
		}
	}
	
	//답댓글 폼 열기
	function addReplyListener(sel){
		let replyLinks=document.querySelectorAll(sel);
		//반복문 돌면서 모든 링크에 이벤트 리스너 함수 등록
		for(let i=0; i<replyLinks.length; i++){
			replyLinks[i].addEventListener("click", function(){
				const num=this.getAttribute("data-num");
				const form = document.querySelector("#reForm"+num);
				let current = this.innerText;
				if(current=='Reply'){
					form.style.display='block';
					this.innerText='Cancel';
				}else if(current=='Cancel'){
					this.innerText='Reply';
					form.style.display='none';
				}
			});
		}
	}


</script>

</body>
</html>

