<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd/input_id.do</title>
<!-- 외부 css 및 파일들 추가  -->
<jsp:include page="/include/resources_head.jsp"></jsp:include>
<style>
	/*페이지 헤더 색상 조정*/
	.page-header {
		background-color: #F9E0AE;
	}
	
	/* crumb 네비바 뒤로가기 */
	.page-header .breadcrumb{
		z-index: 0;
	}
	
	/* 전체 메인 컨텐츠 & 아래 여백 추가 */
	.root-container{
		margin-bottom: 10%;
		margin-top: 10%;
	}
	
	/* 중앙정렬  */
	.content-container{
		max-width: 100%;
		margin: 0 auto;
	}
	
	/* h1, 순서 - 아래 밑줄 / flex 로 배치 */
	.content-container .content-head {
		border-bottom: solid;
	  	border-color: #682c0e;
	  	display: flex;
	    justify-content: space-between;
	    align-items: flex-end;
	    margin-bottom: 30px;
	}
	
	/* h1 - 아래 패딩 제거 */
	.content-container .content-head h1{
	    margin-bottom: 0;
	}
	
	/* 현재 진행 상황 */
	.content-container .content-head .now{
		color: #FC8621;
		font-weight: bold;
	}
	
	/* form 내부 중앙정렬 */
	 .content-container .form-wrapper {
		display: flex;
	    justify-content: center;
	    font-size: 1rem;
	}
	
	/* 중앙 정렬 */
	.content-container .content-main{
		display: flex;
	    flex-direction: column;
	    align-items: flex-start;
	    margin: 100px 0;
	}
	
	/* id 입력 input, 버튼 일열로 나열 */
	.content-container .search-id-container {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	/* id 입력 input 사이즈 고정 */
	.content-container .search-id-container input{
		max-width: 400px;
	}
	
	/* id 입력 button 사이즈 고정 */
	.content-container .search-id-container .btn-container {
		width: max-content;
	}
	
	/* 다음 버튼 */
	.content-main .btn-next{
		width: -webkit-fill-available;
	    background-color: #C24914;
	    color: #F9E0AE;
	    font-weight: bold;
	    font-size: 1.0rem;
	    margin-top: 20px;
	}
	
	.content-main .btn-next:hover{
		background-color: #8c3712;
	}
	
	/* id 확인 버튼 */
	/* id 입력 button 사이즈 고정 */
	.content-main .btn-check{
		width: inherit;
		background-color: #c1c1c1;
	    color: black;
	    font-weight: bold;
	    font-size: 1.0rem;
	    margin-left: 5px;
	}
	
	.content-main .btn-check:hover {
		background-color: #949494;
		color: black;
	}
}
</style>
</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp"></jsp:include>
	
	<!-- 페이지 헤더 -->
	<section class="page-header page-header-modern page-header-md">
		<div class="container">
			<div class="row">
				<div class="col-md-12 align-self-center p-static order-2 text-center">
					<h1 class="text-dark font-weight-bold text-8 bold-family">Forgot password</h1>
					<span class="sub-title text-dark">You with DADOC</span>
				</div>
				<div class="col-md-12 align-self-center order-1">
					<ul class="breadcrumb d-block text-center">
						<li><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li class="active">Forgot password</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<div id="id_input_form" class="container root-container">
		<div class="content-container">
			<div class="content-head">
				<h1>비밀번호 찾기</h1>
				<div>
					<span class="now">01. 아이디 입력</span> > <span>02. 본인 확인</span> > <span>03. 비밀번호 재설정</span>
				</div>
			</div>
			<div class="form-wrapper">
				<form action="${pageContext.request.contextPath}/users/pwd/question.do" method="get">
					<div class="content-main">
						<p>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
						<div class="search-id-container">
							<input v-model="inputId" v-on:input="inputChange" 
									class="form-control form-control-lg" type="text" 
									name="inputId" placeholder="가입한 아이디 입력" />
							<div class="btn-container">
								<button v-on:click.prevent="isIdExist" class="btn btn-check">아이디 확인</button>
							</div>
						</div>
						<!-- id 존재가 확인되지 않으면, 다음으로 넘어갈 수 없다. -->
						<button type="submit" class="btn btn-next" ref="btnNext" disabled>다음</button>
					</div>
					
				</form>
			</div>
			
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
	<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
	
	<!-- vue -->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script>
		// webcontent 위치
		const base_url = "http://localhost:8888/dadoc";
		
		let inputId = new Vue({
			el: "#id_input_form",
			data: {
				base_url,
				inputId: '',
				isIdValid: false
			},
			methods: {
				//input 이 바뀌면 -> 이전에 실행한 isIdValid 는 무용지물이 되므로 false 로 바꿔준다.
				inputChange(){
					this.isIdValid = false;
					this.$refs.btnNext.disabled = true;
				},
				//id 가 존재하는지 알려줌
				isIdExist(){
					//Promise 객체 내부에서 사용할 vue 객체 this
					const self = this;
					
					//ajax 로 db 에 해당 id 가 존재하는지 check
					fetch(this.base_url + "/ajax/users/check_id.do?inputId="+self.inputId)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						// data : {"isExist" : true/false} 형태의 json
						//console.log(data);
						// id 가 매칭된다.
						if(data.isExist){
							//유효하다 : isValid -> true
							self.isIdValid = true;
							self.$refs.btnNext.disabled = false;
							//alert("존재하는 아이디 입니다. 다음으로 진행해주세요.");
							swal({
							  	title: "존재하는 아이디 입니다.",
							  	text: "다음으로 진행해주세요.",
							  	icon: "success",
							});
						}else{
							//유효하지 X : isIdValid -> false 
							self.isIdValid = false;
							self.$refs.btnNext.disabled = true;
							//alert("사용자를 찾을 수 없습니다. 다시 입력해주세요.");
							swal({
							  	title: "사용자를 찾을 수 없습니다.",
							  	text: "다시 입력해주세요.",
							  	icon: "warning",
							});
						}
					});
				}
			}
			
		});
	</script>
</body>
</html>