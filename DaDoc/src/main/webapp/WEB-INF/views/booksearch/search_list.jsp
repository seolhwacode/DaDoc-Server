<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/booksearch/search_list.do</title>
<jsp:include page="/include/resources_head.jsp"></jsp:include>
<style>
	/*페이지 헤더 색상 조정*/
	.page-header {
		background-color: #F9E0AE !important;
	}
	
	/* 페이지 헤더 - home 색깔 변경 */
	.breadcrumb a{
		color: #0088CC;
	}
	
	/* crumb 네비바 들어가기 */
	.page-header .breadcrumb{
		z-index: 0;
	}
	
	a{
		/* link 의 밑줄 없애기 */
		text-decoration: none;
		color: black;
	}
	.sort-selected{
		/* 선택된 것의 글씨를 진하게 하기 */
		font-weight: bold;
	}
	
 	/* 화면 가장 위로 가는 버튼 */
/* 	.goTopBtn{
		position: fixed;
	  	bottom: 10px;
	  	right: 10px;
	  	width: 50px;
	  	height: 50px;
	} */
	
/* 	.goTopBtn a{
		color: #682C0E;
	} */
	
/* 	.goTopBtn a:hover {
		color: #C24914;
	} */
	
	/* 전체를 가운데 정렬 */
	.align-content-center{
		/* 위, 아래 margin 추가 */
		margin: 10% auto;
		max-width: 900px;
	}
	
	/* 제목 아래 밑줄 */
	.title{
		border-bottom: solid;
	    border-color: #682C0E;
	}
	
	/* 검색 - input border 색 변경 */
	.search-form-container input{
		border-color: #682C0E;
	}
	
	/* 검색 - input border 색 변경 */
	.search-form-container input:focus{
		border-color: #682C0E;
		border-width: 3px;
	}
	
	/* 버튼 정렬 */
	.search-btn-container{
		display: flex;
		justify-content: flex-start;
		margin-top: 20px;
	}
	
	/* 검색 조건 리셋 버튼 */
	/* 버튼 사이 간격 띄우기 */
	.search-btn-container .reset-btn{
		margin-right: 10px;
		background-color: #c1c1c1;
	    color: black;
	    font-weight: bold;
	    font-size: 1.0rem;
	}
	
	/* 검색 조건 리셋 버튼  hover */
	.search-btn-container .reset-btn:hover {
		background-color: #949494;
		color: black;
	}

	/* 검색 버튼 */
	.search-btn-container .search-btn{
	    background-color: #C24914;
	    color: #f9e0ae;
	    font-weight: bold;
	    font-size: 1.0rem;
	}
	
	/* 검색 버튼 hover */
	.search-btn-container .search-btn:hover {
		background-color: #8c3712;
	}

	/* 기본 검색 - 아래 마진 추가 */
	.basic-search-container{
		margin-bottom: 80px;
	}
	
	/* 상세 검색 - 아래 마진 추가 */
	.detail-search-container{
		margin-bottom: 100px;
	}
	
	/* 상세 검색 - label 과 input 정렬 */
	.d-form-input-item {
		display: flex;
		width: 100%;
	    align-items: center;
        padding: 5px;
	}
	
	/* 상세 검색 - label 의 글씨 */
	.d-form-input-item label{
		font-size: 1rem;
		font-weight: bold;
		color: black;
		/* 너비 유지 */
        width: 130px;
	}
	
	/* 상세 검색 - 검색 조건 양쪽에 배치 */
	.divide-row{
		display: flex;
	    justify-content: space-between;
	}
	
	/* 검색 리스트 출력 - head 정렬 */
	.search-list-head{
		display: flex;
	    justify-content: space-between;
	    align-items: baseline;
	    border-bottom: solid;
	    border-color: #682c0e;
	    margin-bottom: 32px;
	}
	
	/* 검색 리스트 출력 - head 의 h1 의 margin-bottm 삭제 */
	.search-list-head h1{
		margin-bottom: 0;
	}
	
	/* 검색 리스트 출력 - 아래 마진 추가*/
	.search-list-container {
		margin-bottom: 100px;
	}
	
	/* 검색 리스트 출력 - item 하나의 배치 */
	.list-item-container{
        display: flex;
	    flex-direction: row;
	    justify-content: flex-start;
	    align-items: center;
	    /* margin-bottom: 30px; */
	    border-bottom: solid 1px #C24914;
	    padding: 30px 0;
	    height: 200px;
	}
	
	/* 검색 리스트 출력 - item 의 사진 크기 고정 */
	.list-item-container .img-container{
		height: -webkit-fill-available;
    	width: 20%;
    	cursor: pointer;
	}
	
	/* 검색 리스트 출력 - 이미지는 바깥의 컨텐츠에 맞춘다. */
	.list-item-container .img-container img{
		width: -webkit-fill-available;
    	height: -webkit-fill-available;
		object-fit: scale-down;
	}
	
	/* 검색 리스트 출력 - 출력 데이터 담고 있는 div */
	.list-item-container .data-container{
		width: 70%;
		cursor: pointer;
	}
	
	/* 검색 리스트 출력 - 좋아요 하트 위치 조절  */
	.list-item-container .heart-container{
		width: 10%;
		text-align: center;
	}
	
	/* 검색 리스트 출력 - 좋아요 하트 색 & 크기 변경 */
	.list-item-container .heart-container svg{
		width: 20px;
	    height: 20px;
	    color: red;
	}
	
	
}
</style>
</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="booksearch" name="thisPage"/>
	</jsp:include>
	
	<!-- 페이지 헤더 -->
	<section class="page-header page-header-modern page-header-md">
		<div class="container">
			<div class="row">
				<div class="col-md-12 align-self-center p-static order-2 text-center">
					<h1 class="text-dark font-weight-bold text-8 bold-family">Book Search</h1>
					<span class="sub-title text-dark">Book Search with DADOC</span>
				</div>
				<div class="col-md-12 align-self-center order-1">
					<ul class="breadcrumb d-block text-center">
						<li><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li class="active">Book Search</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<!-- main content -->
	<div class="container" id="search_list_container">
		<div class="align-content-center">
			<!-- 검색하는 form 들의 영역 -->
			<div class="search-form-container">
				<!-- 기본 검색 -->
				<div class="basic-search-container">
					<h1 class="title">기본 검색</h1>
					<!-- 일반 검색 form -->
					<div class="basic-search-form-wrapper">
						<form @submit.prevent="submitBasicSearch" ref="basicSearchForm"
								method="get"
								action="${pageContext.request.contextPath}/booksearch/ajax_basic_search.do">
							<!-- 들고 올 총 개수 / 시작 row 번호  / 정렬 방법 -->
							<input type="hidden" name="display" v-bind:value="display" />
							<input type="hidden" name="start" value="1" ref="inputStart"/>
							<input type="hidden" name="sort" value="sim" ref="b_inputSort" />
							<div>
								<input v-model="query" type="text" name="query" id="query" class="form-control form-control-lg" />
							</div>
							<div class="search-btn-container">
								<button type="reset" class="btn reset-btn">검색 조건 리셋</button>
								<button type="submit" class="btn search-btn">검색</button>
							</div>
						</form>
					</div>	
				</div>
				<!-- 상세 검색 -->
				<div class="detail-search-container">
					<h1 class="title">상세 검색</h1>
					<div>
						<p>상세 검색은 책 제목(d_titl), 저자명(d_auth), 목차(d_cont), ISBN(d_isbn), 출판사(d_publ) 5개 항목 중에서 1개 이상 값을 입력해야 함.</p>
					</div>
					<!-- 상세 검색 form -->
					<div class="detail-search-form-wrapper">
						<form @submit.prevent="submitDetailSearch" ref="detailSearchForm" 
								@reset="resetDetailSearchForm"
								action="${pageContext.request.contextPath}/booksearch/ajax_detail_search.do" method="get">
							<!-- 들고 올 총 개수 / 시작 row 번호 / 정렬 방법 -->
							<input type="hidden" name="display" v-bind:value="display" />
							<input type="hidden" name="start" value="1" ref="d_inputStart" />
							<input type="hidden" name="sort" value="sim" ref="d_inputSort" />
							<div class="divide-row">
								<div class="d-form-input-item">
									<label for="d_titl">책 제목</label>
									<input v-model="d_titl" type="text" name="d_titl" id="d_titl" class="form-control form-control-lg" />
								</div>
								<div class="d-form-input-item">
									<label for="d_auth">저자명</label>
									<input v-model="d_auth" type="text" name="d_auth" id="d_auth" class="form-control form-control-lg" />
								</div>
							</div>
							<div class="divide-row">
								<div class="d-form-input-item">
									<label for="d_cont">목차</label>
									<input v-model="d_cont" type="text" name="d_cont" id="d_cont" class="form-control form-control-lg" />
								</div>
								<div class="d-form-input-item">
									<label for="d_isbn">ISBN</label>
									<input v-model="d_isbn" type="text" name="d_isbn" id="d_isbn" class="form-control form-control-lg" />
								</div>
							</div>
							<div class="divide-row">
								<div class="d-form-input-item">
									<label for="d_publ">출판사</label>
									<input v-model="d_publ" type="text" name="d_publ" id="d_publ" class="form-control form-control-lg" />
								</div>
								<div class="d-form-input-item">
									<label for="d_catg">카테고리</label>
									<input v-model="d_catg" type="text" name="d_catg" id="d_catg" class="form-control form-control-lg" />
								</div>
							</div>
							<div class="divide-row">
								<div class="d-form-input-item">
									<label for="d_dafr">출간 시작일</label>
									<input v-model="d_dafr" type="text" name="d_dafr" id="d_dafr" placeholder="ex) 20000203" class="form-control form-control-lg" />
								</div>
								<div class="d-form-input-item">
									<label for="d_dato">출간 종료일</label>
									<input v-model="d_dato" type="text" name="d_dato" id="d_dato" placeholder="ex) 20000203" class="form-control form-control-lg" />
								</div>
							</div>
							<div class="search-btn-container">
								<button type="reset" class="btn reset-btn">검색 조건 리셋</button>
								<button type="submit" class="btn search-btn">검색</button>
							</div>
						</form>
					</div>	
				</div>
			</div>
			
			<!-- 리스트 출력 영역 -->
			<div class="search-list-container">
				<div class="search-list-head">
					<h1>검색 리스트 출력</h1>
					<div>
						<!-- sim(유사도순), date(출간일순), count(판매량순) -->
						<!-- css 로 선택된 상태 & hover된 상태에서 색이 다르게 되게 한다. -->
						<a @click="changeSort('sim')" v-bind:class="{'sort-selected': isSimSort}" href="javascript:">유사도순</a>
						<a @click="changeSort('date')" v-bind:class="{'sort-selected': isDateSort}" href="javascript:">출간일순</a>
						<a @click="changeSort('count')" v-bind:class="{'sort-selected': isCountSort}" href="javascript:">판매량순</a>
					</div>
				</div>
				<div class="search-list-body">
					<!-- 검색 리스트 출력 -->
					<div v-for="(item, index) in searchList" v-bind:key="item.isbn" >
						<!-- 컴포넌트로 리스트를 출력 -->
						<list-component v-bind:list-item="item"
									v-bind:base_url="base_url"></list-component>
					</div>
				</div>
			</div>
	
			<!-- 페이징 처리 -->
			<div class="paging-container">
				<!-- 페이징 컴포넌트 출력 -->
				<paging-component :paging_data="paging_data"
								@click_link="movePage"></paging-component>
			</div>
		</div>

		
		<!-- 상단으로 이동하는 버튼 추가 -->
<!-- 		<div class="goTopBtn" v-show="isScrolled" @scroll="scrollCheck">
			<a @click="goTop" href="javascript:">
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
				  <path d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
				</svg>
			</a>
		</div> -->
	</div>
	
	
	<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
	<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
	
	<!-- vue -->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

	<script>
		Vue.component("paging-component", {
			template : `
				<nav>
			        <ul class="pagination justify-content-center">
			            <!-- Prev -->
			            <!-- v-if / v-else : else 를 사용하려면, 연속으로 있어야한다.-->
			            <li v-if="paging_data.startPageNum != 1" class="page-item">
			                <a v-on:click.prevent="callMovePage(paging_data.startPageNum - 1)" class="page-link" href="">Prev</a>
			            </li>
			            <li v-else class="page-item disabled">
			                <a class="page-link" href="javascript:">Prev</a>
			            </li>
			            
			            <!-- 숫자 -->
			            <!-- v-on:click.prevent : prevent 를 붙이면 기본 동작을 막는다. -->
			            <!-- v-bind:class="{ class명 : 조건(true/false) }"-->
			            <li v-for="i in updatePageNums" class="page-item" v-bind:class="{ active : i === paging_data.pageNum }">
			                <a v-on:click.prevent="callMovePage(i)" class="page-link" href="">{{ i }}</a>
			            </li>
		
			            <!-- Next -->
			            <li v-if="paging_data.endPageNum < paging_data.totalPageCount" class="page-item">
			                <a v-on:click.prevent="callMovePage(paging_data.endPageNum + 1)" class="page-link" href="">Next</a>
			            </li>
			            <li v-else class="page-item disabled">
			                <a class="page-link" href="javascript:">Next</a>
			            </li>
			        </ul>
			    </nav>
		    `,
		    props : ["paging_data"],
		    methods : {
		    	callMovePage(index){//부모 component 의 movePage(pageNum) 을 호출하기위한 event 를 발생시킨다.
		    		//event 명 : callMovePage
		    		//넘겨줄 data : pageNum = index
		    		this.$emit("click_link", index);
		    	}
		    },
		    computed : {
	            /* 
	            	getPageNums 을 호출하지 않고, 자동으로 pageNums 가 변경될 수 있도록 한다.
	            	this.startPageNum, this.endPageNum 의 값이 변경되면, 자동으로 실행된다.
					
	            	최초 호출된 이후,
					startPageNum 혹은 endPageNum 에 변경이 있을 때
					다시 호출되는 함수(next, prev 누르면 된다.)
		        */
		        updatePageNums(){
		            const nums = [];
		            for(let i = this.paging_data.startPageNum; i <= this.paging_data.endPageNum; i++){
		                nums.push(i);
		            }
		            return nums;
		        }
		    }
		});
	
		//책 하나의 출력 리스트
		Vue.component("list-component", {
			template: `
				<div class="list-item-container">
					<div class="img-container" @click="goDetailPage">
						<img v-bind:src="listItem.image" alt="책 사진" />
					</div>
					<div class="data-container" @click="goDetailPage">
						<div>
							제목 : <span v-html="listItem.title"></span>
						</div>
						<div>
							저자 : <span v-html="listItem.author"></span>
						</div>
						<div>
							정가 : <span v-html="listItem.price"></span>
						</div>
						<div>
							ISBN : <span v-html="listItem.isbn"></span>
						</div>
						<div>
							출간일 : <span v-html="listItem.pubdate"></span>
						</div>
					</div>
					<div class="heart-container">
						<a @click="goodToggle" href="javascript:">
							<span v-html="printHeart"></span>
						</a>
					</div>
				</div>
			`,
			//listItem : 출력할 리스트의 하나의 오브젝트 
			// -> image, title, link, author, price, isbn, description, datetime 가 들어있다.
			// fetch 를 위해서 base_url 을 부모로부터 가져옴
			props: ["listItem", "base_url"],
			data(){
				return {
					//좋아요 인지 아닌지
					isGood: false,
					//빈 하트
					blankHeart: `
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
						  <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
						</svg>
					`,
					//꽉 찬 하트
					fullHeart: `
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
						  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
						</svg>
					`,
					//출력할 하트 -> isGood true(fullHeart), false(blankHeart) 로 내용물을 변경한다.
					//printHeart: ''
				};
			},
			methods: {
				//책의 정보가 담긴 네이버의 페이지로 이동
				goDetailPage(){
					var win = window.open(this.listItem.link, '_blank');
			        win.focus();
				},
				//db 에서 좋아요를 추가
				addGood(){
					//vue 객체
					const self = this;
					//ajax 로 db 에 좋아요 추가
					fetch(this.base_url + '/bookgood/ajax_add.do?isbn=' + this.listItem.isbn)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						//data = { isSuccess: true/false } -> 반영 성공
						if(data.isSuccess){
							//성공 -> 좋아요 O -> isGood = true
							self.isGood = true;
						}
					});
				},
				//db 에서 좋아요를 삭제
				cancelGood(){
					//vue 객체
					const self = this;
					//ajax 로 db 에 좋아요 취소(삭제)
					fetch(this.base_url + '/bookgood/ajax_cancel.do?isbn=' + this.listItem.isbn)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						//data = { isSuccess: true/false } -> 반영 성공
						if(data.isSuccess){
							//성공 -> 좋아요 X -> isGood = false
							self.isGood = false;
						}
					});
				},
				//좋아요 버튼은 토글이다. -> isGood 이 true / false 인지에 따라 ajax 로 좋아요 추가 / 삭제 이루어진다.
				goodToggle(){
					//로그인 상태인지 검사
					if(${ empty id }){
						//-> id 가 비었다 -> 로그인 상태 X -> comfirm 으로 로그인 할 것인지 물어보기
						/* let isOk = confirm('로그인이 필요한 기능입니다. 로그인 하시겠습니까?');
						//-> 로그인 하러감
						if(isOk){
							location.href = this.base_url + '/users/login_form.do?url=' + this.base_url + '/booksearch/search_list.do';
						}
						//-> 로그인 x -> 아무 일도 안일어남
						return; */
						
						let self = this;
						
						swal({
							title: "로그인이 필요한 기능입니다.",
							text: "로그인 하시겠습니까?",
							icon: "info",
						  	buttons: {
						  		no:{
						  			text: '취소',
						  			value: false
						  		},
						    	ok: {
						    		text: "확인",
						    		value: true
						    	},
						  	}
						})
						.then(function(value){
							//확인 -> 로그인 하러감
							if(value){
								location.href = self.base_url + '/users/login_form.do?url=' + self.base_url + '/booksearch/search_list.do';
							}else{
								//X -> 아무 일 없음
								return;
							}
						});
					}else{
						//로그인 한 상태
						if(!this.isGood){
							//좋아요 false -> db 에 좋아요 추가
							this.addGood();
						}else{
							//좋아요 true -> 취소 -> db 에서 좋아요 삭제
							this.cancelGood();
						}
					}
				},
				//해당 책을 사용자가 좋아요를 눌렀는지 ajax 로 true / false 로 가져옴
				getIsGood(){
					//vue 의 참조값 가져옴
					const self = this;
					
					//1. 사용자가 로그인 상태인지 검사
					if(${ !empty id }){
						//로그인 O
						//2. 사용자가 로그인 상태 -> ajax 로 테이블에서 좋아요 인지 아닌지 읽어옴
						fetch(self.base_url + '/bookgood/ajax_isExist.do?isbn=' + self.listItem.isbn)
						.then(function(response){
							return response.json();
						})
						.then(function(data){
							//data => { isGood: true/false }
							self.isGood = data.isGood;
							//computed 로 인해서 자동으로 하트 모양이 바뀜
						});

					}else{
						//3. 사용자 로그인 상태 X -> isGood = false
						this.isGood = false;
					}
				}
			},
			created(){
				//사용자가 로그인 상태인지 체크 & 좋아요 눌렀는지 체크 -> isGood 변경
				this.getIsGood();
				//처음 만들어질 때, 기본으로는 빈 하트이다.
			},
			computed: {
				//isGood 이 변하면 자동으로 다른 값을 리턴해준다.
				// true -> fullHeart / false -> blankHeart
				printHeart(){
					if(this.isGood){
						//좋아요 O
						return this.fullHeart;
					}else{
						//좋아요 X
						return this.blankHeart;
					}
				}
			}
		});
		
		// webcontent 위치
		const base_url = "http://localhost:8888/dadoc";
		
		let search_list_container = new Vue({
			el: "#search_list_container",
			data: {
				//출력할 리스트
				searchList: [],
				base_url,
				//검색을 위해 필요한 get 방식 parameter
				query: '',	//검색을 원하는 문자열로서 UTF-8로 인코딩한다. -> 상세검색일 때는 없음
				
				sort: 'sim',	//정렬 옵션: sim(유사도순), date(출간일순), count(판매량순)
				display: 10,	//검색 결과 출력 건수 지정
				
				//d_00 : 상세 검색만 해당
				d_titl: '',	//책 제목 검색
				d_auth: '',	//저자명 검색
				d_cont: '', 	//목차 검색
				d_isbn: '',	//isbn 검색
				d_publ: '',	//출판사 검색
				d_dafr: '',	//출간 시작일(ex.20000203)
				d_dato: '',	//출간 종료일(ex.20000203)
				d_catg: '',	//책 검색 카테고리
				
				//response & 추가 사용
				total: 0,	//검색하고 나면 나오는 총 책의 개수	
				paging_data: {
	            	pageNum: 1,	//페이지 처음은 1
	            	startPageNum: 1,	//보여지는 첫 페이지 숫자
	            	endPageNum: 1,	//보여지는 끝 페이지 숫자
	            	totalPageCount: 1	//페이지의 총 개수 : total, display 로 부터 만들어내기
	            },
	            isBasicSearch: false,	//기본 검색 상태
	            isDetailSearch: false,	//상세 검색 상태
	            isSimSort: true,	//유사도순
	            isDateSort: false,	//출판일순
	            isCountSort: false,	//판매량순
	            
	            isScrolled: false	//스크롤 했는지 검사 -> 상단 이동 버튼에 사용
			},
			methods: {
				//스크롤 되었는지 이벤트 처리하기
				scrollCheck(){
					console.log('scroll');
					//화면 스크롤이 30보다 크면 -> 스크롤 햇다고 처리하기
					if(window.pageYOffset > 30){
						this.isScrolled = true;
					}else{
						//작으면 스크롤 안했다고 처리하기
						this.isScrolled = false;
					}
				},
				//가장 상단으로 이동하기
				goTop(){
					window.scrollTo(0,0);
				},
				//리셋 버튼 누름 => 상세검색 form 리셋
				resetDetailSearchForm(){
					this.d_titl = '';	//제목
					this.d_auth = '';	//저자명
					this.d_cont = '';	//목차
					this.d_isbn = '';	//isbn
					this.d_publ = '';	//출판사
					this.d_dafr = '';	//출간 시작일
					this.d_dato = '';	//출간 종료일
					this.d_catg = '';	//카테고리
				},
				//이전에 검색되어 나온 것을 전부 reset
				resetResults(){
					//-> 이전 검색했던 리스트 삭제
            		this.searchList = [];
            		//-> 페이징도 초기화
            		this.total = 0;	//검색하고 나면 나오는 총 책의 개수	
					this.paging_data.pageNum = 1;
					this.paging_data.startPageNum = 1;
					this.paging_data.endPageNum = 1;
					this.paging_data.tatalPageCount = 1;
				},
				//정렬 방법 변경 및 화면 ajax 로 변경하기
				changeSort(sort){
					//기본 & 상세 검색 form 의 정렬방법 변경하기
					this.$refs.b_inputSort.value = sort;
					this.$refs.d_inputSort.value = sort;
					
					//class 변경을 위해 isSimSort, isDateSort, isCountSort 값 조절
					if(sort === 'sim'){
						//sim : 유사도순
						this.isSimSort = true;
						this.isDateSort = false;
						this.isCountSort = false;
					}else if(sort === 'date'){
						//date : 출판일순
						this.isSimSort = false;
						this.isDateSort = true;
						this.isCountSort = false;
					}else{
						//count : 판매량순
						this.isSimSort = false;
						this.isDateSort = false;
						this.isCountSort = true;
					}
					
					//어떤 검색인지에 따라서 ajax 하는 form 이 달라진다.
					if(this.isDetailSearch){
	                	//상세검색
	                	this.detailSearch();
	                }else{
	                	//bastic 검색
		            	this.basicSearch();
	                }
				},
				//네이버 상세검색 버튼을 눌러서 검색할 때 이벤트처리
				submitDetailSearch(){
					//입력란의 input이 trim 해서 처음과 끝 빈칸 삭제하고 -> 빈칸이면 검색 X
					//d_titl / d_auth / d_cont / d_isbn / d_publ / d_dafr / d_dato / d_catg
					//상세 검색은 책 제목(d_titl), 저자명(d_auth), 목차(d_cont), ISBN(d_isbn), 출판사(d_publ) 5개 항목 중에서 1개 이상 값을 입력해야 함.
					//모든 칸이 빈칸이면 검색 X
	            	if(this.d_titl.trim() === '' && this.d_auth.trim() === '' && this.d_cont.trim() === ''
	            			&& this.d_isbn.trim() === '' && this.d_publ.trim() === ''){
	            		//alert('검색어를 입력해주세요.');
	            		swal({
						  	title: "검색어를 입력해주세요.",
						  	icon: "warning",
						  	button: "확인"
						});
	            		
	            		//이전에 검색되어 나온 것을 전부 reset
	    				this.resetResults();
	            		
						//종료
	            		return;
	            	}
					
					//출간 시작/종료일 -> 숫자만 허용
					let number_reg =  /^[0-9]*$/;
					if(!number_reg.test(this.d_dafr) || !number_reg.test(this.d_dato)){
						//숫자 X 다른 문자
						//alert('잘못 입력하셨습니다.');
						swal({
						  	title: "검색어를 입력해주세요.",
						  	icon: "warning",
						  	button: "확인"
						});
						
						//이전에 검색되어 나온 것을 전부 reset
	    				this.resetResults();
						
						//종료
	            		return;
					}
					
					//검색버튼을 누른다 -> input 값 직접 변경(input hidden 은 v-model 이 통하지 X)
					this.$refs.d_inputStart.value = 1;
					
					//상세 검색 상태로 만든다.
					this.isBasicSearch = false;
	            	this.isDetailSearch = true;
	            	
	            	//sort 는 첫 검색 버튼 누르면 무조건 sim(유사도순)
	            	this.$refs.d_inputSort.value = 'sim';
	            	this.isSimSort = true;
					this.isDateSort = false;
					this.isCountSort = false;
					
					//ajax 호출
	            	this.detailSearch();
				},
				detailSearch(){
					//form 의 객체를 가져옴
					const form = this.$refs.detailSearchForm;
					
					//form 의 action 속성 url 을 가져옴
					const url = form.getAttribute("action");
					
					//gura_util 에서 가져옴 -> form 의 쿼리string 을 가져오기
					//여기서는 query, display, start 3가지가 들어온다.
					const queryString = new URLSearchParams(new FormData(form)).toString();
					
					//console.log('queryString : ' + queryString);
					
					//vue 객체
					const self = this;
					
					//ajax 로 받아오기
					fetch(url + "?" + queryString)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						//제발 json 으로 넘어와줘
						console.log(data);
						//우리는 data 의 items object 를 사용한다.
						//data : 내부에 개개 책의 정보가 담긴 object 를 담고 있는 array 이다.
						
						//오류 쿼리가 넘어올 때
						if(data.result != null){
							//잘못된 검색
							//alert('잘못된 검색입니다.');
							swal({
							  	title: "잘못된 검색입니다.",
							  	icon: "warning",
							  	button: "확인"
							});
							
							self.resetResults();
							return;
						}
						
						//오류 : 검색되는 결과가 1개일 때, array 가 아닌 단일 object 로 넘어온다.
						//-> object 를 array 에 넣어서 this.searchList 에 담는다.
						if(data.rss.channel.total === 1){
							//새로운 array 만들기
							let newArray = [];
							//object 담기
							newArray.push(data.rss.channel.item);
							//this.arrayList 에 담기
							self.searchList = newArray;
						}else{
							self.searchList = data.rss.channel.item;
						}
						
						//페이징 처리와 관련된 데이터들 update
						self.pagingDataUpdate(data.rss.channel);
					});
				},
				//출력하는 페이지 가 변경된다.
				movePage(pageNum){
					//현재페이지와 동일한 페이지를 클릭 -> ajax 받아오지 X(자원 낭비)
					if(pageNum === this.paging_data.pageNum){
						return;
					}
					
	                //현재 페이지를 수정하고
	                this.paging_data.pageNum = pageNum;
	               	
	                //query 가 빈칸 -> detail 검색 -> 상세검색시에 query 가 빈칸이 아니면 오류가 생긴다.
	                //-> 수정 : isBasicSearch, isDetailSearch 를 사용하여 상태를 관리한다.
	                if(this.isDetailSearch){
	                	//상세검색
	                	// 화면 업데이트 -> form 의 start 를 바꾸고 -> 검색을 다시 한다.
		                //-> input 값 직접 변경(input hidden 은 v-model 이 통하지 X)
	                	this.$refs.d_inputStart.value = pageNum;
	                	this.detailSearch();
	                }else{//isBasicSearch 와 isDetailSearch 는 서로 반대의 값을 가짐 -> bastic 검색
	                	// 화면 업데이트 -> form 의 start 를 바꾸고 -> 검색을 다시 한다.
		                //-> input 값 직접 변경(input hidden 은 v-model 이 통하지 X)
		            	this.$refs.inputStart.value = pageNum;
		                //ajax
		            	this.basicSearch();
	                }
	            },
	 	        //네이버 기본 검색버튼을 눌러서 검색할 때 이벤트처리
	            submitBasicSearch(){
	            	//입력란의 input이 trim 해서 처음과 끝 빈칸 삭제하고 -> 빈칸이면 검색 X
	            	if(this.query.trim() === ''){
	            		//alert('검색어를 입력해주세요.');
	            		swal({
						  	title: "검색어를 입력해주세요.",
						  	icon: "warning",
						  	button: "확인"
						});
	            		
	            		//이전에 검색되어 나온 것을 전부 reset
	    				this.resetResults();
	            		
	            		return;
	            	}
	            	
	            	//검색버튼을 누른다 -> input 값 직접 변경(input hidden 은 v-model 이 통하지 X)
	            	this.$refs.inputStart.value = 1;
	            	
	            	//기본 검색 상태로 만든다.
	            	this.isBasicSearch = true;
	            	this.isDetailSearch = false;
	            	
	            	//sort 는 첫 검색 버튼 누르면 무조건 sim(유사도순)
	            	this.$refs.b_inputSort.value = 'sim';
	            	this.isSimSort = true;
					this.isDateSort = false;
					this.isCountSort = false;
	            	
	            	//ajax 호출
	            	this.basicSearch();
	            },
				//네이버 기본 검색 api 검색
				basicSearch(){
					//form 의 객체를 가져옴
					const form = this.$refs.basicSearchForm;
					
					//form 의 action 속성 url 을 가져옴
					const url = form.getAttribute("action");
					
					//gura_util 에서 가져옴 -> form 의 쿼리string 을 가져오기
					//여기서는 query, display, start 3가지가 들어온다.
					const queryString = new URLSearchParams(new FormData(form)).toString();
					
					//vue 객체
					const self = this;
					
					//ajax 로 받아오기
					fetch(url + "?" + queryString)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						//제발 json 으로 넘어와줘
						console.log(data);
						//우리는 data 의 items object 를 사용한다.
						//data : 내부에 개개 책의 정보가 담긴 object 를 담고 있는 array 이다.
						self.searchList = data.items;
						
						//페이징 처리와 관련된 데이터들 update
						self.pagingDataUpdate(data);
					});
				},
				//페이징 처리와 관련된 데이터들 update
				pagingDataUpdate(data){
					//전체 검색 결과 개수
					this.total = data.total;
					
					//전체 페이지 개수
					//검색 결과가 0 이거나, 오류 요청일 때
					if(this.total == undefined || this.total == 0){
						this.paging_data.totalPageCount = 1;
					}else{
						//정상 요청
						this.paging_data.totalPageCount = Math.ceil(this.total / this.display);
					}
					
					//현재 페이지 번호 : pageNum = start
					this.paging_data.pageNum = data.start;
					
					//paging 시작 번호
					this.paging_data.startPageNum = 1 + Math.floor(Math.floor(this.paging_data.pageNum - 1) / this.display) * this.display;
					
					//paging 끝 번호
					this.paging_data.endPageNum = this.paging_data.startPageNum + this.display - 1;
					//끝 페이지 번호가 전체 페이지 개수보다 크다면, 잘못된 값이다.
					if(this.paging_data.endPageNum > this.paging_data.totalPageCount){
						this.paging_data.endPageNum = this.paging_data.totalPageCount;	//보정해준다.
					}
					
					
					//임시 출력
 					//console.log('searchList');
					//console.log(this.searchList);
					/* console.log('list type : ' + typeof(this.searchList));
					console.log('total : ' + this.total);
					console.log('totalPageCount : ' + this.paging_data.totalPageCount);
					console.log('pageNum : ' + this.paging_data.pageNum);
					console.log('startPageNum : ' + this.paging_data.startPageNum);
					console.log('endPageNum : ' + this.paging_data.endPageNum); */
				}
			},
			created(){
				/* window.addEventListener('scroll', this.scrollCheck); */
			}
		});
	</script>
</body>
</html>