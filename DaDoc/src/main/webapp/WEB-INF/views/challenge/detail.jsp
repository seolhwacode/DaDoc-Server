<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/detail.jsp</title>
<%-- bootstrap --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
   <div class="card mb-3">
      <img class="card-img-top" src="${pageContext.request.contextPath}${dto.imagePath}"/>
      <div class="card-body">
         <p class="card-text">${dto.num}</p>
         <p class="card-text">by <strong>${dto.writer}</strong></p>
         <p><small>${dto.regdate}</small></p>
         <p><small>${dto.description}</small></p>
         <p><small>${dto.period}</small></p>
      </div>
   </div>
   <!-- 인증샷 사진 출력 -->
   	<div class="row">
		<c:forEach var="tmp" items="${photoList }">
			<div class="col-6 col-md-4 col-lg-3">
         		<div class="card mb-3">
	               		<div class="img-wrapper">
	                  		<img class="card-img-top" src="${pageContext.request.contextPath }${tmp.imagePath}" />
	               		</div>
            		<div class="card-body">
            		</div>
         		</div>
      		</div>
		</c:forEach>
   	</div>
   <nav>
      <ul class="pagination justify-content-center">
         <c:choose>
         	<c:when test="${dto.prevNum ne 0 }">
         		<li class="page-item mr-3">
               		<a class="page-link" href="${pageContext.request.contextPath}/gallery/detail.do?num=${dto.prevNum}">&larr; Prev</a>
            	</li>
         	</c:when>
         	<c:otherwise>
         		<li class="page-item disabled mr-3">
               		<a class="page-link" href="javascript:">Prev</a>
            	</li>
         	</c:otherwise>
         </c:choose>
         <c:choose>
         	<c:when test="${dto.nextNum ne 0 }">
         		<li class="page-item">
               		<a class="page-link" href="${pageContext.request.contextPath}/gallery/detail.do?num=${dto.nextNum}">Next &rarr;</a>
            	</li>
         	</c:when>
         	<c:otherwise>
         		<li class="page-item disabled">
               		<a class="page-link" href="javascript:">Next</a>
            	</li>
         	</c:otherwise>
         </c:choose>         
      </ul>
   </nav>      
</div>
</div>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
		  인증샷 업로드
		</button>
		
		<!-- 인증하기 Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">인증하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<a href="javascript:" id="photoLink">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square-dotted" viewBox="0 0 16 16">
  					<path d="M2.5 0c-.166 0-.33.016-.487.048l.194.98A1.51 1.51 0 0 1 2.5 1h.458V0H2.5zm2.292 0h-.917v1h.917V0zm1.833 0h-.917v1h.917V0zm1.833 0h-.916v1h.916V0zm1.834 0h-.917v1h.917V0zm1.833 0h-.917v1h.917V0zM13.5 0h-.458v1h.458c.1 0 .199.01.293.029l.194-.981A2.51 2.51 0 0 0 13.5 0zm2.079 1.11a2.511 2.511 0 0 0-.69-.689l-.556.831c.164.11.305.251.415.415l.83-.556zM1.11.421a2.511 2.511 0 0 0-.689.69l.831.556c.11-.164.251-.305.415-.415L1.11.422zM16 2.5c0-.166-.016-.33-.048-.487l-.98.194c.018.094.028.192.028.293v.458h1V2.5zM.048 2.013A2.51 2.51 0 0 0 0 2.5v.458h1V2.5c0-.1.01-.199.029-.293l-.981-.194zM0 3.875v.917h1v-.917H0zm16 .917v-.917h-1v.917h1zM0 5.708v.917h1v-.917H0zm16 .917v-.917h-1v.917h1zM0 7.542v.916h1v-.916H0zm15 .916h1v-.916h-1v.916zM0 9.375v.917h1v-.917H0zm16 .917v-.917h-1v.917h1zm-16 .916v.917h1v-.917H0zm16 .917v-.917h-1v.917h1zm-16 .917v.458c0 .166.016.33.048.487l.98-.194A1.51 1.51 0 0 1 1 13.5v-.458H0zm16 .458v-.458h-1v.458c0 .1-.01.199-.029.293l.981.194c.032-.158.048-.32.048-.487zM.421 14.89c.183.272.417.506.69.689l.556-.831a1.51 1.51 0 0 1-.415-.415l-.83.556zm14.469.689c.272-.183.506-.417.689-.69l-.831-.556c-.11.164-.251.305-.415.415l.556.83zm-12.877.373c.158.032.32.048.487.048h.458v-1H2.5c-.1 0-.199-.01-.293-.029l-.194.981zM13.5 16c.166 0 .33-.016.487-.048l-.194-.98A1.51 1.51 0 0 1 13.5 15h-.458v1h.458zm-9.625 0h.917v-1h-.917v1zm1.833 0h.917v-1h-.917v1zm1.834-1v1h.916v-1h-.916zm1.833 1h.917v-1h-.917v1zm1.833 0h.917v-1h-.917v1zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
					</svg>
		      	</a>
				<form action="${pageContext.request.contextPath}/challenge/photoShot_upload.do" method="post" 
							id="photoShotForm" enctype="multipart/form-data">
					<input type="file" name="image" id="image" 
						accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
					<input type="hidden" name="id" id="id" value="hungry" />
					<input type="hidden" name="challengeTitle" id="challengeTitle" value="${dto.title}" />
					<input type="hidden" name="num" id="num" value="${dto.num }" />
		      		<input type="hidden" name="period" id="period" value="${dto.period }" />
		   
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="submit" class="btn btn-primary">인증샷 업로드</button>
		      </div>
		      </form>
		      </div>
		    </div>
		  </div>
		</div>

	<!-- Button trigger modal -->
	<button type="button" id="modalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
 	 챌린지 신청하기
	</button>

	<!-- 챌린지 신청 Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut ipsam voluptate fugiat tenetur amet quidem quae fugit aliquid suscipit eos omnis natus praesentium. Cupiditate voluptatem voluptas magnam quia molestias dignissimos.
	        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati ullam maiores accusantium eligendi quo explicabo sit error dicta! Labore ipsa ut voluptatum eius similique delectus quae distinctio. A architecto recusandae?
	        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum molestias sequi consequuntur a vitae omnis quis ipsum eaque possimus inventore esse repellendus sit reprehenderit laudantium voluptatem blanditiis expedita quasi nemo.
	        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit praesentium nulla ad quisquam doloremque possimus illum deleniti magnam non quaerat sequi quis ut sit veniam voluptatum necessitatibus porro iste similique?
	      </div>
      <div class="form-check">
  			<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
  			<label class="form-check-label" for="flexCheckChecked">
   		 	모두 동의합니다.
  			</label>
		</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <form action="${pageContext.request.contextPath}/challenge/insertChallenger.do" method="post" >
        <input type="hidden" name="id" id="id" value="hungry" />
        <input type="hidden" name="challengeTitle" id="challengeTitle" value="${dto.title}" />
        <input type="hidden" name="period" id="period" value="${dto.period}" />
        <button type="submit" class="btn btn-primary">신청</button>
        </form>
      </div>
    </div>
  </div>
  </div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>  
<script>
//프로필 이미지 링크를 클릭하면 이미지 클릭하면 업로드 시킬 수 있게 한다.
document.querySelector("#photoLink").addEventListener("click", function(){
	// input type="file" 을 강제 클릭 시킨다. 
	document.querySelector("#image").click();
});

</script>
</body>
</html>

