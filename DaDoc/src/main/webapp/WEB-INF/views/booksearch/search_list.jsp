<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/booksearch/search_list.do</title>
</head>
<body>
	<div class="container" id="search_list_container">
		<!-- 일반 검색 form -->
		<div>
			<form @submit.prevent="basicSearch" ref="basicSearchForm"
					method="get"
					action="${pageContext.request.contextPath}/booksearch/ajax_basic_search.do">
				<!-- 들고 올 총 개수 / 시작 row 번호 -->
				<input type="hidden" name="display" v-bind:value="display" />
				<input type="hidden" name="start" v-model:value="start" />
				<div>
					<label for="query">기본 검색</label>
					<input v-model="query" type="text" name="query" id="query" />
				</div>
				<div>
					<button type="submit">검색</button>
				</div>
			</form>
		</div>
		<!-- 상세 검색 form -->
		<div>
			<form action="" method="get">
				<!-- 들고 올 총 개수 / 시작 row 번호 -->
				<input type="hidden" name="display" v-bind:value="display" />
				<input type="hideen" name="start" v-bind:value="start" />
				<div>
					<label for="d_titl">책 제목</label>
					<input type="text" name="d_titl" id="d_titl" />
				</div>
				<div>
					<label for="d_auth">저자명</label>
					<input type="text" name="d_auth" id="d_auth" />
				</div>
				<div>
					<label for="d_cont">목차</label>
					<input type="text" name="d_cont" id="d_cont" />
				</div>
				<div>
					<label for="d_isbn">ISBN</label>
					<input type="text" name="d_isbn" id="d_isbn" />
				</div>
				<div>
					<label for="d_publ">출판사</label>
					<input type="text" name="d_publ" id="d_publ" />
				</div>
				<div>
					<label for="d_dafr">출간 시작일</label>
					<input type="text" name="d_dafr" id="d_dafr" />
				</div>
				<div>
					<label for="d_dat">출간 종료일</label>
					<input type="text" name="d_dat" id="d_dat" />
				</div>
				<div>
					<label for="d_catg">카테고리</label>
					<input type="text" name="d_catg" id="d_catg" />
				</div>
			</form>
		</div>
		
		<br />
		
		<h1>검색 리스트 출력</h1>
		<!-- 검색 리스트 출력 -->
		<div>
			<div v-for="(item, index) in searchList" v-bind:key="index" >
				<!-- 컴포넌트로 리스트를 출력 -->
				<list-component v-bind:list-item="item"></list-component>
			</div>
		</div>
		
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		Vue.component("list-component", {
			template: `
				<div>
					<div>
						<img v-bind:src="listItem.image" alt="책 사진" />
					</div>
					<div>
						제목 : <span v-html="listItem.title"></span>
					</div>
					<div>
						링크 : <span v-html="listItem.link"></span>
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
						요약 : <span v-html="listItem.description"></span>
					</div>
					<div>
						출간일 : <span v-html="listItem.datetime"></span>
					</div>
				</div>
			`,
			//listItem : 출력할 리스트의 하나의 오브젝트 
			// -> image, title, link, author, price, isbn, description, datetime 가 들어있다.
			props: ["listItem"],
			methods: {
				
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
				//페이징 처리 오브젝트 : 
				paging_data: {
					pageNum: 1,
					startPageNum: 1,	//페이징의 시작 페이지
					endPageNum: 5,	//
					total: 0	//검색 결과 문서의 총 개수를 의미한다.
				},
				//검색을 위해 필요한 get 방식 parameter
				query: '',	//검색을 원하는 문자열로서 UTF-8로 인코딩한다. -> 상세검색일 때는 없음
				
				sort: 'sim',	//정렬 옵션: sim(유사도순), date(출간일순), count(판매량순)
				display: 10,	//검색 결과 출력 건수 지정
				start: 1,	//검색 시작 위치
				
				//d_00 : 상세 검색만 해당
				d_titl: '',	//책 제목 검색
				d_auth: '',	//저자명 검색
				d_cont: '', 	//목차 검색
				d_isbn: '',	//isbn 검색
				d_publ: '',	//출판사 검색
				d_dafr: '',	//출간 시작일(ex.20000203)
				d_dato: '',	//출간 종료일(ex.20000203)
				d_catg: '',	//책 검색 카테고리
				
				//
			},
			methods: {
				//검색할 때마다 출력하는 list 가 변경된다.
				updateList(){
					
				},
				//네이버 기본 검색 api 검색
				basicSearch(){
					//input 에 입력한 내용
					//let input = this.query;
					
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
					});
				}
			},
			created(){
				
			}
		});
	</script>
</body>
</html>