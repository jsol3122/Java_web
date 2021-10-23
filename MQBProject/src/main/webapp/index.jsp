<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	body{
		margin: 0;
		padding: 0;
		height: 100%;
		width: auto;
	}
	
	header{
		width: 1700px;
		height: 10%;
		text-align: center;
	}
	
	#container{
		margin: auto;
		width: 1700px;
		height: 500px;
	}
	
	#container:after{
		content: '';
		display: block;
		clear: both;
		float: none;
	}
	
	nav{
		margin-left: 10px;
		width: 25%;
		height: 100%;
		float: left;
	}
	
	section{
		width: 70%;
		height: 100%;
		float: left;
	}
	
	footer{
		width: 1700px;
		height: 10%;
	}
	</style>
</head>
<body>
	<header>
		<h1>
			<img alt="토끼" src="/MQBProject/image/1.jpg" width="100" height="100">MVC기반의 미니 프로젝트
		</h1>
		
		<jsp:include page="main/menu.jsp" />
	</header>
	
	<div id="container">
		<nav>
			<jsp:include page="main/nav.jsp" />
		</nav>
		
		<section>
			<h1>
				홈페이지를 방문해주셔서 감사합니다<br>
				Have a nice day :)<br>
				<img alt="토끼" src="/MQBProject/image/2.jpg" width="500" height="500">
			</h1>
		</section>
	</div>
	
	<footer>
		<p>비트캠프</p>
	</footer>
</body>
</html>