<%@page import="com.myweb.user.model.UsersVO"%>
<%@page import="com.myweb.user.model.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	if(session.getAttribute("user_id") == null) {
		response.sendRedirect("user_login.jsp");
	}
	
	String id = (String)session.getAttribute("user_id");
	String old_pw = request.getParameter("old_pw");
	String new_pw= request.getParameter("new_pw");
	
	UsersDAO dao = UsersDAO.getInstance();
	
	int result = dao.IdPw_check(id, old_pw);
	if (result == 0) { //예전 비밀번호 틀린 경우 %>
		<script>
			location.href='user_mypage.jsp';
		</script>
	<%}else{ // 비밀번호가 맞는 경우
		int result2 = dao.change_pw(id, new_pw);
		if (result2 == 1) {  //비밀번호 변경 성공
	%>
			<script>
				alert("비밀번호 변경처리 되었습니다.")
				location.href='user_mypage.jsp';
			</script>
		<%}else { // 비밀번호 변경 실패%>
			<script>
				alert("비밀번호 변경에 실패했습니다.")
				location.href='user_mypage.jsp';
			</script>
		<%} %>
	<%} %>
%>