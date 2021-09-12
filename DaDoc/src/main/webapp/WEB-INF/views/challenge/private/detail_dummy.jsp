<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 댓글  목록-->
	<div id="comments" class="post-block mt-5 post-comments">
		<!-- 댓글 개수 및 구분선 -->
		<h4 class="comment-line">  comments</h4>
		<!-- 구분선 -->
		<hr class="solid my-5">
		<!-- 댓글 목록 -->
		<ul class="comments">
			<c:forEach var="tmp" items="${commentList }">
				<c:choose>
					<c:when test="${tmp.deleted eq 'yes' }">
						<li>삭제된 댓글입니다.</li>
					</c:when>
					<c:otherwise>
					<li>
						<c:if test="${tmp.num eq tmp.comment_group }">
							<li id="reli${tmp.num }">
								<div class="comment">
									<div class="img-thumbnail img-thumbnail-no-borders d-none d-sm-block">
										<c:if test="${empty tmp.profile }">
										<img src="${pageContext.request.contextPath}/resources/images/DADOC.png">
										</c:if>
										<c:if test="${not empty tmp.profile }">
											<img class="profile-image" src="${pageContext.request.contextPath}${tmp.profile }"/>
										</c:if>
									</div>
								<div class="comment-block">
									<div class="comment-arrow"></div>
									<span class="comment-by">
										<strong>${tmp.writer }</strong>
											<c:if test="${tmp.num ne tmp.comment_group }">
												@<i>${tmp.target_id }</i>
											</c:if>
										<span class="float-right">
											<span> <a data-num="${tmp.num }" href="javascript:" class="reply-link"><i class="fas fa-reply" id="reply-icon">Reply</i></a></span>
											<c:if test="${tmp.writer eq id }">
											<i class="icon-pencil icons edit-icons"><a data-num="${tmp.num }" class="update-link" href="javascript:">Edit</a></i> 
											<i class="icon-trash icons"><a data-num="${tmp.num }" class="delete-link" href="javascript:">Delete</a></i>
											</c:if>
										</span>
									</span>
									<p id="pre${tmp.num }">${tmp.content }</p>
									<span class="date float-right">${tmp.regdate }</span>
								</div>
								</div>
							</li>												
						</c:if>
						
						<ul class="comments reply">
						<!-- 대댓글 -->
						<c:if test="${tmp.num ne tmp.comment_group }">
							<li id="reli${tmp.num }">
								<div class="comment">
									<div class="img-thumbnail img-thumbnail-no-borders d-none d-sm-block">
										<c:if test="${empty tmp.profile }">
											<img src="${pageContext.request.contextPath}/resources/images/DADOC.png">
										</c:if>
										<c:if test="${not empty tmp.profile }">
											<img class="profile-image" src="${pageContext.request.contextPath}${tmp.profile }"/>
										</c:if>								
									</div>
									<div class="comment-block">
										<div class="comment-arrow"></div>
										<span class="comment-by">
											<strong>${tmp.writer }</strong>
											<c:if test="${tmp.num ne tmp.comment_group }">
												@<i>${tmp.target_id }</i>
											</c:if>
											<span class="float-right">
											<span><i class="fas fa-reply"><a data-num="${tmp.num }" href="javascript:" class="reply-link">Reply</a></i></span>
											<c:if test="${tmp.writer eq id }">
												<i class="icon-pencil icons"><a data-num="${tmp.num }" class="update-link" href="javascript:">Edit</a></i> 
												<i class="icon-trash icons"><a data-num="${tmp.num }" class="delete-link" href="javascript:">Delete</a></i>
											</c:if>
										</span>
										<p id="pre${tmp.num }">${tmp.content }</p>
										<span class="date float-right">${tmp.regdate }</span>
									</div>
								</div>
							</li>
						</c:if>
					</ul>
				</li>
						<!-- 답 댓글 폼 -->
							<div class="post-leave-comment">
								<form id="reForm${tmp.num }" class="contact-form p-4 re-insert-form form-hide" action="comment_insert.do" method="POST">			
									<div class="form-row">
										<div class="form-group col-lg-6">
											<label class="required font-weight-bold text-dark">댓글 작성</label>
											<input type="text" value="" data-msg-required="댓글을 작성해주세요." maxlength="200" class="form-control" name="content" id="content" required>
											<input type="hidden" name="title" value="${dto.title }" />
											<input type="hidden" name="ref_group" value="${dto.num }"/>
											<input type="hidden" name="target_id" value="${tmp.writer }"/>
											<input type="hidden" name="comment_group" value="${tmp.comment_group }"/>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col mb-0">
											<input type="submit" value="등록" class="btn btn-outline btn-rounded btn-quaternary mb-2" data-loading-text="Loading...">
										</div>
									</div>
								</form>
							</div>
						<!-- 수정 폼 -->
						<c:if test="${tmp.writer eq id }">
							<div class="post-block post-leave-comment">
								<form id="updateForm${tmp.num }" class="contact-form p-4 form-hide" action="comment_update.do" method="POST">			
										<div class="form-row">
											<div class="form-group col-lg-6">
												<label class="required font-weight-bold text-dark">댓글 작성</label>
												<input type="text" value="${tmp.content }" data-msg-required="댓글을 작성해주세요." maxlength="200" class="form-control" name="content" id="content" required>
												<input type="hidden" name="num" value="${tmp.num }" />
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col mb-0">
												<input type="submit" value="수정" class="btn btn-outline btn-rounded btn-quaternary mb-2" data-loading-text="Loading...">
											</div>
										</div>
								</form>
							</div>
						</c:if>
						
					</c:otherwise>
				</c:choose>	
			</c:forEach>
		</ul>
	</div>
	
	<div class="comment-more">
		<button href="javascript:" type="button" id="moreBtn" class="btn btn-outline btn-rounded btn-quaternary mb-2">더보기</button>
	</div>
			
	<div class="post-block post-leave-comment">
		<form id="contactForm" class="contact-form p-4" action="comment_insert.do" method="POST">			
				<div class="form-row">
					<div class="form-group col-lg-6">
						<label class="required font-weight-bold text-dark">댓글 작성</label>
						<input type="text" value="" data-msg-required="댓글을 작성해주세요." maxlength="200" class="form-control" name="content" id="content" required>
						<!-- 원글의 글번호가 댓글의 ref_group 번호가 된다. -->
						<input type="hidden" name="ref_group" value="${dto.num }"/>
						<!--  원글의 title도 보내준다. -->
						<input type="hidden" name="title" value="${dto.title }" />
						<!-- 원글의 작성자가 댓글의 대상자가 된다. -->
						<input type="hidden" name="target_id" value="${dto.writer }"/>	
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col mb-0">
						<input type="submit" value="등록" class="btn btn-outline btn-rounded btn-quaternary mb-2" data-loading-text="Loading...">
					</div>
				</div>
		</form>
	</div>
	
	<script>
	//[댓글 페이지네이션]
	//댓글의 현재 페이지 번호를 관리할 변수를 만들고 초기값 1 대입하기
	let currentPage=1;
	//마지막 페이지는 totalPageCount다.
	let lastPage=${totalPageCount};
	//moreBtn의 참조값을 담아준다.
	const moreBtn = document.querySelector("#moreBtn");
	//전체 댓글 개수가 출력할 댓글의 수보다 많으면 더보기 버튼을 보이게 한다.
	if(${totalRow} >= ${pageRowCount}){
		moreBtn.style.display='block';
	}
	//더보기 버튼을 누르면
	moreBtn.addEventListener("click",function(){
		//현재 댓글 페이지를 1 증가 시키고
		currentPage++;
		//현재 페이지가 마지막 페이지보다 작거나 같을 때 댓글 페이지 출력하기
		if(currentPage <= lastPage){
			/*
			해당 페이지의 내용을 ajax 요청을 통해서 받아온다.
			"pageNum=xxx&num=xxx" 형식으로 GET 방식 파라미터를 전달한다. 
			*/
			ajaxPromise("ajax_comment_list.do", "post", "pageNum="+currentPage+"&num=${dto.num}")
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				//data 에는 html text 가 들어있다.
				document.querySelector(".comments ul")
				.insertAdjacentHTML("beforeend", data);
				
				//새로 추가된 댓글 li 요소 안에 있는 a 요소를 찾아서 이벤트 리스너 등록 하기 
				addUpdateListener(".page-"+currentPage+" .update-link");
				addDeleteListener(".page-"+currentPage+" .delete-link");
				addReplyListener(".page-"+currentPage+" .reply-link");
				//새로 추가된 댓글 li 요소 안에 있는 댓글 수정폼에 이벤트 리스너 등록하기
				addUpdateFormListener(".page-"+currentPage+" .update-form");
			});
			
			if(currentPage == lastPage){
				moreBtn.style.display="none";
			}
		}
	});
	

	//[인자로 전달되는 선택자를 이용해서 이벤트 리스너를 등록하는 함수들]
		
	//detail.jsp 페이지 로딩 시점에 만들어진 1 페이지에 해당하는 댓글에 이벤트 리스너 등록하기
	addUpdateFormListener(".update-form");
	addUpdateListener(".update-link");
	addDeleteListener(".delete-link");
	addReplyListener(".reply-link");
	
	//댓글 수정 폼 열기
	function addUpdateListener(sel){
		//댓글 수정 링크의 참조값을 배열에 담아오기
		//sel은 '.page-xxx .update-link' 형식의 내용이다.
		let updateLinks=document.querySelectorAll(sel);
		for(let i=0; i<updateLinks.length; i++){
			updateLinks[i].addEventListener("click", function(){
				//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value값을 읽어온다.
				const num = this.getAttribute("data-num"); //댓글의 글 번호
				const form = document.querySelector("#updateForm"+num);
				let current = this.innerText;
				if(current=='Edit'){
					form.style.display='block';
					this.innerText='Cancel';
				}else if(current=='Cancel'){
					this.innerText='Edit';
					form.style.display='none';
				}
				
			});
		}
	}
	
	//댓글 수정하기
	function addUpdateFormListener(sel){
		//댓글 수정 폼의 참조값을 배열에 담아오기
		let updateForms=document.querySelectorAll(sel);
		for(let i=0; i<updateForms.length; i++){
			//폼에 submit 이벤트가 일어났을 때 호출되는 함수 등록
			updateForms[i].addEventListener("submit", function(e){
				//submit이벤트가 일어난 form의 참조값을 form이라는 변수에 담기
				const form=this;
				//폼 제출을 막는다.
				e.preventDefault();
				//이벤트가 일어난 폼을 ajax 전송하도록 한다.
				ajaxFormPromise(form)
				.then(function(response){
					return response.json();
				})
				.then(function(data){
					if(data.isSuccess){
						const num=form.querySelector("input[name=num]").value;
						const content=form.querySelector("textarea[name=content]").value;
						//수정폼에 입력한 value 값을 pre 요소에도 출력하기
						document.querySelector("#pre"+num).innerText=content;
						form.style.display="none";
					}
				});
			});
		}
	}
	
	//댓글 삭제
	function addDeleteListener(sel){
		//댓글 삭제 링크의 참조값을 배열에 담아오기
		let deleteLinks=document.querySelectorAll(sel);
		for(let i=0; i<deleteLinks.length; i++){
			deleteLinks[i].addEventListener("click", function(){
				//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다.
				const num = this.getAttribute("data-num"); //댓글의 글 번호
				//댓글 삭제 확인 confirm 메소드
				swal({
					  	title: "댓글을 삭제하시겠습니까?",
					  	icon: "warning",
					  	buttons: true,
					  	dangerMode: true
				})
				.then(function(isDelete){
					if(isDelete){
						//gura_util.js에 있는 함수를 이용해서 ajax요청
						ajaxPromise("comment_delete.do", "post", "num="+num)
						.then(function(response){
							return response.json();
						})
						.then(function(data){
							//만일 삭제 성공이면
							if(data.isSuccess){
								//댓글이 있는 곳에 삭제된 댓글입니다를 출력해준다.
								document.querySelector("#reli"+num).innerText='삭제된 댓글입니다.';
							}
						});
					}
				});
			
			});
		}
	}
	
	//답댓글 폼 열기
	function addReplyListener(sel){
		let replyLinks=document.querySelectorAll(sel);
		//반복문 돌면서 모든 링크에 이벤트 리스너 함수 등록
		for(let i=0; i<replyLinks.length; i++){
			replyLinks[i].addEventListener("click", function(){
				const num=this.getAttribute("data-num");
				const form = document.querySelector("#reForm"+num);
				let current = this.innerText;
				if(current=='Reply'){
					form.style.display='block';
					this.innerText='Cancel';
				}else if(current=='Cancel'){
					this.innerText='Reply';
					form.style.display='none';
				}
			});
		}
	</script>
	
</body>
</html>