<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd/input_id.do</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
</head>
<body>
	<!-- 디자인 : 네이버 비밀번호 찾기 처럼 해보자 -->
	<div id="id_input_form" class="container">
		<h1>비밀번호 찾기</h1>
		<form action="${pageContext.request.contextPath}/users/pwd/question.do" method="get">
			<p>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
			<div>
				<input v-model="inputId" v-on:input="inputChange" 
						class="form-control" type="text" 
						name="inputId" placeholder="가입한 아이디 입력" />
				<button v-on:click.prevent="isIdExist" class="btn btn-secondary">아이디 확인</button>
			</div>
			<!-- id 존재가 확인되지 않으면, 다음으로 넘어갈 수 없다. -->
			<button type="submit" v-bind:class="{ 'disabled': !isIdValid }" class="btn btn-primary">다음</button>
		</form>
	</div>
	
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
							alert("있음")
						}else{
							//유효하지 X : isIdValid -> false 
							self.isIdValid = false;
							alert("없음");
						}
					});
				}
			}
			
		});
	</script>
</body>
</html>