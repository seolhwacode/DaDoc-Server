<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/signup_tos.do</title>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>사용자 약관 페이지</h1>
		<!-- 
			[ 나중에 css 추가할 때 할 것 ]
			1. 해당 check box 와 label 위에 마우스를 올리면(hover) 마우스가 손 모양으로 바뀌게
			2. 가운데 정렬
			3. textarea input 못하게 변경
			4. textarea 이쁘게 변경
		-->
		<ul>
			<li>
				<input type="checkbox" id="all" />
				<label for="all">다독 이용 약관 동의(필수), 개인정보 수집 및 동의(필수), 광고 수신 동의(선택)에 모두 동의합니다.</label>
			</li>
			<li>
				<input type="checkbox" id="one" />
				<label for="one">다독 이용 약관 동의(필수)</label>
				<br />
				<textarea name="" id="" cols="30" rows="10">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati quasi alias quisquam ipsa excepturi labore voluptatem ab tempore quo quibusdam est animi placeat hic aperiam nostrum quos ipsum a molestiae!
				</textarea>
			</li>
			<li>
				<input type="checkbox" id="two" />
				<label for="two">개인정보 수집 및 동의(필수)</label>
				<br />
				<textarea name="" id="" cols="30" rows="10">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati quasi alias quisquam ipsa excepturi labore voluptatem ab tempore quo quibusdam est animi placeat hic aperiam nostrum quos ipsum a molestiae!
				</textarea>			
			</li>
			<li>
				<input type="checkbox" id="three" />
				<label for="three">광고 수신 동의(선택)</label>
				<br />
				<textarea name="" id="" cols="30" rows="10">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati quasi alias quisquam ipsa excepturi labore voluptatem ab tempore quo quibusdam est animi placeat hic aperiam nostrum quos ipsum a molestiae!
				</textarea>
			</li>
		</ul>
		<button id="cancelBtn">취소</button>
		<button id="submitBtn">확인</button>	
	</div>
	
	<script>
		//다른 checkbox 들 가져오기
		const one = document.querySelector("#one");
		const two = document.querySelector("#two");
		const three = document.querySelector("#three");
		
		//모든 이용 약관에 동의하는 checkbox 클릭 -> 자동으로 다른 모든 checkbox 들을 
		document.querySelector("#all").addEventListener("click", function(){
			//체크됨 -> 모든 체크박스 다 checked 상태로 만들기
			if(this.checked){
				one.checked = true;
				two.checked = true;
				three.checked = true;
			}else{
				//체크 해제 -> 모든 체크박스 다 checked 상태 해제
				one.checked = false;
				two.checked = false;
				three.checked = false;
			}
		});
	
		//확인 버튼 클릭
		document.querySelector("#submitBtn").addEventListener("click", function(){
			//필수 체크박스의 checked 를 검사하여, 둘 다 checked 상태여야한다.
			//-> 하나라도 checked 아닐 때 -> alert : 필수 사항을 모두 체크해야함을 알림
			if(!(one.checked && two.checked)){
				alert("필수 사항을 모두 체크해주세요.");
				return;
			}
			//(넘어옴)필수 체크박스 모두 체크 완료
			//3 번째 선태 체크박스는 선택이다. -> 이 사항을 get 방식으로 페이지에 전달할 것
			if(three.checked){
				//체크박스 선택 -> query string 추가
				location.href = "${pageContext.request.contextPath}/user/signup_form.do?adChecked=true";
			}else{
				//체크박스 선택 X -> query string X
				location.href = "${pageContext.request.contextPath}/user/signup_form.do";
			}
		});
		
		//취소 버튼 클릭 -> home.do 로 돌아간다.
		document.querySelector("#cancelBtn").addEventListener("click", function(){
			location.href = "${pageContext.request.contextPath}/home.do";
		});
	</script>
</body>
</html>