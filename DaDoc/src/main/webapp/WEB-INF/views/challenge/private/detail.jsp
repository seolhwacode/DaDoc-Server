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
										<img class="img-fluid scale-2 pr-5 pr-md-0 my-4" src="${pageContext.request.contextPath }${dto.imagePath}" alt="layout styles" />
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
										<strong data-to="30000" data-append="+">0</strong>
									</div>
								</div>
								<span> 명 입니다!</span>
							</h2>
							<h4 class="text-primary lead tall text-4">여러분의 도전을 DADOC이 응원합니다!</h4>
						</div>
					</div>
					<!-- 참가자 인증샷 출력부분 -->
					<div class="row text-center mt-5 pb-5 mb-5">
						<div class="owl-carousel owl-theme carousel-center-active-item mb-0" data-plugin-options="{'responsive': {'0': {'items': 1}, '476': {'items': 1}, '768': {'items': 5}, '992': {'items': 7}, '1200': {'items': 7}}, 'autoplay': true, 'autoplayTimeout': 3000, 'dots': false}">
							<c:forEach var="tmp" items="${photoList }">
								<div>
									<img class="img-fluid" src="${pageContext.request.contextPath }${tmp.imagePath}" alt="">
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
									<h2 class="font-weight-normal text-7 mb-0"> 0000명이 <strong>${sessionScope.id }</strong>님과 함께 도전하고 싶어합니다.
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
		
	

	
		
		<!-- 댓글 -->
		<div id="comments" class="post-block mt-5 post-comments">
											<h4 class="mb-3">Comments (3)</h4>
							
											<ul class="comments">
												<li>
													<div class="comment">
														<div class="img-thumbnail img-thumbnail-no-borders d-none d-sm-block">
															<img class="avatar" alt="" src="img/avatars/avatar-2.jpg">
														</div>
														<div class="comment-block">
															<div class="comment-arrow"></div>
															<span class="comment-by">
																<strong>John Doe</strong>
																<span class="float-right">
																	<span> <a href="#"><i class="fas fa-reply"></i> Reply</a></span>
																</span>
															</span>
															<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae, gravida pellentesque urna varius vitae. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim ornare nisi, vitae mattis nulla ante id dui.</p>
															<span class="date float-right">November 12, 2018 at 1:38 pm</span>
														</div>
													</div>
							
													<ul class="comments reply">
														<li>
															<div class="comment">
																<div class="img-thumbnail img-thumbnail-no-borders d-none d-sm-block">
																	<img class="avatar" alt="" src="img/avatars/avatar-3.jpg">
																</div>
																<div class="comment-block">
																	<div class="comment-arrow"></div>
																	<span class="comment-by">
																		<strong>John Doe</strong>
																		<span class="float-right">
																			<span> <a href="#"><i class="fas fa-reply"></i> Reply</a></span>
																		</span>
																	</span>
																	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae, gravida pellentesque urna varius vitae.</p>
																	<span class="date float-right">November 12, 2018 at 1:38 pm</span>
																</div>
															</div>
														</li>
														<li>
															<div class="comment">
																<div class="img-thumbnail img-thumbnail-no-borders d-none d-sm-block">
																	<img class="avatar" alt="" src="img/avatars/avatar-4.jpg">
																</div>
																<div class="comment-block">
																	<div class="comment-arrow"></div>
																	<span class="comment-by">
																		<strong>John Doe</strong>
																		<span class="float-right">
																			<span> <a href="#"><i class="fas fa-reply"></i> Reply</a></span>
																		</span>
																	</span>
																	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae, gravida pellentesque urna varius vitae.</p>
																	<span class="date float-right">November 12, 2018 at 1:38 pm</span>
																</div>
															</div>
														</li>
													</ul>
												</li>
												<li>
													<div class="comment">
														<div class="img-thumbnail img-thumbnail-no-borders d-none d-sm-block">
															<img class="avatar" alt="" src="img/avatars/avatar.jpg">
														</div>
														<div class="comment-block">
															<div class="comment-arrow"></div>
															<span class="comment-by">
																<strong>John Doe</strong>
																<span class="float-right">
																	<span> <a href="#"><i class="fas fa-reply"></i> Reply</a></span>
																</span>
															</span>
															<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
															<span class="date float-right">November 12, 2018 at 1:38 pm</span>
														</div>
													</div>
												</li>
												<li>
													<div class="comment">
														<div class="img-thumbnail img-thumbnail-no-borders d-none d-sm-block">
															<img class="avatar" alt="" src="img/avatars/avatar.jpg">
														</div>
														<div class="comment-block">
															<div class="comment-arrow"></div>
															<span class="comment-by">
																<strong>John Doe</strong>
																<span class="float-right">
																	<span> <a href="#"><i class="fas fa-reply"></i> Reply</a></span>
																</span>
															</span>
															<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
															<span class="date float-right">November 12, 2018 at 1:38 pm</span>
														</div>
													</div>
												</li>
											</ul>
							
										</div>
							
										<div class="post-block mt-5 post-leave-comment">
											<h4 class="mb-3">Leave a comment</h4>

										</div>
							
									</div>
								</article>
							
							</div>
						</div>
					</div>

				</div>

			</div>	
	

	

	<script
		src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script>

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

	</script>

</body>
</html>

