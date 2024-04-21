<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
		// 로그아웃 처리 및 세션의 삭제, 리다이렉트
		session.removeAttribute("user_id");
		session.invalidate();
		
		response.sendRedirect("login.jsp");
		
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		
	</body>
</html>