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
<button type="button" id="modalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  챌린지 신청하기
</button>

<!-- Modal -->
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

</body>
</html>

