/**
 * 탈퇴 모달 기능
 */

let leaveModal = new Vue({
	el: "#leaveModal",
	data:{
		base_url: 'http://localhost:8888/dadoc',
		//탈퇴 체크
		leaveCheckInput: ''
	},
	methods: {
		//모달의 내용 지우기
		clearModalInput(){
			this.leaveCheckInput = '';
		},
		//모달의 탈퇴 버튼 클릭
		clickLeave(e){
			//탈퇴하기를 제대로 입력 X
			if(this.leaveCheckInput !== '탈퇴하기'){
				//이벤트 막고
				e.preventDefault();
				//입력 틀림 알리기
				//alert("입력이 틀렸습니다.");
				swal({
					title: "잘못 입력하셨습니다.",
					icon: "warning",
				});
				//모달 내용 지우기
				this.clearModalInput();
				//탈퇴 X
				return;
			}
			//탈퇴 진행
			location.href = this.base_url + "/users/private/leave.do";
		}
	}
});