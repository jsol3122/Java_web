//아이디 중복 체크
//$('#writeForm #id').change(function(){});
$('#writeForm #id').focusout(function(){ //포커스가 나올때
   $('#writeForm #idDiv').empty();
   
   if($('#writeForm #id').val()=='') {
		$('#writeForm #idDiv').html('먼저 아이디를 입력하세요'); 
		$('#writeForm #idDiv').css('color', 'magenta');
   }else{
      $.ajax({
        url: '/MQBProject/member/checkId.do',
		type: 'post',
		data: 'id='+$('#writeForm #id').val(), // {'id': $('#writeForm #id').val())} 같이 JSON형식으로 보내도 됨
		dataType: 'text',
		success: function(data){
			data = data.trim();
			
			if(data == 'exist'){
				$('#writeForm #idDiv').html('사용 불가능');
				$('#writeForm #idDiv').css('color', 'red');
			}else if(data == 'non_exist'){
				$('#writeForm #idDiv').html('사용 가능');
				$('#writeForm #idDiv').css('color', 'blue');
				
				// 아이디 사용 가능한 경우 hidden박스에 값 저장하고, 중복체크 완료 확인용으로 사용
				$('#writeForm #check').val($('#writeForm #id').val());
			}
		},
		error: function(err){
			console.log(err);
		}
      });
   }
}); 

// 우편번호 
$('#zipcodeBtn').click(function(){
	window.open("/MQBProject/member/checkPost.do", "우편번호", "width=500 height=500 top=200 left=700");
});

$('#checkPostSearchBtn').click(function(){
	$.ajax({
		url: '/MQBProject/member/checkPostSearch.do',
		type: 'post',
		data: $('#checkPostForm').serialize(), // 각 요소는 name속성을 통해 가져옴
		dataType: 'json', // list로 받아와야 하는데 적절한게 이것뿐
		success: function(data){
			// alert(JSON.stringify(data)); -- 확인용
			
			$('#zipcodeTable tr:gt(2)').remove(); // 테이블에서 맨 위 3줄 빼고 나머지는 검색누를때마다 초기화
			
			$.each(data.list, function(index, items){
				var address = items.sido+' '
							+ items.sigungu+' '
							+ items.yubmyundong+' '
							+ items.ri+' '
							+ items.roadname+' '
							+ items.buildingname;
				
				// undefined라는 내용을 g(=global,전체)에서 찾아서 ''으로 바꾸기
				address = address.replace(/undefined/g, ''); 
				
				$('<tr/>').append($('<td/>',{ // td태그 안의 내용
					align: 'center',
					text: items.zipcode
				})).append($('<td/>',{
					colspan: 3,
				}).append($('<a/>',{
					href: '#',
					text: address,
					class: 'addressA'
				}))).appendTo($('#zipcodeTable'));
			}); // each
			
			// 주소 클릭하면 회원가입 폼으로 값 이동시키기
			$('.addressA').click(function(){ 
				// alert($(this).text()); -- 주소값 출력
				// alert($(this).parent().prev().text()); -- 우편번호 출력
	
				$('#zipcode', opener.document).val($(this).parent().prev().text()); // 우편번호 넣기
				$('#addr1', opener.document).val($(this).text()); // 주소 넣기
				window.close();
				$('#addr2', opener.document).focus();
			});
		},
		error: function(err){
			console.log(err);
		}
	});
});

// 제이쿼리 이용 방법 - onload방식 ( 파일 load되자마자 함수 읽기 )
$(function(){
	// 회원가입 버튼 클릭 시
	$('#writeBtn').click(function(){
		$('#nameDiv').empty(); /*초기화 작업*/
		$('#writeForm #idDiv').empty();
		$('#writeForm #pwdDiv').empty();
		$('#repwdDiv').empty();
		
		/*if($('#name').val() == '') $('#nameDiv').html('이름 입력'); -- id속성 사용*/
		if($('input[name=name]').val() == '') { // name속성 사용
			$('#nameDiv').html('이름 입력'); 
			$('#name').focus(); // 커서가 이름에 가도록 focus설정
		}else if($('#writeForm #id').val() == '') 
			$('#writeForm #idDiv').html('아이디 입력');
		else if($('#writeForm #pwd').val() == '') 
			$('#writeForm #pwdDiv').html('비밀번호 입력');
		else if($('#writeForm #pwd').val() != $('#writeForm #repwd').val()) 
			$('#repwdDiv').html('비밀번호 맞지 않음');
		else if($('#writeForm #id').val() != $('#check').val()) 
			$('#writeForm #idDiv').html('중복체크를 해주세요');
		else{
			//$('form[name=writeForm]').submit();
			$.ajax({
				url: '/MQBProject/member/write.do',
				type: 'post',
				data: $('#writeForm').serialize(),
				// dataType: 'text', - 생략가능 ( 여기생략 = success의 data도 생략 )
				success: function(){
					alert('회원가입을 축하합니다 XD');
					location.href='/MQBProject/index.jsp';
				},
				error: function(err){
					console.log(err);
				}				
			});
		}
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
					// alert(data); -- 확인용
					data = data.trim();
					
					if(data == 'ok'){
						location.href = '/MQBProject/index.jsp'
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
