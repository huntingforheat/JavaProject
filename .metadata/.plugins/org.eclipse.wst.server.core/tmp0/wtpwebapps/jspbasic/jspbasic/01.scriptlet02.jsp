<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
		// out.println(), break를 사용하여 구구단 4단 
		int i = 1;
		while(true) {
			out.println(" 4 x " + i + " = " + 4 * i + "<br>");
			//out.println("===================================<br>");
			%>
			--------------------------------------------------<br>
			<% 
			if(i == 9) {
				break;
			}
			i++;
		}
		%>
		<hr>
		1. 체크박스 20개를 for문을 이용하여 가로로 생성
		<% 
		for(int k = 1; k <= 20; k++) {
		%>
			<br>
			<input type = "checkbox" name = "intro">
		<% 	
		}
		%>
		
	</body>
</html>