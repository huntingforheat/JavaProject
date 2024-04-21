<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>path_quiz</title>
	</head>
	<body>
		<!-- a 태그를 이용하여 경로 이동 -->
		
		<!-- 1. jspbasic폴더에 03.expression.jsp 파일로 접근 상대/절대 경로로 접근 -->
		<a href="../../jspbasic/03.expression.jsp">03.expression.jsp 상대</a>
		<a href="/jspbasic/jspbasic/03.expression.jsp">03.expression.jsp 절대</a>
		<!-- 2. TestServlet 서블릿 페이지로 상대/절대 경로로 접근 -->
		<a href="../../TestServlet">TestServlet 상대</a>
		<a href="/jspbasic/TestServlet">TestServlet 절대</a>
		<!-- 3. images 폴더에 있는 이미지 파일에 상대 경로로 접근 -->
		<img src="../../../HTMLL/images/images.jpeg" width="100">
		
	</body>
</html>