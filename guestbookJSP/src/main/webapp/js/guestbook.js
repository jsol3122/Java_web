function checkGuestbookWrite(){
	document.getElementById("subjectDiv").innerText = '';
	document.getElementById("contentDiv").innerText = '';
	
	if(document.guestForm.subject.value == '')
		document.getElementById("subjectDiv").innerText = "제목을 입력하세요";
	else if(document.guestForm.content.value == '')
		document.getElementById("contentDiv").innerText = "내용을 입력하세요";
	else 
		document.guestForm.submit();
}