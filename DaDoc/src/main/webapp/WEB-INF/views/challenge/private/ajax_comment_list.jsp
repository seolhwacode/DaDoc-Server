<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<c:forEach var="tmp" items="${commentList }">
				<c:choose>
					<c:when test="${tmp.deleted eq 'yes' }">
						<li>삭제된 댓글입니다.</li>
					</c:when>
					<c:otherwise>
						<c:if test="${tmp.num eq tmp.comment_group }">
							<li id="reli${tmp.num }" class="page-${pageNum }">
								<div class="comment">
									<div class="img-thumbnail img-thumbnail-no-borders d-none d-sm-block">
										<c:if test="${empty tmp.profile }">
										<img class="avatar" alt="" src="img/avatars/avatar-2.jpg">
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
											<span> <a href="#"><i class="fas fa-reply"></i> Reply</a></span>
											<c:if test="${tmp.writer eq id }">
											<a data-num="${tmp.num }" class="update-link" href="javascript:"><i class="icon-pencil icons"></i> Edit</a>
											<a data-num="${tmp.num }" class="delete-link" href="javascript:"><i class="icon-trash icons"></i> Delete</a>
											</c:if>
										</span>
									</span>
										<p id="pre${tmp.num }">${tmp.content }</p>
										<span class="date float-right">${tmp.regdate }</span>
								</div>
								</div>
							</li>												
						</c:if>
					
						<!-- 대댓글 -->
						<c:if test="${tmp.num ne tmp.comment_group }">
							<li id="reli${tmp.num }" class="page-${pageNum }">
								<div class="comment">
									<div class="img-thumbnail img-thumbnail-no-borders d-none d-sm-block">
										<c:if test="${empty tmp.profile }">
											<img class="avatar" alt="" src="img/avatars/avatar-2.jpg">
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
											<span> <a data-num="${tmp.num }" href="javascript:" class="reply-link"><i class="fas fa-reply"></i> Reply</a></span>
											<c:if test="${tmp.writer eq id }">
												<a data-num="${tmp.num }" class="update-link" href="javascript:"><i class="icon-pencil icons"></i> Edit</a>
												<a data-num="${tmp.num }" class="delete-link" href="javascript:"><i class="icon-trash icons"></i> Delete</a>
											</c:if>
										</span>
										<p id="pre${tmp.num }">${tmp.content }</p>
										<span class="date float-right">${tmp.regdate }</span>
									</div>
								</div>
							</li>
						</c:if>
				
						<!-- 대댓글 폼 -->
						<form id="reForm${tmp.num }" class="re-insert-form comment-form form-hide" action="comment_insert.do" method="post">
							<input type="hidden" name="ref_group" value="${dto.num }"/>
							<input type="hidden" name="target_id" value="${tmp.writer }"/>
							<input type="hidden" name="comment_group" value="${tmp.comment_group }"/>
							<textarea name="content"></textarea>
							<button type="submit">등록</button>
						</form>
						
						<!-- 수정 폼 -->
						<c:if test="${tmp.writer eq id }">
						<form id="updateForm${tmp.num }" class="update-form comment-form form-hide" action="comment_update.do" method="post">
							<input type="hidden" name="num" value="${tmp.num }" />
							<textarea name="content">${tmp.content }</textarea>
							<button type="submit">수정</button>
						</form>
						</c:if>
						
					</c:otherwise>
				</c:choose>	
			</c:forEach>

