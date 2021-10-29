$(function(){
	$.ajax({
		url: '/MQBProject/board/getBoardList.do',
		type: 'post',
		data: 'pg='+$('#pg').val(),
		dataType: 'json', // list에 글목록을 받아와야 하는데, list형은 받아올 수 없으니 json으로 받아옴
		success: function(data){
			// alert(JSON.stringify(data)); -- 확인용
			
			// 반복문 돌려서 존재하는 글 갯수만큼 테이블에 행 추가
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
				})).append($('<td/>',{
					align: 'left',
				}).append($('<a>',{
					href: '#',
					text: items.subject,
					class: 'subjectA'					
				}))).append($('<td/>',{
					align: 'center',
					text: items.id
				})).append($('<td/>',{
					align: 'center',
					text: items.hit
				})).append($('<td/>',{
					align: 'center',
					text: items.logtime
				})).appendTo($('#boardListTable'));
			});
			
			$('.subjectA').click(function(){
				if(data.sessionId == null){
					alert('먼저 로그인하세요');
				}else{
					$(this).attr('href','/MQBProject/board/boardView.do?seq='+$(this).parent().prev().text()+'&pg='+$('#pg').val());
				}
			});
			
		},
		error: function(err){
			console.log(err);
		}
	});
});