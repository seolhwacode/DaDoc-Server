<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.do</title>
<jsp:include page="/include/resources_head.jsp"></jsp:include>
</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="home" name="thisPage"/>
	</jsp:include>
	<!-- 메인 -->
		<div role="main" class="main">
				<div class="slider-container rev_slider_wrapper" style="height: 750px;">
					<div id="revolutionSlider" class="slider rev_slider" data-version="5.4.8" data-plugin-revolution-slider data-plugin-options="{'delay': 9000, 'gridwidth': 1110, 'gridheight': [750,750,750,1250], 'responsiveLevels': [4096,1200,992,500]}">
						<ul>
							<li class="slide-overlay slide-overlay-level-7" data-transition="fade">

								<img src="${pageContext.request.contextPath}/resources/images/dadoc_main.jpg"  
									alt=""
									data-bgposition="center center" 
									data-bgfit="cover" 
									data-bgrepeat="no-repeat" 
									data-kenburns="on"
									data-duration="9000"
									data-ease="Linear.easeNone"
									data-scalestart="115"
									data-scaleend="100"
									data-rotatestart="0"
									data-rotateend="0"
									data-offsetstart="0 -200"
									data-offsetend="0 200"
									data-bgparallax="0"
									class="rev-slidebg">

								<div class="tp-caption tp-caption-overlay-opacity top-label font-weight-semibold"
									data-frames='[{"delay":1000,"speed":1000,"sfxcolor":"#212529","sfx_effect":"blockfromleft","frame":"0","from":"z:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":500,"sfxcolor":"#212529","sfx_effect":"blocktoleft","frame":"999","to":"z:0;","ease":"Power4.easeOut"}]'
									data-x="left" data-hoffset="['0','30','30','30']"
									data-y="center" data-voffset="['-65','-65','-69','-73']"
									data-fontsize="['18','18','18','30']"
									data-paddingtop="['10','10','10','12']"
									data-paddingbottom="['10','10','10','12']"
									data-paddingleft="['18','18','18','18']"
									data-paddingright="['18','18','18','18']">WE WORK AND WE MAKE</div>

								<h1 class="tp-caption tp-caption-overlay-opacity main-label"
									data-frames='[{"delay":1300,"speed":1000,"sfxcolor":"#212529","sfx_effect":"blockfromleft","frame":"0","from":"z:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":500,"sfxcolor":"#212529","sfx_effect":"blocktoleft","frame":"999","to":"z:0;","ease":"Power4.easeOut"}]'
									data-x="left" data-hoffset="['0','30','30','30']"
									data-y="center"
									data-fontsize="['50','50','50','60']"
									data-letterspacing="0"
									data-paddingtop="['10','10','10','10']"
									data-paddingbottom="['10','10','10','10']"
									data-paddingleft="['18','18','18','18']"
									data-paddingright="['18','18','18','18']">DADOC</h1>

								<div class="tp-caption d-none d-md-block"
									data-frames='[{"delay":3000,"speed":500,"frame":"0","from":"opacity:0;x:10%;","to":"opacity:1;x:0;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;fb:0;","ease":"Power3.easeInOut"}]'
									data-x="left" data-hoffset="['330','360','360','135']"
									data-y="center" data-voffset="['30','30','30','-62']"><img src="img/slides/slide-white-line.png" alt=""></div>


								<div class="tp-caption font-weight-light text-color-light ws-normal"
									data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":2000,"split":"chars","splitdelay":0.05,"ease":"Power2.easeInOut"},{"delay":"wait","speed":1000,"to":"y:[100%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
									data-x="left" data-hoffset="['3','35','35','35']"
									data-y="center" data-voffset="['65','65','65','95']"
									data-width="['690','690','690','800']"
									data-fontsize="['18','18','18','35']"
									data-lineheight="['29','29','29','40']">Many people, myself among them, feel better at the mere sight of a book.</div>


								<a class="tp-caption btn btn-outline btn-primary font-weight-bold"
									href="${pageContext.request.contextPath}/booksearch/search_list.do"
									data-frames='[{"delay":3000,"speed":2000,"frame":"0","from":"y:50%;opacity:0;","to":"y:0;o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;fb:0;","ease":"Power3.easeInOut"}]'
									data-x="left" data-hoffset="['0','30','30','30']"
									data-y="center" data-voffset="['140','140','140','245']"
									data-paddingtop="['15','15','15','30']"
									data-paddingbottom="['15','15','15','30']"
									data-paddingleft="['40','40','40','50']"
									data-paddingright="['40','40','40','50']"
									data-fontsize="['13','13','13','25']"
									data-lineheight="['20','20','20','25']">SEARCH</a>

								<c:if test="${ empty id }">
									<a class="tp-caption btn btn-primary font-weight-bold"
										href="${pageContext.request.contextPath}/users/signup_tos.do"
										data-frames='[{"delay":3000,"speed":2000,"frame":"0","from":"y:50%;opacity:0;","to":"y:0;o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;fb:0;","ease":"Power3.easeInOut"}]'
										data-x="left" data-hoffset="['185','185','220','340']"
										data-y="center" data-voffset="['140','140','140','245']"
										data-paddingtop="['16','16','16','31']"
										data-paddingbottom="['16','16','16','31']"
										data-paddingleft="['40','40','40','50']"
										data-paddingright="['40','40','40','50']"
										data-fontsize="['13','13','13','25']"
										data-lineheight="['20','20','20','25']">GET STARTED NOW <i class="fas fa-arrow-right ml-1"></i></a>
								</c:if>
							</li>
							<li class="slide-overlay slide-overlay-level-7" data-transition="fade">
								<img src="${pageContext.request.contextPath}/resources/images/dadoc_main2.jpg"  
									alt=""
									data-bgposition="center center" 
									data-bgfit="cover" 
									data-bgrepeat="no-repeat" 
									data-kenburns="on"
									data-duration="9000"
									data-ease="Linear.easeNone"
									data-scalestart="115"
									data-scaleend="100"
									data-rotatestart="0"
									data-rotateend="0"
									data-offsetstart="0 400px"
									data-offsetend="0 -400px"
									data-bgparallax="0"
									class="rev-slidebg">

								<div class="tp-caption tp-caption-overlay-opacity top-label font-weight-semibold"
									data-frames='[{"delay":1000,"speed":1000,"sfxcolor":"#212529","sfx_effect":"blockfromleft","frame":"0","from":"z:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":500,"sfxcolor":"#212529","sfx_effect":"blocktoleft","frame":"999","to":"z:0;","ease":"Power4.easeOut"}]'
									data-x="left" data-hoffset="['550','550','550','450']"
									data-y="center" data-voffset="['-65','-65','-69','-73']"
									data-fontsize="['18','18','18','30']"
									data-paddingtop="['10','10','10','12']"
									data-paddingbottom="['10','10','10','12']"
									data-paddingleft="['18','18','18','18']"
									data-paddingright="['18','18','18','18']">HELLO, WE CREATE</div>

								<div class="tp-caption tp-caption-overlay-opacity main-label"
									data-frames='[{"delay":1300,"speed":1000,"sfxcolor":"#212529","sfx_effect":"blockfromleft","frame":"0","from":"z:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":500,"sfxcolor":"#212529","sfx_effect":"blocktoleft","frame":"999","to":"z:0;","ease":"Power4.easeOut"}]'
									data-x="left" data-hoffset="['550','550','550','450']"
									data-y="center"
									data-fontsize="['50','50','50','60']"
									data-paddingtop="['10','10','10','12']"
									data-paddingbottom="['10','10','10','12']"
									data-paddingleft="['18','18','18','18']"
									data-paddingright="['18','18','18','18']">INCREDIBLE CHANGES</div>

								<div class="tp-caption font-weight-light text-color-light ws-normal"
									data-frames='[{"from":"opacity:0;","speed":300,"to":"o:1;","delay":2000,"split":"chars","splitdelay":0.05,"ease":"Power2.easeInOut"},{"delay":"wait","speed":1000,"to":"y:[100%];","mask":"x:inherit;y:inherit;s:inherit;e:inherit;","ease":"Power2.easeInOut"}]'
									data-x="left" data-hoffset="['550','550','550','450']"
									data-y="center" data-voffset="['65','65','65','105']"
									data-width="['600','600','600','600']"
									data-fontsize="['18','18','18','30']"
									data-lineheight="['29','29','29','40']">Life is about accepting the challenges along the way</div>

								<a class="tp-caption btn btn-primary font-weight-bold"
									href="${pageContext.request.contextPath}/challenge/main.do"
									data-frames='[{"delay":3000,"speed":2000,"frame":"0","from":"y:50%;opacity:0;","to":"y:0;o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;fb:0;","ease":"Power3.easeInOut"}]'
									data-x="left" data-hoffset="['550','550','550','450']"
									data-y="center" data-voffset="['140','140','140','235']"
									data-paddingtop="['16','16','16','31']"
									data-paddingbottom="['16','16','16','31']"
									data-paddingleft="['40','40','40','50']"
									data-paddingright="['40','40','40','50']"
									data-fontsize="['13','13','13','25']"
									data-lineheight="['20','20','20','25']">LEARN MORE <i class="fas fa-arrow-right ml-1"></i></a>

							</li>
						</ul>
					</div>
				</div>
				<!-- 사용자 정보 섹션 -->
				<div class="container">
					<div class="row counters counters-sm counters-text-dark py-4 my-5">
						<div class="col-sm-6 col-lg-3 mb-5 mb-lg-0">
							<div class="counter appear-animation" data-appear-animation="fadeInLeftShorter" data-appear-animation-delay="200">
								<i class="icons icon-user text-8 mb-3"></i>
								<strong class="font-weight-extra-bold mb-1" data-to="374200" data-append="+">0</strong>
								<label>DADOC을 사용하는 사람들</label>
								<p class="text-color-primary text-2 line-height-1 mb-0">They can’t be wrong</p>
							</div>
						</div>
						<div class="col-sm-6 col-lg-3 mb-5 mb-lg-0">
							<div class="counter appear-animation" data-appear-animation="fadeInLeftShorter">
								<i class="icons icon-screen-desktop text-8 mb-3"></i>
								<strong class="font-weight-extra-bold mb-1" data-to="24">0</strong>
								<label>DADOC의 서비스</label>
								<p class="text-color-primary text-2 line-height-1 mb-0">Many more to come</p>
							</div>
						</div>
						<div class="col-sm-6 col-lg-3 mb-5 mb-sm-0">
							<div class="counter appear-animation" data-appear-animation="fadeInRightShorter">
								<i class="icons icon-support text-8 mb-3"></i>
								<strong class="font-weight-extra-bold mb-1" data-to="345000" data-append="+">0</strong>
								<label>만족한 DADOC인의 수</label>
								<p class="text-color-primary text-2 line-height-1 mb-0">Satisfaction guaranteed</p>
							</div>
						</div>
						<div class="col-sm-6 col-lg-3">
							<div class="counter appear-animation" data-appear-animation="fadeInRightShorter" data-appear-animation-delay="200">
								<i class="icons icon-clock text-8 mb-3"></i>
								<strong class="font-weight-extra-bold mb-1" data-to="8753020" data-append="+">0</strong>
								<label>DADOC인의 누적 독서 시간</label>
								<p class="text-color-primary text-2 line-height-1 mb-0">You are already one of us</p>
							</div>
						</div>
					</div>
				</div>
				
		<!-- 캐로세일 실험 -->
		<div class="carosel-container">
			<div class="owl-carousel owl-theme show-nav-hover" id="book-carosel">
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
				<div>
					<img alt="" class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/1.jpg">
				</div>
			</div>
		</div>
		
		<!-- 테스트를 위한 더미 데이터 -->
		<div>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto quam repudiandae laborum officiis autem molestias enim rem ea odio eum quaerat ipsum possimus dolore assumenda mollitia consequuntur impedit iusto reiciendis!</p>
			<br />
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse placeat quaerat voluptate ut natus molestiae dolor suscipit ipsam doloremque nostrum nam ipsum laudantium iure odit amet a cum porro similique?</p>
			<br />
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad aliquam culpa error debitis veritatis reprehenderit voluptatum vitae optio laboriosam incidunt iste id cupiditate omnis cum placeat. Sit at nostrum libero?</p>
			<br />
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad aliquam culpa error debitis veritatis reprehenderit voluptatum vitae optio laboriosam incidunt iste id cupiditate omnis cum placeat. Sit at nostrum libero?</p>
			<br />
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad aliquam culpa error debitis veritatis reprehenderit voluptatum vitae optio laboriosam incidunt iste id cupiditate omnis cum placeat. Sit at nostrum libero?</p>
			<br />
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad aliquam culpa error debitis veritatis reprehenderit voluptatum vitae optio laboriosam incidunt iste id cupiditate omnis cum placeat. Sit at nostrum libero?</p>
		</div>
		
		<section class="section section-height-3 bg-color-grey-scale-1 border-top-0 m-0">
			<div class="container">
				<div class="row py-3 mb-2">
					<div class="col-lg-6 pr-5 appear-animation" data-appear-animation="fadeInRightShorter">
						<h2 class="font-weight-extra-bold text-color-dark text-6 mb-0">DADOC</h2>
						<p class="font-weight-normal opacity-8 text-4 mb-3">Lorem ipsum dolor sit amet consectetur adipiscing</p>
						<div class="divider divider-primary divider-small divider-small-left">
							<hr class="w-25">
						</div>
						<p class="opacity-8 mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enikklam iconsectetur adipiscing elit.</p>
						<p class="opacity-8 mb-3">Phasellus blandit massa enim. Nullam id varius elit. blandit massa enim varius blandit massa enimariusi d varius elit.</p>

						<a class="text-dark font-weight-bold text-2" href="demo-digital-agency-about.html">VIEW MORE<i class="fas fa-chevron-right text-2 pl-2"></i></a>
					</div>
					<div class="col-lg-6 appear-animation" data-appear-animation="fadeInRightShorter" data-appear-animation-delay="200">
						<div class="row">
							<div class="col">
								<p class="font-weight-bold text-color-dark text-4 mt-4 pt-3">Main Reasons to join us</p>
								<div class="divider divider-primary divider-small divider-small-left">
									<hr class="w-25">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="feature-box align-items-center mb-2" data-appear-animation="fadeInRightShorter" data-appear-animation-delay="100">
									<div class="feature-box-icon">
										<i class="icon-screen-tablet icons"></i>
									</div>
									<div class="feature-box-info">
										<p class="opacity-9 mb-0">모바일 사용 가능</p>
									</div>
								</div>
								<div class="feature-box align-items-center mb-2" data-appear-animation="fadeInRightShorter" data-appear-animation-delay="300">
									<div class="feature-box-icon">
										<i class="icon-layers icons"></i>
									</div>
									<div class="feature-box-info">
										<p class="opacity-9 mb-0">검증된 도서 빅데이터</p>
									</div>
								</div>
								<div class="feature-box align-items-center mb-2" data-appear-animation="fadeInRightShorter" data-appear-animation-delay="500">
									<div class="feature-box-icon">
										<i class="icon-magnifier icons"></i>
									</div>
									<div class="feature-box-info">
										<p class="opacity-9 mb-0">검색 기능</p>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="feature-box align-items-center mb-2" data-appear-animation="fadeInRightShorter" data-appear-animation-delay="200">
									<div class="feature-box-icon">
										<i class="icon-screen-desktop icons"></i>
									</div>
									<div class="feature-box-info">
										<p class="opacity-9 mb-0">독서 웹사이트 1위</p>
									</div>
								</div>
								<div class="feature-box align-items-center mb-2" data-appear-animation="fadeInRightShorter" data-appear-animation-delay="400">
									<div class="feature-box-icon">
										<i class="icon-doc icons"></i>
									</div>
									<div class="feature-box-info">
										<p class="opacity-9 mb-0">다양한 자료</p>
									</div>
								</div>
								<div class="feature-box align-items-center mb-2" data-appear-animation="fadeInRightShorter" data-appear-animation-delay="600">
									<div class="feature-box-icon">
										<i class="icon-user icons"></i>
									</div>
									<div class="feature-box-info">
										<p class="opacity-9 mb-0">최대 독서 커뮤니티</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
	<script>
		//data-plugin-options="{'items': 4, 'autoplay': true, 'autoplayTimeout': 3000}"
		$(document).ready(function(){
		  	$("#book-carosel").owlCarousel({
		  		items: 4,
		  		margin: 10,
		  		loop: true,
		  		nav: true,
		  		dots: true,
		  		autoplay: true,
		  		autoplayTimeout: 3000
		  	});
		});
	</script>
</body>
</html>