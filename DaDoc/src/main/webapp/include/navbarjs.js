/**
 * 네비게이션바 js
 */
//navbar
// When the user scrolls the page, execute myFunction
// 스크롤이 움직일 때마다 네비게이션 바의 위치를 검사하여 class ".nav-sticky" 를 추가, 제거를 진행한다.
window.onscroll = function() {
	scrollStickyCheck();
}

// Get the navbar
// navbar 의 객체를 가져온다.
const navbar = document.getElementById("navbar");

// Get the offset position of the navbar
// 네비게이션 바의 offsetTop 가져오기
let sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
// 네비게이션 바의 위치를 검사하여 class ".nav-sticky" 를 추가, 제거를 진행한다.
function scrollStickyCheck() {
	if (window.pageYOffset >= sticky) {
		navbar.classList.add("nav-sticky")
  	} else {
  		navbar.classList.remove("nav-sticky");
  	}
}