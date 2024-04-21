<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	Integer sel = Integer.parseInt(num);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>req_video_ok.jsp</title>
	</head>
	<body>
		<%
			if(num == null) {
		%>
		잘못된 접근입니다.
		<%} else if(sel == 1) { %>
		<div align = "center">
			<h2>파이썬 수업</h2>
			<p>파이썬 수업 중에 하나</p>
			<hr>
			<iframe width="640" height="480" src="https://www.youtube.com/embed/1fA9JPnjbQ0" title="[2月의 무도] 아니 방송국 놈들아 잠시만, 이거 누굴 위한 추격전임? &quot;끝까지 간다 3&quot; infinite challenge" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
		</div>
		<%} else if(sel == 2) { %>
		<div align = "center">
			<h2>펩의 축구 강의</h2>
			<p>펩의 축구전술 강의 01</p>
			<hr>
			<iframe width="640" height="480" src="https://www.youtube.com/embed/H6spHKp_sXg" title="⏫그날시리즈⏫ 22-23 세계 최고의 클럽, 맨체스터 시티의 그 날│축덕 x SPOTV" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
		</div>
		<%} %>
	</body>
</html>