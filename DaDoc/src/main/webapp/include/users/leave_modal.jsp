<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 탈퇴 모달 -->
<!-- Modal -->
<div class="modal fade" id="leaveModal" tabindex="-1" role="dialog" aria-labelledby="formModalLabel" aria-hidden="true">
  	<div class="modal-dialog modal-md modal-dialog-centered">
    	<div class="modal-content">
      		<div class="modal-header">
        		<h3 class="modal-title">탈퇴 확인</h3>
        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      		</div>
      		<div class="modal-body">
        		<div>
        			<div>
        				<p>정말로 탈퇴하시겠습니까?</p>
        				<p>탈퇴를 원하시면 아래 입력란에 <span class="important">탈퇴하기</span>를 입력해주세요.</p>
        			</div>
        			<div>
        				<input type="text" class="form-control form-control-lg" 
        						v-model="leaveCheckInput" placeholder="빈칸 없이, 정확하게 입력해주세요."/>
        			</div>
        		</div>
      		</div>
      		<div class="modal-footer">
        		<button @click="clearModalInput" type="button" 
        				class="btn leave-cancel-btn" data-dismiss="modal">
        				취소
        		</button>
        		<button @click="clickLeave" type="button" 
        				class="btn leave-btn" data-dismiss="modal">
        				탈퇴
        		</button>
      		</div>
    	</div>
  	</div>
</div>