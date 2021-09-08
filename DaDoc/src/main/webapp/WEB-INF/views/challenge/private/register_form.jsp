<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/challenge/register_form.jsp</title>
<!-- CSS only -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
<style>
	/*사진 추가 이미지 크기 수정*/
	#noImage{
		width: 150px;
		height: 150px;
	}
	
	/*삽입한 이미지 크기 수정*/
	#previewImage{
		width: 150px;
		height: 150px;
	}
</style>
</head>
<body>
<div class="container">

	<h1>헤더 넣을 자리입니다.</h1>
	<label for="prevImage" class="form-label">챌린지 대표 이미지</label>	
		<div class="imagePreview">
		<a id="imageLink" href="javascript:">
			<c:choose>
				<c:when test="${empty dto.image }">
					<img id="noImage" src="${pageContext.request.contextPath}/resources/images/noImage.png">
				</c:when>
				<c:otherwise>
					<img id="previewImage" src="${pageContext.request.contextPath}${dto.image}" />
				</c:otherwise>
			</c:choose>
		</a>
	</div>
	<form name="imgForm" action="${pageContext.request.contextPath}/challenge/private/ajax_image_upload.do" method="post" 
				id="imageForm" enctype="multipart/form-data">
		<input type="file" name="preImage" id="preImage" 
			accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
	</form>
	<form name="myForm" action="${pageContext.request.contextPath}/challenge/private/register.do" method="post" enctype="multipart/form-data" id="myForm" >
		<!-- type radio -->
		<label for="challengeType" class="form-label">타입</label>		
		<div class="form-check">
			<label class="form-check-label"  for="flexRadioDefault1">Premium</label>
			<input class="form-check-input" type="radio" id="premium" name="type" value="premium" />
		</div>
			<div class="form-check">
			<label class="form-check-label"  for="flexRadioDefault1">normal</label>
			<input class="form-check-input" type="radio" id="normal" name="type" value="normal" />
		</div>
		<!-- id -->
		<div>
			<label class="control-label form-check-label" for="writer"></label>
			<input class="control-label form-check-input" id="writer" name="writer" type="hidden" value="${sessionScope.id }" />
		</div>
		<!-- title input -->
		<div class="input-group mb-3">
	 		 <span class="input-group-text" id="basic-addon3">챌린지 이름</span>
	 		 <input type="text" class="form-control" id="title" name="title" aria-describedby="basic-addon3">
		</div>
		<!-- category radio -->
		<div class="category">
		<label for="challengeCategory" class="form-label">카테고리</label>		
		<div class="form-check">
			<label class="form-check-label" for="reading">Reading</label>
			<input class="form-check-input" type="radio" id="reading" name="category" value="reading" />
		</div>
		<div  class="form-check">
			<label class="form-check-label" for="writing">Writing</label>
			<input class="form-check-input" type="radio" id="writing" name="category" value="writing" />
		</div>
		<div  class="form-check"> 
			<label class="form-check-label" for="listening">Listening</label>
			<input class="form-check-input" type="radio" id="listening" name="category" value="listening" />
		</div>
		</div>
		
		<!-- 설명 form -->
		<div class="input-group">
		  <span class="input-group-text">챌린지 설명</span>
		  <textarea class="form-control"  type="text" id="description" name="description" aria-label="With textarea"></textarea>
		</div>
		
		<!-- 횟수 기간 -->
		<div class="period">
			<label for="challengePeriod" class="form-label">인증 횟수</label>			
			<select  class="form-select  form-select-sm" aria-label=".form-select-sm example" name="period" id="period">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
			</select>
		</div>	
		<!-- 이미지 업로드 -->
		<div>
			<input type="hidden" name="image" id="image" 
				accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>			
		</div>
		<!-- 시작일, 종료일 선택 -->
		<div class="date-choose">
			<label for="challengePeriod" class="form-label">인증 횟수</label>
			<div>
				<label for="startDate">시작일</label>
				<input type="date" id="startDate" name="startDate" />
			</div>
			<div>
				<label for="endDate">종료일</label>
				<input type="date" id="endDate" name="endDate" />
			</div>
		</div>
		<div class="subBtn">
		<button class="btn btn-success" type="submit">등록</button>
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//프로필 이미지 링크를 클릭하면
	document.querySelector("#imageLink").addEventListener("click",function(){
		//input type = "file"을 강제로 클릭
		document.querySelector("#preImage").click();
	});
	//이미지를 선택했을 때 실행할 함수 등록
	document.querySelector("#preImage").addEventListener("change",function(){
		let form=document.querySelector("#imageForm");
		
		//ajax로 폼 전송
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			let img=`<img id="previewImage" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			document.querySelector("#imageLink").innerHTML=img;
			//input name="image"요소의 value값으로 이미지 경로 넣어주기
			document.querySelector("input[name=image]").value=data.imagePath;
		});
	});
	
</script>
</body>
</html>