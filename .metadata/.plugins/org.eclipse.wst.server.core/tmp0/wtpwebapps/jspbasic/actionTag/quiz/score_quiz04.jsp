<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String avg = request.getParameter("avg");
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=name %>님 평균 <%=avg %>점 불합격
</body>
</html>