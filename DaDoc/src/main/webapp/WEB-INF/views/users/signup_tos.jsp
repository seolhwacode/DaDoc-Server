<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_tos.do</title>
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
	
	/* 전체 메인 컨텐츠 */
	.root-container{
		margin-bottom: 10%;
		margin-top: 10%;
	}
	
	/* 중앙정렬 & 아래 여백 추가 */
	.content-container{
		max-width: 600px;
		margin: 0 auto;
	}
	
	/* tos 사항들 사이 거리 띄우기 - bottom margin */
	.tos-wrapper{
		margin-bottom: 20px;
	}
	
	/* 사용 약관 - 아래 밑줄 */
	.content-container > h1{
		border-bottom: solid;
    	border-color: #682c0e;
	}
	
	/* input check box */
	input[type="checkbox"] {
		display: none;
	}
	
	/* 커서 손모양 & 글씨 크기 */
	label{
		cursor:pointer;
		font-size: 1.2rem;
	}
	
	/* 체크박스 모양 변경 - 클릭전 */
	input[type="checkbox"] + label {
		display: inline-block;
		background: url("https://image.flaticon.com/icons/png/512/907/907830.png") 0 0 no-repeat;
		background-size: cover;
		width: 24px;
		height: 24px;
		margin-right: 9px;
	    vertical-align: middle;
	}
	
	/* 체크박스 모양 변경 - 체크 후 */
	input[type="checkbox"]:checked + label {
		background: url("https://image.flaticon.com/icons/png/512/1828/1828640.png") no-repeat 0 0;
		background-size: cover;
	}
	
	/* 체크박스 hover */
	.check-box-wrapper label:hover {
		font-weight: bold;
	}
	
	/* 체크박스 글 아래로 안내려가게 하기 */
	.check-box-wrapper{
		display: flex;
		justify-content: flex-start;
	}
	
	/* 약관 text area */
	.tos-textarea-wrapper > textarea{
	    width: -webkit-fill-available;
	    resize: none;
	    /* border-radius: 0%; */
	    height: 200px;
	    /* border-color: #b3b3b3; */
	    border-width: 2px;
	    color: #464646;
	    font-size: 1rem;
	}
	
	/* 버튼 크기 & 정렬 */
	.tos-buttons{
		display: flex;
		justify-content: flex-start;
		margin-top: 30px;
	}
	
	/* 버튼을 가로 사이즈에 꽉차게 맞춤 */
	.tos-buttons button{
		width: -webkit-fill-available;
	}
	
	/* 취소 버튼 */
	#cancelBtn{
		background-color: #c1c1c1;
	    color: black;
	    font-weight: bold;
	    font-size: 1.2rem;
	    margin-right: 5px;
	}
	
	/* 취소 버튼 hover */
	#cancelBtn:hover {
		background-color: #949494;
		color: black;
	}

	/* 확인 버튼 */
	#submitBtn{
		background-color: #C24914;
	    color: #f9e0ae;
	    font-weight: bold;
	    font-size: 1.2rem;
	    margin-left: 5px;
	}
	
	/* 확인 버튼 hover */
	#submitBtn:hover{
		background-color: #8c3712;
		color: #f9e0ae;
	}
}
	
</style>
</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="signup" name="thisPage"/>
	</jsp:include>
	
	<!-- 페이지 헤더 -->
	<section class="page-header page-header-modern page-header-md">
		<div class="container">
			<div class="row">
				<div
					class="col-md-12 align-self-center p-static order-2 text-center">

					<h1 class="text-dark font-weight-bold text-8 bold-family">Sign Up</h1>
					<span class="sub-title text-dark">Join with DADOC</span>
				</div>

				<div class="col-md-12 align-self-center order-1">

					<ul class="breadcrumb d-block text-center">
						<li><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li class="active">Sign Up</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<!-- main content -->
	<div class="container root-container">
		<!-- 
			[ 나중에 css 추가할 때 할 것 ]
			1. 해당 check box 와 label 위에 마우스를 올리면(hover) 마우스가 손 모양으로 바뀌게
			2. 가운데 정렬
			3. textarea input 못하게 변경
			4. textarea 이쁘게 변경
		-->
		<div class="content-container">
			<h1>사용자 약관</h1>
			<div class="tos-container">
				<div class="tos-wrapper">
					<div class="check-box-wrapper">
						<div>
							<input type="checkbox" id="all" />
							<label for="all"></label>
						</div>
						<div>
							<label for="all">
								<span>다독 이용 약관 동의(필수), 개인정보 수집 및 동의(필수), 광고 수신 동의(선택)에 모두 동의합니다.</span>
							</label>
						</div>
					</div>
				</div>
				<div class="tos-wrapper">
					<div class="check-box-wrapper">
						<div>
							<input type="checkbox" id="one" />
							<label for="one"></label>
						</div>
						<div>
							<label for="one">
								<span>다독 이용 약관 동의<span>(필수)</span></span>
							</label>
						</div>
					</div>
					<div class="tos-textarea-wrapper">
						<textarea readonly>  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati quasi alias quisquam ipsa excepturi labore voluptatem ab tempore quo quibusdam est animi placeat hic aperiam nostrum quos ipsum a molestiae!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam esse voluptas fuga et quas consequuntur laboriosam alias quasi dolore animi aperiam autem distinctio beatae tempora tempore debitis sint excepturi eius?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur rem voluptate aspernatur quae quis provident sunt delectus beatae numquam reiciendis laboriosam molestiae cum quam voluptates nesciunt possimus maxime sit saepe.</textarea>
					</div>
				</div>
				<div class="tos-wrapper">
					<div class="check-box-wrapper">
						<input type="checkbox" id="two" />
						<label for="two"></label>
						<label for="two">
							<span>개인정보 수집 및 동의<span>(필수)</span></span>
						</label>
					</div>
					<div class="tos-textarea-wrapper">
						<textarea readonly>  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati quasi alias quisquam ipsa excepturi labore voluptatem ab tempore quo quibusdam est animi placeat hic aperiam nostrum quos ipsum a molestiae!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam esse voluptas fuga et quas consequuntur laboriosam alias quasi dolore animi aperiam autem distinctio beatae tempora tempore debitis sint excepturi eius?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur rem voluptate aspernatur quae quis provident sunt delectus beatae numquam reiciendis laboriosam molestiae cum quam voluptates nesciunt possimus maxime sit saepe.</textarea>	
					</div>
				</div>
				<div class="tos-wrapper">
					<div class="check-box-wrapper">
						<input type="checkbox" id="three" />
						<label for="three"></label>
						<label for="three">
							<span>광고 수신 동의(선택)</span>
						</label>
					</div>
					<div class="tos-textarea-wrapper">
						<textarea readonly>  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati quasi alias quisquam ipsa excepturi labore voluptatem ab tempore quo quibusdam est animi placeat hic aperiam nostrum quos ipsum a molestiae!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam esse voluptas fuga et quas consequuntur laboriosam alias quasi dolore animi aperiam autem distinctio beatae tempora tempore debitis sint excepturi eius?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur rem voluptate aspernatur quae quis provident sunt delectus beatae numquam reiciendis laboriosam molestiae cum quam voluptates nesciunt possimus maxime sit saepe.
						</textarea>
					</div>
				</div>
				<div class="tos-buttons">
					<button class="btn" id="cancelBtn">취소</button>
					<button class="btn" id="submitBtn">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
	<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
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
				//alert("필수 사항을 모두 체크해주세요.");
				swal({
				  	title: "필수 사항을 모두 체크해주세요.",
				  	icon: "warning",
				  	button: "확인",
				});
				return;
			}
			//(넘어옴)필수 체크박스 모두 체크 완료
			//3 번째 선태 체크박스는 선택이다. -> 이 사항을 get 방식으로 페이지에 전달할 것
			if(three.checked){
				//체크박스 선택 -> query string 추가
				location.href = "${pageContext.request.contextPath}/users/signup_form.do?isAdChecked=true";
			}else{
				//체크박스 선택 X -> query string X
				location.href = "${pageContext.request.contextPath}/users/signup_form.do?isAdChecked=false";
			}
		});
		
		//취소 버튼 클릭 -> home.do 로 돌아간다.
		document.querySelector("#cancelBtn").addEventListener("click", function(){
			location.href = "${pageContext.request.contextPath}/home.do";
		});
	</script>
</body>
</html>