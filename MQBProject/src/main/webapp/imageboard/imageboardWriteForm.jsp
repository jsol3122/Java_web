<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- input file 을 넣고 이용하려면 폼에 enctype을 잡아줘야 함 / get방식 안되고 post방식만 가능 -->
<form id="imageWriteForm" enctype="multipart/form-data" method="post" action="/MQBProject/imageboard/imageboardWrite.do"> 
	<h3>이미지 등록</h3>
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">상품코드</td>
			<td><input type="text" name="imageId" id="imageId" size="41" value="img_"></td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">상품명</td>
			<td><input type="text" name="imageName" id="imageName" size="41" placeholder="상품명 입력">	</td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">단가</td>
			<td><input type="text" name="imagePrice" id="imagePrice" size="41" placeholder="단가 입력"></td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">개수</td>
			<td><input type="text" name="imageQty" id="imageQty" size="41" placeholder="개수입력">	</td>
		</tr>
		<tr>
			<td style="text-align: center; font-size: 13px; width: 80px;">내용</td>
			<td><textarea name="imageContent" id="imageContent" rows="10" cols="40" placeholder="내용입력"></textarea>	</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="file" name="img1" id="img1" value="파일 선택">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="file" name="img2" id="img2" value="파일 선택">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="imageWriteBtn" value="이미지등록">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$('#imageWriteBtn').click(function(){
		$('#imageWriteForm').submit();
	});
</script>