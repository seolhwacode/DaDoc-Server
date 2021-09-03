<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/challenge/register_form.jsp</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
<div class="container">

	<h1>챌린지 신청 폼입니다.</h1>
	<form action="${pageContext.request.contextPath}/challenge/private/update.do" method="post" enctype="multipart/form-data" id="myForm" >
		<input type="hidden" name="num" id="num" value="${dto.num }"  />
		<!-- type radio -->
		<p>-----타입 정하기-----</p>
		<div>
			<label class="control-label form-check-label" for="premium">Premium</label>
			<input class="form-control form-check-input" type="radio" id="premium" name="type" value="premium" />
		</div>
		<div>
			<label class="control-label form-check-label" for="normal">Normal</label>
			<input class="form-control form-check-input" type="radio" id="normal" name="type" value="normal" selected />
		</div>
		<div>
			<label class="control-label form-check-label" for="writer"></label>
			<input class="control-label form-check-input" id="writer" name="writer" type="hidden" value="${sessionScope.id }" />
		</div>
		<!-- title input -->
		<p>-----챌린지 이름-----</p>
		<div>
			<label class="control-label" for="title">title</label>
			<input class="control-label" id="title" name="title" type="text" value="${dto.title }"/>
		</div>
		<!-- category radio -->
		<p>-----카테고리-----</p>
		<div class="form-check">
			<label class="control-label form-check-label" for="reading">Reading</label>
			<input class="form-control form-check-input" type="radio" id="reading" name="category" value="reading" ${dto.category eq 'reading' ? 'selected' : '' } />
		</div>
		<div  class="form-check">
			<label class="control-label form-check-label" for="writing">Writing</label>
			<input class="form-control form-check-input" type="radio" id="writing" name="category" value="writing" ${dto.category eq 'writing' ? 'selected' : '' } />
		</div>
		<div  class="form-check"> 
			<label class="control-label form-check-label" for="listening">Listening</label>
			<input class="form-control form-check-input" type="radio" id="listening" name="category" value="listening" ${dto.category eq 'listening' ? 'selected' : '' } />
		</div>
		<!-- 설명 form -->
		<p>-----설명-----</p>
		<div>
			<label class="control-label" for="description">Description</label>
			<input class="form-control" type="text" id="description" name="description" value="${dto.description }" />
		</div>
		<!-- 횟수 기간 -->
		<p>-----횟수-----</p>
		<div>
			<select  class="form-select" multiple aria-label="multiple select example" name="period" id="period">
				<option value="1" ${dto.period eq '1' ? 'selected' : '' }>1</option>
				<option value="2" ${dto.period eq '2' ? 'selected' : '' }>2</option>
				<option value="3" ${dto.period eq '3' ? 'selected' : '' }>3</option>
				<option value="4" ${dto.period eq '4' ? 'selected' : '' }>4</option>
				<option value="5" ${dto.period eq '5' ? 'selected' : '' }>5</option>
				<option value="6" ${dto.period eq '6' ? 'selected' : '' }>6</option>
				<option value="7" ${dto.period eq '7' ? 'selected' : '' }>7</option>
			</select>
		</div>
		<!-- 시작일, 종료일 선택 -->
		<p>-----시작일, 종료일-----</p>
		<div>
			<label for="startDate">Start Date</label>
			<input type="date" id="startDate" name="startDate" value="${dto.startDate }" />
		</div>
		<div>
			<label for="endDate">endDate</label>
			<input type="date" id="endDate" name="endDate" value=${dto.endDate }/>
		</div>
		<button class="btn btn-success" type="submit">등록</button>
	</form>
</div>
<script>
/* 	document.querySelector("#myForm").addEventListener("submit", function(e){
		e.preventDefault();
		let img = document.querySelector("#image").value;
		console.log(img);
	}); */
</script>
</body>
</html>