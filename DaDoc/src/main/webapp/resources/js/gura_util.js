//javascript 파일
/*
	ajaxPromise("요청 url", "요청 method", query string or object)
	와 같은 형식으로 사용하고, 
	Promise type 을 return 해주는 함수
	
	url : "xxx.jsp"
	method : "get" or "post"
	data : object or query string
*/
function ajaxPromise(url, method, data){
	//만일 필요한 값이 전달 되지 않으면 기본값을 method 와 data 에 넣어준다. 
  	if(method == undefined || method == null){
    	method="GET";
  	}
  	if(data == undefined || data == null){
  		data={};
  	}
  	
  	let queryString;
  	if(typeof data == "string"){
     	queryString=data;
  	}else{
     	queryString=toQueryString(data);
  	}
  
  	// Promise 객체를 담을 변수 만들기 
  	let promise;
  	if(method=="GET" || method=="get"){//만일 GET 방식 전송이면 
     	//fetch() 함수를 호출하고 리턴되는 Promise 객체를 변수에 담는다. 
     	promise=fetch(url+"?"+queryString);
  	}else if(method=="POST" || method=="post"){//만일 POST 방식 전송이면
     	//fetch() 함수를 호출하고 리턴되는 Promise 객체를 변수에 담는다. 
    	promise=fetch(url,{
        	method:"POST",
        	headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
        	body:queryString
     	});
  	}
	return promise;
}

//함수의 인자로 ajax 전송할 폼의 참조값을 넣어주면 알아서 ajax 전송되도록 하는 함수
function ajaxFormPromise(form){
	const url = form.getAttribute("action");
	const method = form.getAttribute("method");

	// Promise 객체를 담을 변수 만들기 
	let promise;
	
	//이미지 전송
	if(form.getAttribute("enctype") == "multipart/form-data"){
		let data = new FormData(form);
		//fetch() 함수가 return 하는 Promise 객체
		promise = fetch(url, {
			method:"post",
			body:data
		});
		// Promise 객체 리턴 (이 아래는 실행X)
		return promise;
	}
	
	//이미지가 아닌 다른 파일 - 이미지 전송에서는 queryString 이 필요가 없다.
	const queryString = new URLSearchParams(new FormData(form)).toString();
	
	if(method=="GET" || method=="get"){//만일 GET 방식 전송이면 
	   //fetch() 함수를 호출하고 리턴되는 Promise 객체를 변수에 담는다. 
	   promise=fetch(url+"?"+queryString);
	}else if(method=="POST" || method=="post"){//만일 POST 방식 전송이면
	   //fetch() 함수를 호출하고 리턴되는 Promise 객체를 변수에 담는다. 
	   promise=fetch(url,{
	      method:"POST",
	      headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
	      body:queryString
	   });
	}
	return promise;
}

//함수의 인자로 요청 url 과 ajax 전송할 내용이 있는 input 요소의 참조값을 전달하면 ajax 전송해주는 함수
function ajaxInputPromise(url, input){
	const type = input.getAttribute("type");
	const name = input.getAttribute("name");
	let promise;
	//input type == "file" 인 경우
	if(type == "file"){
		let data = new FormData();
		data.append(name, input.files[0]);
		promise = fetch(url, {
			method:"post",
			body:data
		});
	}else{
		const name = input.getAttribute("name");
		//쿼리 전송할 쿼리 문자열 구성
		const queryString = name + "=" + encodeURIComponent(input.value);
		promise = fetch(url, {
			method:"post",
		    headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
		    body:queryString
		});
	}
	return promise;
}


//인자로 전달하는 object 를 이용해서 query  문자열을 만들어서 리턴해주는 함수
function toQueryString(obj){
  	//빈배열을 일단 만든다.
  	let arr=[];
  	//반복문 돌면서 obj 에 있는 정보를 "key=value" 형태로 만들어서 배열에 저장한다.
  	for(let key in obj){
     	//value 는 인코딩도 해준다. 
     	let tmp=key+"="+encodeURIComponent(obj[key]);
     	arr.push(tmp);
  	}
  	//query 문자열을 얻어낸다
  	let queryString=arr.join("&");
  	//결과를 리턴해준다.
  	return queryString;
}

//인자로 전달하는 문자열에 opts object 에 있는 내용을 연결해서 문자열 얻어내는 함수
function render(template, opts) {
	return new Function(
	    'return new Function (' + Object.keys(opts).reduce((args, arg) => args += '\'' + arg + '\',', '') + '\'return `' + template.replace(/(^|[^\\])'/g, '$1\\\'') + '`;\'' +
	    ').apply(null, ' + JSON.stringify(Object.keys(opts).reduce((vals, key) => vals.push(opts[key]) && vals, [])) + ');'
	)();
}