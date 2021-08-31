<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update_profile_form.do</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<style>
	.drag-area{
		width: 500px;
		height: 300px;
		border: 2px dashed gray;
		border-radius: 20px;
	}
</style>
</head>
<body>
	<div id="profile_upload_form" class="container">
		<h1>프로필 사진 변경 폼</h1>
		<!-- 이전 프로필 사진 -->
		<div>
			<img v-bind:src="orignProfileSrc" alt="이전 프로필" />
		</div>
		---> 
		<!-- 바뀔 프로필 사진 -->
		<div>
			<img v-bind:src="changeProfileSrc" alt="변경될 프로필" />
		</div>
		<%-- 프로필 이미지 선택 form --%>
		<form action="${pageContext.request.contextPath}/users/private/ajax_profile_upload.do" 
				method="post" ref="imageForm" id="imageForm" enctype="multipart/form-data">
			<div>
				<label for="image">이미지</label>
				<!-- 보이지 X : 아래 이미지 선택 click 일 때 눌러짐  / input 에 change 이벤트가 생기면 -> ajax 로 프로필 업로드 & 화면 변경 -->
				<input @change="imageUpload" v-show="false" type="file" name="image" id="image" ref="image"
					accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
			</div>			
		</form>
		<div>
			<button @click="imageClick" class="btn btn-light" id="imageSelect">이미지 선택</button>
			<button data-bs-toggle="modal" data-bs-target="#dragAndDropModal">이미지 드래그&드롭으로 추가하기</button>
			<button data-bs-toggle="modal" data-bs-target="#defaultProfiles">기본 사진에서 선택하기</button>
			<button @click="deleteUploadImage" class="btn btn-light" type="reset" ref="deleteImage" id="deleteImage">사진 삭제</button>
		</div>
		
		<!-- 실제 db update 를 위해서 제출할 form -->
		<div>
			<form action="${pageContext.request.contextPath}/users/private/update_profile.do" 
					method="post" id="profile_update_form"
					@submit="deletePrevProfile">
				<input type="text" name="id" value="${ sessionScope.id }" />
				<input type="text" name="profile" v-model="changeProfile" />
				<button type="submit">변경하기</button>
			</form>
		</div>
		
		<!-- drag & drop 으로 사진을 넣을 modal -->
		<!-- Modal -->
		<div class="modal fade" id="dragAndDropModal">
		  	<div class="modal-dialog modal-lg modal-dialog-centered">
		    	<div class="modal-content">
		      		<div class="modal-header">
		        		<h5 class="modal-title">파일 선택</h5>
		        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      		</div>
		      		<div class="modal-body">
		        		<div class="drag-area" @dragenter="dragenter"
		        				@dragover="dragover" @drop="drop">
		        			<!-- ** css 로 사진 위에 마우스 올리면 손가락으로 변하게 하기 -->
		        			<img id="DADImg" ref="DADImg" v-bind:src="DADImgSrc" alt="드래그&드롭 사진" />
		        		</div>
		      		</div>
		      		<div class="modal-footer">
		        		<button @click="resetDADModal" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        		<button @click="inputImgForm" type="button" 
		        				class="btn btn-primary" data-bs-dismiss="modal">
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
		        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      		</div>
		      		<div class="modal-body">
		      			<a @click="selectDefault(index)" 
		      					v-for="(tmp, index) in defaultProfileSrcs"
		      					 v-bind:key="index">
		      				<img v-bind:src="tmp" alt="" />
		      			</a>
		      		</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        		<button @click="inputDefaultImgForm" type="button" 
		        				class="btn btn-primary" data-bs-dismiss="modal">
		        				선택
		        		</button>
		      		</div>
		    	</div>
		  	</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
				selectedDefault: ''
			},
			methods: {
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
				selectDefault(index){
					//index : 해당 for 문의 index (0 ~ 4)
					this.selectedDefault = this.defaultProfiles[index];
				
					alert(this.selectedDefault);
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