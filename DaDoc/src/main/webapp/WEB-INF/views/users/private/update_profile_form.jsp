<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update_profile_form.do</title>
<!-- 외부 css 및 파일들 추가  -->
<jsp:include page="/include/resources_head.jsp"></jsp:include>
<!-- 사용자 페이지에서만 사용하는 공통 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/include/users/users_template.css">
<!-- 탈퇴 모달에서 사용되는 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/include/users/leave_modal.css">
<style>
	/*페이지 헤더 색상 조정*/
	.page-header {
		background-color: #F9E0AE;
	}
	
	/* crumb 네비바 뒤로가기 */
	.page-header .breadcrumb{
		z-index: 0;
	}
	
	/* 전체 메인 컨텐츠 & 아래 여백 추가 */
	.root-container{
		margin-bottom: 10%;
		margin-top: 10%;
	}
	
	/* 중앙정렬  */
	.content-container{
		max-width: 100%;
		margin: 0 auto;
	}
	
	/* 오른쪽 내부 - h1 - 아래 밑줄 */
	.content-container .right-content > h1{
		border-bottom: solid;
	  	border-color: #682c0e;
	}
	
	/* 오른쪽 내부 패딩 추가 */
	.right-content{
		padding-left: 30px;
	}
	
	/* 프로필 이미지가 출력되는 div : flex 로 정렬 */
	.right-content .profile-images-container{
		display: flex;
	    align-content: center;
	    justify-content: space-evenly;
	    flex-direction: row;
	    align-items: center;
	    margin: 80px 0;
	}
	
	/* 이미지가 출력되는 img 를 감싸는 div - 크기 fix 하기 */
	.right-content .profile-images-container .profile-image-wrapper{
	    width: 200px;
	    height: 200px;
	    border-radius: 50%;
	}
	
	/* 이미지가 출력되는 img 는 감싸는 div(profile-image-wrapper) 크기에 맞춰진다. */
	.right-content .profile-images-container .profile-image-wrapper img {
	    width: 100%;
	    height: 100%;
	    object-fit: contain;
	    border-radius: 50%;
	}
	
	/* 화살표 감싸는 div */
	.right-content .profile-images-container .arrow-wrapper{
		width: 100px;
	}
	
	/* 화살표 이미지 */
	.right-content .profile-images-container .arrow-wrapper img{
		width: 100%;
	    height: 100%;
	}
	
	/* 프로필 사진을 변경하는 3가지 버튼들 wrapper : 정렬 */
	.btn-container .image-change-btn-wrapper{
		display: flex;
		flex-direction: row;
		justify-content: center;
		margin-bottom: 20px;
	}
	
	/* 버튼 사이 간격 추가 */
	.btn-container .image-change-btn-wrapper button{
		margin: 0 5px;
		background-color: #f9e0ae;
	    color: #682c0e;
	    font-weight: bolder;
	    font-size: 1rem;
	}
	
	.btn-container .image-change-btn-wrapper button:hover{
		background-color: #ffb87b;
	}
	
	/* 프로필 사진 변경을 반영/삭제하는  2가지 버튼들 wrapper : 정렬 */
	.btn-container .submit-btn-wrapper{
		display: flex;
	    flex-direction: row;
	    justify-content: center;
	}
	
	/* 버튼 사이 간격 추가 */
	.btn-container .submit-btn-wrapper button{
		margin: 0 5px;
		background-color: #C24914;
	    color: #F9E0AE;
	    font-weight: bolder;
	    font-size: 1rem;
	}

	.btn-container .submit-btn-wrapper button:hover{
		background-color: #8c3712;
	}
	
	/* 이미지 삭제 버튼 */
	.btn-container .submit-btn-wrapper #deleteImage{
		background-color: #c1c1c1;
		color: black;
	}
	
	/* 이미지 삭제 버튼 hover */
	.btn-container .submit-btn-wrapper #deleteImage:hover{
		background-color: #949494;
	}
	
	/* 드래그 & 드롭 css */
	.drag-area{
		width: 100%;
		height: 300px;
		border: 2px dashed gray;
		border-radius: 20px;
		display: flex;
	    align-content: center;
	    justify-content: center;
	}
	
	/* 드래그 & 드롭 css - 아래 이미지 */
	.drag-area img{
		object-fit: contain;
	}
	
	/* modal 의 버튼 css - 업로드 버튼 */
	.modal-footer .upload-btn{
		background-color: #C24914;
	    color: #f9e0ae;
	    font-weight: bold;
	    font-size: 1.0rem;
	    margin-left: 5px;
	}
	
	/* modal 의 버튼 css - 업로드 버튼 : hover*/
	.modal-footer .upload-btn:hover{
		background-color: #8c3712;
		color: #f9e0ae;
	}
	
	/* modal 의 버튼 css - 취소 버튼 */
	.modal-footer .close-btn{
		background-color: #c1c1c1;
	    color: black;
	    font-weight: bold;
	    font-size: 1.0rem;
	    margin-right: 5px;
	}
	
	/* modal 의 버튼 css - 취소 버튼 : hover */
	.modal-footer .close-btn:hover{
		background-color: #949494;
		color: black;
	}
	
	/* 실제 db 제출하는 form 은 보이지 X */
	.profile-update-form-wrapper{
		display: none;
	}
	
	/* 기본 이미지 선택 모달 */
	/* #defaultProfiles .modal-body .default-img-wrapper img */
	/* 기본 이미지 선택 모달 - 내부 사진 flex 로 나열 */
	#defaultProfiles .modal-body{
		display: flex;
        align-content: center;
    	justify-content: space-between;
	}
	
	/* 기본 이미지 선택 모달 - 이미지 감싸는 div */
	#defaultProfiles .modal-body .default-img-wrapper{
		height: 150px;
	}
	
	/* 기본 이미지 선택 모달 - 이미지 감싸는 div - 선택됨 */
	#defaultProfiles .modal-body .default-img-wrapper img.selected{
		border: solid;
		border-color: #FC8621;
	}
	
	/* 기본 이미지 선택 모달 - 내부 이미지 */
	#defaultProfiles .modal-body .default-img-wrapper img{
		width: 100%;
	    height: 100%;
	    object-fit: contain;
	}
	
	

</style>
</head>
<body>
	<!-- navbar 추가 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="userInfo" name="thisPage"/>
	</jsp:include>
	
	<!-- 페이지 헤더 -->
	<section class="page-header page-header-modern page-header-md">
		<div class="container">
			<div class="row">
				<div
					class="col-md-12 align-self-center p-static order-2 text-center">
	
					<h1 class="text-dark font-weight-bold text-8 bold-family">Update Profile Image</h1>
					<span class="sub-title text-dark">You with DADOC</span>
				</div>
	
				<div class="col-md-12 align-self-center order-1">
	
					<ul class="breadcrumb d-block text-center">
						<li><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/users/private/info.do">User Information</a></li>
						<li class="active">Update Profile Image</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<!-- main content -->
	<div id="profile_upload_form" class="container root-container">
		<div class="content-container">
			<div class="row">
				<jsp:include page="/include/users/users_template.jsp">
					<jsp:param value="profileUpdate" name="myPage"/>
				</jsp:include>
				<!-- 오른쪽 실제 content -->
				<div class="col-md-9 right-content">
					<h1>프로필 사진 변경 폼</h1>
					<!-- 실제 프로필 이미지 출력 (현재, 변경된 것) -->
					<div class="profile-images-container">
						<!-- 이전 프로필 사진 -->
						<div class="profile-image-wrapper">
							<img v-bind:src="orignProfileSrc" alt="이전 프로필" />
						</div>
						<div class="arrow-wrapper">
							<img src="//pic.onlinewebfonts.com/svg/img_235742.png" alt="" />
						</div>
						<!-- 바뀔 프로필 사진 -->
						<div class="profile-image-wrapper">
							<img v-bind:src="changeProfileSrc" alt="변경될 프로필" />
						</div>
					</div>
					
					<%-- 프로필 이미지 선택 form --%>
					<form action="${pageContext.request.contextPath}/users/private/ajax_profile_upload.do" 
							method="post" ref="imageForm" id="imageForm" enctype="multipart/form-data">
						<div>
							<!-- 보이지 X : 아래 이미지 선택 click 일 때 눌러짐  / input 에 change 이벤트가 생기면 -> ajax 로 프로필 업로드 & 화면 변경 -->
							<input @change="imageUpload" v-show="false" type="file" name="image" id="image" ref="image"
								accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
						</div>			
					</form>
					<div class="btn-container">
						<div class="image-change-btn-wrapper">
							<button @click="imageClick" class="btn image-select-btn" id="imageSelect">이미지 선택</button>
							<button class="btn image-select-btn" data-toggle="modal" data-target="#dragAndDropModal">드래그 & 드롭</button>
							<button class="btn image-select-btn" data-toggle="modal" data-target="#defaultProfiles">기본 사진 선택</button>
						</div>
						<div class="submit-btn-wrapper">
							<button @click="deleteUploadImage" class="btn" type="reset" ref="deleteImage" id="deleteImage">사진 삭제</button>
							<button @click="submitForm" class="btn">변경하기</button>
						</div>
					</div>
					
					<!-- 실제 db update 를 위해서 제출할 form -->
					<div class="profile-update-form-wrapper">
						<form action="${pageContext.request.contextPath}/users/private/update_profile.do" 
								method="post" id="profile_update_form" ref="profile_update_form"
								@submit="deletePrevProfile">
							<input type="text" name="id" value="${ sessionScope.id }" />
							<input type="text" name="profile" v-model="changeProfile" />
						</form>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- drag & drop 으로 사진을 넣을 modal -->
		<!-- Modal -->
		<div class="modal fade" id="dragAndDropModal">
		  	<div class="modal-dialog modal-lg modal-dialog-centered">
		    	<div class="modal-content">
		      		<div class="modal-header">
		        		<h5 class="modal-title">파일 선택</h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		      		</div>
		      		<div class="modal-body">
		        		<div class="drag-area" @dragenter="dragenter"
		        				@dragover="dragover" @drop="drop">
		        			<!-- ** css 로 사진 위에 마우스 올리면 손가락으로 변하게 하기 -->
		        			<img id="DADImg" ref="DADImg" v-bind:src="DADImgSrc" alt="드래그&드롭 사진" />
		        		</div>
		      		</div>
		      		<div class="modal-footer">
		        		<button @click="resetDADModal" type="button" class="btn close-btn" data-dismiss="modal">닫기</button>
		        		<button @click="inputImgForm" type="button" 
		        				class="btn upload-btn" data-dismiss="modal">
		        				파일 업로드
		        		</button>
		      		</div>
		    	</div>
		  	</div>
		</div>
		
		<!-- 기본 프로필 사진을 넣을 modal -->
		<!-- Modal -->
		<div class="modal fade" id="defaultProfiles">
		  	<div class="modal-dialog modal-lg modal-dialog-centered">
		    	<div class="modal-content">
		      		<div class="modal-header">
		        		<h5 class="modal-title">기본 프로필 사진(4종)</h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		      		</div>
		      		<div class="modal-body">
	      				<div class="default-img-wrapper" 
	      						@click="selectDefault(index, $event)"
	      						v-for="(tmp, index) in defaultProfileSrcs"
	      					 	v-bind:key="index">
		      				<img v-bind:src="tmp" alt="" />
	      				</div>
		      		</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn close-btn" data-dismiss="modal">취소</button>
		        		<button @click="inputDefaultImgForm" type="button" 
		        				class="btn upload-btn" data-dismiss="modal">
		        				선택
		        		</button>
		      		</div>
		    	</div>
		  	</div>
		</div>
	</div>
	
	<!-- 탈퇴 모달 -->
	<jsp:include page="/include/users/leave_modal.jsp"></jsp:include>
	
	<!-- footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
	<!-- 외부에서 가져오는 js 파일 -->
	<jsp:include page="/include/resources_js.jsp"></jsp:include>
	
	<!-- vue -->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	
	<!-- 탈퇴 모달 js 파일 가져오기 -->
	<script src="${pageContext.request.contextPath}/include/users/leave_modal.js"></script>

	<!-- gura_util js 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>

	<script>
		let base_url = 'http://localhost:8888/dadoc';
		let profile_upload_form = new Vue({
			el: "#profile_upload_form",
			data: {
				base_url,
				//원래 선택 중이던 프로필 imagePath
				orignProfile: '',
				//원래 선택 중이던 프로필 사진의 출력을 위한 src 에 추가할 부분
				orignProfileSrc: '',
				//변경된 프로필 사진의 저장
				changeProfile: '',
				//변경된 프로필 사진의 출력을 위한 src 에 추가할 부분
				changeProfileSrc: '',
				//DAD 모달 보이는지 아닌지
				isShowDADModal: false,
				//drag & drop 으로 추가된 파일 object
				DADFiles: {},
				//drag & drop 으로 올린 파일 modal 에 img 로 출력 -> 추후에 css 추가하면서 기본 이미지 넣기
				DADImgSrc: '',
				//modal 에 넣는 기본 img src
				DADDefaultImgSrc: '',
				//기본 프로필 사진 4개
				defaultProfiles: [
					'/resources/images/profile01.png',
					'/resources/images/profile02.png',
					'/resources/images/profile03.png',
					'/resources/images/profile04.png',					
				],
				//기본 프로필 사진 src 경로
				defaultProfileSrcs: [
					base_url + '/resources/images/profile01.png',
					base_url + '/resources/images/profile02.png',
					base_url + '/resources/images/profile03.png',
					base_url + '/resources/images/profile04.png',
				],
				//defaultProfiles 중 1개의 값
				selectedDefault: '',
				//배열에서 index 번째에 선택된 것만 true 를 넣는다.
				defaultSelected: [ false, false, false, false ]
			},
			methods: {
				//실제 form 제출
				submitForm(){
					//제출할 form
					const form = this.$refs.profile_update_form;
					//form submit
					form.submit();
				},
				//upload 된 파일을 ajax 로 삭제하는 메소드
				ajaxDeleteUploadFile(uploadFile){
					console.log("삭제 파일 : " + uploadFile);
					ajaxPromise(this.base_url + "/users/private/ajax_profile_delete.do", "post", "imagePath=" + uploadFile);
				},
				//profile 을 update 할 때, 기존의 프로필 사진은 /upload 폴더 내부에서 삭제해야한다.
				deletePrevProfile(){
					//이전 프로필 사진과 현재 변경할 프로필 사진이 같으면 -> 삭제 X
					if(this.changeProfile == this.orignProfile){
						return;
					}
					//이전 프로필 사진(여기서는 this.orignProfile) 삭제
					this.ajaxDeleteUploadFile(this.orignProfile);
					//ajaxPromise(this.base_url + "/users/private/ajax_profile_delete.do", "post", "imagePath=" + this.orignProfile);
				},
				//선택한 기본 이미지를 db 에 저장할 profile_update_form 에 input & 화면 출력 한다.
				inputDefaultImgForm(index){
					//이전에 업로드된 프로필 사진이 있다면 -> 삭제
					//기본 프로필 사진이 X && 오리진과 변경된 값이 다르면 -> 삭제
					//indexOf(문자열) : 해당 문자열이 포함되 처음 index 를 리턴한다. 없다면, -1 을 리턴한다.
					//기본 프로필은 /resources/images/ 경로 아래에 있다.
					if(this.changeProfile.indexOf('/resources/') == -1 
							&& this.orignProfile != this.changeProfile){
						this.ajaxDeleteUploadFile(this.changeProfile);
						//ajaxPromise(this.base_url + "/users/private/ajax_profile_delete.do", "post", "imagePath=" + this.changeProfile);
					}
					//실제 전송할 form 의 model 에 데이터 넣기
					this.changeProfile = this.selectedDefault;
					//화면에 출력
					this.changeProfileSrc = this.base_url + this.changeProfile;
				},
				//선택한 기본 이미지를 저장
				selectDefault(index, event){
					//index : 해당 for 문의 index (0 ~ 3)
					this.selectedDefault = this.defaultProfiles[index];
					
					//전체 요소들 들고오기
					let imgWrappers = document.querySelectorAll(".default-img-wrapper img");
					
					//다른 요소들에서 'selected' class 지우기
					for(let i = 0; i < imgWrappers.length; i++){
						imgWrappers[i].classList.remove('selected');
					}					
					
					//selected class 추가
					event.target.classList.add('selected');
				},
				//drag & drop 으로 보이는 사진을 지운다. -> reset 시키기
				resetDADModal(){
					//modal 의 이미지 src 를 기본으로 만들기(+ 모양의 사진 예정)
					this.DADImgSrc = this.DADDefaultImgSrc;
				},
				//modal 에서 drag & drop 으로 추가한 파일을 form 에 input & upload & 화면에 출력
				inputImgForm(){
					//image input 의 참조값을 읽어와서, 해당 파일에 드래그 & 드롭으로 가져온 파일 정보를 담는다.
					this.$refs.image.files = this.DADFiles;
					//이미지 파일 upload 하기
					this.imageUpload();
					//modal 의 이미지 src 를 기본으로 만들기(+ 모양의 사진 예정)
					this.resetDADModal();
				},
				//파일 읽어들여서, upload 하지 않고 화면에 띄우기
				readImageFile(file){
					//vue 객체
					const self = this;
					const reader = new FileReader();
					//이미지 파일을 data url 형식으로 읽어들이기 - 비동기 처리
					reader.readAsDataURL(file);
					//다 읽었을때 실행할 함수 등록 
					//-> 비동기라서 그런가 this 로 하면 통하지 않았다. 그래서 self 를 사용해서 해결했다.
					reader.onload = function(e){
						//읽은 이미지 데이터 ( img 요소의 src 속성의 value 로 지정하면 이미지가 나온다. )
						self.DADImgSrc = e.target.result;
					}
				},
				//dragdrop 이벤트가 일어났을 때 실행할 함수 등록
				drop(e){
					e.preventDefault();
					//drop 된 파일의 여러가지 정보를 담고 있는 object
					const data = e.dataTransfer;
					//drop 된 파일 객체를 저장하고 있는 배열
					//배열 : 한 번에 여러개의 파일을 드래그 & 드롭 할 수 있다.
					const files = data.files;
					
					//upload 를 위해 DADFiles 에 넣기
					this.DADFiles = files;
					
					//drop 된 파일이 이미지 파일인지 여부 알아내기
					const reg = /image.*/;
					//파일은 하나이다.
					const file = files[0];
					
					//이미지 파일만 읽어들이기
					if(file.type.match(reg)){
						//이미지 파일 읽어들이기
						this.readImageFile(file);
					}
				},
				//dragover 이벤트가 일어났을 때 실행할 함수 등록
				dragover(e){
					//drop 이벤트까지 진행될 수 있도록 기본 동작을 막는다.
					e.preventDefault();
					// 이벤트 전파를 막는다. -> 불필요하게 부모 요소에까지 이벤트가 도달하지 않도록 한다.
					e.stopPropagation();
				},
				//dragenter 이벤트가 일어났을 때 실행할 함수
				dragenter(e){
					//drop 이벤트까지 진행될 수 있도록 기본 동작을 막는다.
					e.preventDefault();
					// 이벤트 전파를 막는다. -> 불필요하게 부모 요소에까지 이벤트가 도달하지 않도록 한다.
					e.stopPropagation();
				},
				//방금 선택하여 upload 된 이미지를 삭제한다.
				deleteUploadImage(){
					//기본 프로필 사진이 X && 오리진과 변경된 값이 다르면 -> 삭제
					//indexOf(문자열) : 해당 문자열이 포함되 처음 index 를 리턴한다. 없다면, -1 을 리턴한다.
					//기본 프로필은 /resources/images/ 경로 아래에 있다.
					if(this.changeProfile.indexOf('/resources/') == -1 
							&& this.orignProfile != this.changeProfile){
						this.ajaxDeleteUploadFile(this.changeProfile);
					}
					//ajaxPromise(this.base_url + "/users/private/ajax_profile_delete.do", "post", "imagePath=" + this.changeProfile);
					// 이전의 원래 이미지로 변경하기.
					this.changeProfile = this.orignProfile;
					this.changeProfileSrc = this.orignProfileSrc;
				},
				//input image 버튼을 click
				imageClick(){
					//input image 문서객체 참조해서 click 하기
					this.$refs.image.click();
				},
				//input 에 선택된 이미지를 upload
				imageUpload(){
					//이전에 선택하여 upload 한 파일은 삭제한다.
					//기본 프로필 사진이 X && 오리진과 변경된 값이 다르면 -> 삭제
					//indexOf(문자열) : 해당 문자열이 포함되 처음 index 를 리턴한다. 없다면, -1 을 리턴한다.
					//기본 프로필은 /resources/images/ 경로 아래에 있다.
					if(this.changeProfile.indexOf('/resources/') == -1 
							&& this.orignProfile != this.changeProfile){
						//삭제
						this.ajaxDeleteUploadFile(this.changeProfile);
					}
					
					//ref = imageForm form 의 참조값을 얻어온다.
					const form = this.$refs.imageForm;
					//vue 의 this 값을 가져온다.
					const self = this;
					//gura_util 의 ajaxFormPromise 를 사용하여 ajax 전송한다.
					ajaxFormPromise(form)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						// data => imagePath(/upload/실제파일이름)
						//changeProfileSrc 의 값을 가져온 데이터로 수정한다.
						self.changeProfileSrc = self.base_url + data.imagePath;
						self.changeProfile = data.imagePath;
					});
				}
			},
			created(){
				//처음에는 원래 가지고 있던 프로필 사진의 path 를 가지고 있다.
				this.orignProfile = '${ requestScope.profile }';
				//원본 파일의 파일 path 또한 저장
				this.changeProfile = this.orignProfile;
				// orignProfileSrc : 화면에 출력하기 위해, base_url 과 합쳐서 path 구성
				this.orignProfileSrc = this.base_url + this.orignProfile
				//changeProfileSrc : 화면에 출력하기 위해, base_url 과 합쳐서 path 구성
				this.changeProfileSrc = this.base_url + this.changeProfile;
				//modal 에 처음에는 기본 이미지로 출력
				this.DADImgSrc = this.DADDefaultImgSrc;
			}
		});
	</script>
</body>
</html>