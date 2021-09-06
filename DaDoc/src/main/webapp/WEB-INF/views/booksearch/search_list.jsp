<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/booksearch/search_list.do</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<style>
	a{
		/* link 의 밑줄 없애기 */
		text-decoration: none;
		color: black;
	}
	.sort-selected{
		/* 선택된 것의 글씨를 진하게 하기 */
		font-weight: bold;
	}
</style>
</head>
<body>
	<div class="container" id="search_list_container">
		<!-- 일반 검색 form -->
		<div>
			<form @submit.prevent="submitBasicSearch" ref="basicSearchForm"
					method="get"
					action="${pageContext.request.contextPath}/booksearch/ajax_basic_search.do">
				<!-- 들고 올 총 개수 / 시작 row 번호  / 정렬 방법 -->
				<input type="hidden" name="display" v-bind:value="display" />
				<input type="hidden" name="start" value="1" ref="inputStart"/>
				<input type="hidden" name="sort" value="sim" ref="b_inputSort" />
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
			<form @submit.prevent="submitDetailSearch" ref="detailSearchForm" 
					action="${pageContext.request.contextPath}/booksearch/ajax_detail_search.do" method="get">
				<!-- 들고 올 총 개수 / 시작 row 번호 / 정렬 방법 -->
				<input type="hidden" name="display" v-bind:value="display" />
				<input type="hidden" name="start" value="1" ref="d_inputStart" />
				<input type="hidden" name="sort" value="sim" ref="d_inputSort" />
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
				<div>
					<button type="submit">검색</button>
				</div>
			</form>
		</div>
		
		<!-- sim(유사도순), date(출간일순), count(판매량순) -->
		<!-- css 로 선택된 상태 & hover된 상태에서 색이 다르게 되게 한다. -->
		<a @click="changeSort('sim')" v-bind:class="{'sort-selected': isSimSort}" href="javascript:">유사도순</a>
		<a @click="changeSort('date')" v-bind:class="{'sort-selected': isDateSort}" href="javascript:">출간일순</a>
		<a @click="changeSort('count')" v-bind:class="{'sort-selected': isCountSort}" href="javascript:">판매량순</a>
		
		<br />
		
		<h1>검색 리스트 출력</h1>
		<!-- 검색 리스트 출력 -->
		<div>
			<div v-for="(item, index) in searchList" v-bind:key="index" >
				<!-- 컴포넌트로 리스트를 출력 -->
				<list-component v-bind:list-item="item"></list-component>
			</div>
		</div>
		
		
		<!-- 페이징 처리 -->
		<div>
			<!-- 페이징 컴포넌트 출력 -->
			<paging-component :paging_data="paging_data"
							@click_link="movePage"></paging-component>
		</div>
	</div>
	
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
		            //alert("computed : updatePageNums 호출됨");
		            const nums = [];
		            for(let i = this.paging_data.startPageNum; i <= this.paging_data.endPageNum; i++){
		                nums.push(i);
		            }
		            return nums;
		        }
		    }
		});
	
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
						출간일 : <span v-html="listItem.pubdate"></span>
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
	            isCountSort: false	//판매량순
			},
			methods: {
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
	                	alert("상세검색");
	                	this.detailSearch();
	                }else{
	                	alert("기본 검색");
	                	//bastic 검색
		            	this.basicSearch();
	                }
				},
				//네이버 상세검색 버튼을 눌러서 검색할 때 이벤트처리
				submitDetailSearch(){
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
					console.log('list type : ' + typeof(this.searchList));
					console.log('total : ' + this.total);
					console.log('totalPageCount : ' + this.paging_data.totalPageCount);
					console.log('pageNum : ' + this.paging_data.pageNum);
					console.log('startPageNum : ' + this.paging_data.startPageNum);
					console.log('endPageNum : ' + this.paging_data.endPageNum);
				}
			},
			created(){
				
			}
		});
	</script>
</body>
</html>