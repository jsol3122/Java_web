 /* 그냥 input버튼으로 만들었을 때는 .click으로 이벤트 걸었지만, submit버튼으로 만들었을때는 이렇게 이벤트 설정*/
$(function(){ /* 폼태그 자체에 이벤트 걸어줌*/
	$('#join').submit(function(){
		var user_id = $('input[name=user_id]').val();
		if(!user_id){ /* 값이 없으면 user_id는 false인 점을 이용*/
			alert('아이디를 입력하세요');
			$('input[name=user_id]').focus();
			return false; 
		}
		if(!$('input[name=user_pw]').val()){
			alert('비밀번호를 입력하세요');
			$('input[name=user_pw]').focus();
			return false; 
		}
		if(!$('input[name=juminno]').val()){
			alert('주민번호를 입력하세요');
			$('input[name=juminno]').focus();
			return false; /* else를 안해줘서 모든게 다 적용되니까 다 return false 써줬음 */
		}
		
		if(!$('input[name=gender]').is(':checked')){
			alert('성별을 선택하세요');
			$('input[name=gender]:eq(0)').attr('checked', true); /* attribute : 속성을 부여하기 */
			//$('input[name=gender]:eq(0)').prop('checked', true); 로 써도 동일결과 / attr()과 prop()차이 잘 알아야 함
			return false;
		}
		
		if(!$('input[name=email]').val()){
			alert('이메일을 입력하세요');
			$('input[name=email]').focus();
			return false;
		}
		
		if(!$('input[name=url]').val()){
			alert('홈페이지를 입력하세요');
			$('input[name=url]').focus();
			return false;
		}
		
		if(!$('input[name=hpno]').val()){
			alert('핸드폰 번호를 입력하세요');
			$('input[name=hpno]').focus();
			return false;
		}
		
		if(!$('input[name=hobby]').is(':checked')){ /* 취미체크박스에 하나도 선택 안한경우 */
			alert('취미를 선택하세요');
			$('input[name=hobby]:eq(0)').attr('checked',true);
			return false;
		}
		
		/* select의 자식인 option에서 선택된 게 있으면 가져오는데, 선택된거의 index()가 1보다 작을떄 */
		if($('select[name=job] > option:selected').index() < 1){
			alert('직업을 선택하세요');
			$('select[name=job] > option:eq(0)').attr('selected', true);
			return false;
		}
		
		// 입력한 회원정보를 화면에 출력
		var user_id = $('input[name=user_id]').val();
		var user_pw = $('input[name=user_pw]').val();
		var juminno = $('input[name=juminno]').val();
		var gender = $('input[name=gender]:checked').val();
		var email = $('input[name=email]').val();
		var url = $('input[name=url]').val();
		var hpno = $('input[name=hpno]').val();
		var job = $('select[name=job] > option:selected').val();
		var hobby = $('input[name=hobby]:checked'); // 체크된 값을 다가져옴
		var hobby_val = "";
		hobby.each(function(){ // .each는 반복문(=for문) / 가져온 체크된값들을 가지고 반복문돌림
			hobby_val += $(this).val() + ","; // $(this)는 반복문 안에서 hobby안에 포함된 개체 하나하나
		});
		
		var result = '<ul>';
		result += '<li>아이디 : '+ user_id +'</li>';
		result += '<li>비밀번호 : '+ user_pw +'</li>';
		result += '<li>주민번호 : '+ juminno +'</li>';
		result += '<li>성별 : '+ gender +'</li>';
		result += '<li>이메일 : '+ email +'</li>';
		result += '<li>홈페이지 : '+ url +'</li>';
		result += '<li>핸드폰 : '+ hpno +'</li>';
		result += '<li>취미 : '+ hobby_val +'</li>';
		result += '<li>직업 : '+ job +'</li>';
		result += '</ul>';
		
		$('body').html(result);
		
		return false; /* action타고 가는거 막아버린 것 */
	});
});
















