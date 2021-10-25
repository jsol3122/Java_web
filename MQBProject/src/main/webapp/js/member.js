// 자바스크립트 이용 방법
/*function checkWrite(){
	document.getElementById("nameDiv").innerText = ""; // 초기화 작업
	document.getElementById("idDiv").innerText = "";
	document.getElementById("pwdDiv").innerText = "";
	document.getElementById("repwdDiv").innerText = "";
	
	if(document.writeForm.name.value == "")
		document.getElementById("nameDiv").innerText = "이름을 입력하세요";
	else if(document.writeForm.id.value == "")
		document.getElementById("idDiv").innerText = "아이디를 입력하세요";
	else if(document.writeForm.pwd.value == "")
		document.getElementById("pwdDiv").innerText = "비밀번호를 입력하세요";
	else if(document.writeForm.pwd.value != document.writeForm.repwd.value)
		document.getElementById("repwdDiv").innerText = "비밀번호가 맞지 않습니다";
	else document.writeForm.submit();
}*/

function checkId(){
	document.getElementById("idDiv").innerText = "";
	
	if(document.getElementById("id").value == "")
		document.getElementById("idDiv").innerText = "아이디를 입력하세요";
	else{
		window.open("/mvcmember/member/checkId.do?id="+document.getElementById("id").value, "중복","width=400 height=200 top=300 left=700");
	}
}

function reCheckId(){
	location.href="/mvcmember/member/checkId.do?id="+document.getElementById('reId').value;
}

function idInsert(){
	// id값을 idInsert(id)처럼 받아와서 js 쓰는 방법
	// window.opener.document.getElementById("id").value = id;
	// window.opener.document.getElementById("id").value = document.getElementById("savedId").value; 로 hidden인풋상자 써도 됨
		
	/*제이쿼리에서 사용 방법 - 최상위창의 아이디=id인 곳의 value를 아이디=savedId의 값으로 설정하기도 가능 */
	$('#id', opener.document).val($('#savedId').val()); 
	$('#check', opener.document).val($('#savedId').val()); // 중복체크 버튼 눌렀는지 확인
	window.close();
}

// 우편번호 
$('#zipcodeBtn').click(function(){
	window.open("/mvcmember/member/checkPost.do", "우편번호", "width=500 height=500 top=200 left=700");
});


$('.addressA').click(function(){
	// alert($(this).text()); -- 주소값 출력
	// alert($(this).parent().prev().text()); -- 우편번호 출력
	
	$('#zipcode', opener.document).val($(this).parent().prev().text()); // 우편번호 넣기
	$('#addr1', opener.document).val($(this).text()); // 주소 넣기
	window.close();
	$('#addr2', opener.document).focus();
});

function checkPostClose(zipcode, address){
	opener.writeForm.zipcode.value = zipcode;
	opener.writeForm.addr1.value = address;
	window.close();
	opener.writeForm.addr2.focus();
}

// 제이쿼리 이용 방법 - onload방식 ( 파일 load되자마자 함수 읽기 )
$(function(){
	// 회원가입 버튼 클릭 시
	$('#writeBtn').click(function(){
		$('#nameDiv').empty(); /*초기화 작업*/
		$('#idDiv').empty();
		$('#pwdDiv').empty();
		$('#repwdDiv').empty();
		
		/*if($('#name').val() == '') $('#nameDiv').html('이름 입력'); -- id속성 사용*/
		if($('input[name=name]').val() == '') { // name속성 사용
			$('#nameDiv').html('이름 입력'); 
			$('#name').focus(); // 커서가 이름에 가도록 focus설정
		}else if($('input[name=id]').val() == '') 
			$('#idDiv').html('아이디 입력');
		else if($('input[name=pwd]').val() == '') 
			$('#pwdDiv').html('비밀번호 입력');
		else if($('input[name=pwd]').val() != $('input[name=repwd]').val()) 
			$('#repwdDiv').html('비밀번호 맞지 않음');
		else if($('#id').val() != $('#check').val()) 
			$('#idDiv').html('중복체크를 해주세요');
		else 
			$('form[name=writeForm]').submit();
	});
	
	// 로그인 버튼 클릭 시
	$('#loginBtn').click(function(){
		$('#idDiv').empty();
		$('#pwdDiv').empty();
		
		if($('input[name=id]').val() == '') {
			$('#idDiv').html('아이디 입력');
			$('#id').focus(); 
		}else if($('input[name=pwd]').val() == '') 
			$('#pwdDiv').html('비밀번호 입력');
		/*else $('nav').load("/member/login.do", function(){ - target이용했었음
			$('form[name=loginForm]').submit();
			location.href="/MQBProject/index.jsp";
			location.reload();
		});*/
		else{ // submit하면 페이지가 이동되어버리니까
			$.ajax({
				url: '/MQBProject/member/login.do', // 컨트롤서블릿파일로 요청이 갔음
				type: 'post',
				data: 'id='+$('#id').val()+'&pwd='+$('#pwd').val(),
				dataType: 'text', // 로그인 성공실패를 받아와서 처리할예정 (여기서안받고 다른데서 처리해도 됨)
				success: function(data){
					// 서블릿을 거쳐서 자바파일로 간 요청은, jsp파일로 응답이 서블릿을 거쳐서 포워딩된 형태로 돌아옴
					alert(data); // 확인용
					data = data.trim();
					
					if(data == 'ok'){
						location.href = 'index.jsp'
					}else if(data == 'fail'){
						$('#loginResult').text('아이디 또는 비밀번호가 맞지 않습니다')
						$('#loginResult').css('color', 'red')
						$('#loginResult').css('font-size', '15pt')
						$('#loginResult').css('font-weight', 'bold')
					}
				},
				error: function(err){
					console.log(err);
				}
			});
		}
	});
});
