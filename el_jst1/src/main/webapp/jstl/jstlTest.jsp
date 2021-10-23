<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>** 변수 설정 **</h3>
	<c:set var="name" value="홍길동"></c:set> <!-- set 사용 방법 1 -->
	<c:set var="age">25</c:set> <!-- set 사용 방법 2 -->
	
	나의 이름은 ${name }입니다<br> <!-- 간편함 / 개발자모드에서 데이터 다 보임 -->
	나의 나이는 <c:out value="${age }"></c:out>살 입니다<br> <!-- 보안에 좋음 -->
	나의 키는 ${height }입니다
	
	<h3>** 변수 삭제</h3>
	<c:remove var="name"/>

	나의 이름은 ${name }입니다<br> 
	나의 나이는 <c:out value="${age }"></c:out>살 입니다<br> 
	나의 키는 ${height }입니다
	
	<h3>** forEach **</h3>
	<c:forEach var="i" begin="1" end="10" step="1"> <!-- for(int i=1; i<=10; i++)과 동일 -->
		${i }
		<c:set var="sum" value="${sum+i }"></c:set> <!-- sum = sum+i -->
	</c:forEach>
	<br>
	
	1 ~ 10까지의 합은 ${sum }입니다
	<br><br>
	
	<c:forEach var="i" begin="0" end="9" step="1"> <!-- step은 -값을 넣을수없음! -->
		${10-i }
	</c:forEach>
	<br>
	
	<h3>** 문자열 분리 **</h3>
	-- 자바에서 사용한 메소드 --<br>
	String의 split()  /
	StringTokenizer<br><br>
	
	<c:forTokens var="car" items="소나타,아우디,링컨,페라리,벤츠" delims=",">
		${car }<br>
	</c:forTokens>
	
	<h3>** jstlExam.jsp에서 넘어오는 데이터 **</h3>
	<%-- <%= request.getAttribute("list") %> --%>
	${requestScope.list } <!-- 위의 내용 EL로 쓰면 이렇게 됨 -->
	<!-- sendRedirect방식은 데이터 아무것도 안가져오니까 값없는데 EL은 값없으면 NULL도 안찍고 걍 아무것도 안찍음 -->
	<!-- forward방식은 데이터 공유되는데, [ ] 안에 담겨서 출력됐다는건 배열형 주소값처럼 인식했다는 것 -->
	<%-- ${list } 라고만 써도 알아서 page부터 죽죽 순서대로 찾으러가니까 괜찮음 --%>
	
	<h3>** 인덱스 2번째인 데이터 출력 **</h3>
	${requestScope.list[2] }
	<!-- 여기선 주소값이 아니라 데이터로 인식한 것이라 [ ] 안에 담겨있지 않음 -->
	
	<h3>** jstlExam.jsp에서 넘어오는 데이터 **</h3>
	${list2 }
	<br>
	
	<c:forEach var="personDTO" items="${list2 }">
		이름 = ${personDTO.getName() }&emsp; 나이 = ${personDTO.getAge() }<br>
	</c:forEach>
	
	<h3>** 메소드명을 변수명처럼 사용 **</h3>
	<c:forEach var="personDTO" items="${list2 }">
		이름 = ${personDTO.name }&emsp; 나이 = ${personDTO.age }<br>
	</c:forEach>
	
</body>
</html>