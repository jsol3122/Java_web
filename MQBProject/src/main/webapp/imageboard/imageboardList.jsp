<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	a{
		text-decoration: none;
		color: black;
	}
	
	a:hover{
		text-decoration: underline;
	}
	
	table a:hover{
		color: limegreen;
	}

	#imageboardListTable{
		width: 100%;
		border-top: 2px solid #483D8B;
		/* border-collapse: collapse; */
	}
	
	#imageboardListTable #title th{
		border-bottom: 2px solid #483D8B;
		font-size: 20px;
		height: 50px;
		color: #483D8B;
		background-color: aliceblue;
	}
	
	#imageboardListTable td{
		border-bottom: 1px solid #483D8B;
		height: 30px;
		font-size: 18px;
		color: black;
		padding: 15px 0 10px;
	}
	
	#imageboardPagingDiv{
		width: 100%; 
		text-align: center;
		font-size: 20px;
	}
	
	#currentPaging{
		color: red;
		text-decoration: underline;
		cursor: pointer;
	}
	
	#paging{
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
</style>

<input type="hidden" id="pg" value="${pg }" /> 

<table id="imageboardListTable" cellspacing="0" cellpadding="5">
	<tr id="title">
		<th>글번호</th> 
		<th width="200px">이미지</th>
		<th>상품명</th>
		<th>단가</th>
		<th>개수</th>
		<th>합계</th>
	</tr>
</table>

<br><br>

<div id="imageboardPagingDiv"></div>
 
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url: '/MQBProject/imageboard/getImageboardList.do',
			type: 'post',
			data: 'pg='+$('#pg').val(),
			dataType: 'json',
			success: function(data){
				console.log(JSON.stringify(data)); // 확인용
				
				$.each(data.list, function(index, items){
					$('<tr/>').append($('<td/>',{
						align: 'center',
						text: items.seq,
					})).append($('<td/>',{
						align: 'center',
						}).append($('<img>',{
							src: '../storage/'+items.image1,		
							alt: '음식사진',
							width: '200px',
							height: '200px'
					}))).append($('<td/>',{
						align: 'center',
						text: items.imageName
					})).append($('<td/>',{
						align: 'center',
						text: items.imagePrice
					})).append($('<td/>',{
						align: 'center',
						text: items.imageQty
					})).append($('<td/>',{
						align: 'center',
						text: items.imageQty*items.imagePrice
					})).appendTo($('#imageboardListTable'));
					
				}); // each
				
				$('#imageboardPagingDiv').html(data.boardPaging);
				
			},
			error: function(err){
				console.log(err);
			}
		});
	});
	
	function boardPaging(param_pg){ 
		location.href = '/MQBProject/imageboard/imageboardList.do?pg='+param_pg;
	}
</script>