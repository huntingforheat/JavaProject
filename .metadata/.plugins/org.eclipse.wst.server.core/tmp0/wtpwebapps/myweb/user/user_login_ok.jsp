<%@page import="com.myweb.user.model.UsersVO"%>
<%@page import="com.myweb.user.model.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		1. 로그인 처리과정을 작성하세요
		2. dao에 executeQuery 메서드로 결과값이 존재하면 1, 없으면 0을 반환하는 메서드 구현
		3. 실패인 경우 경고창을 출력 후 뒤로가기, 성공인 경우에는 user_mypage.jsp로 이동
	*/

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UsersDAO dao = UsersDAO.getInstance();
	
	int result = dao.IdPw_check(id, pw);
	
	if(result == 1) {  // 결과값 O  
		// 로그인 성공시 회원정보를 얻어오는 작업
		UsersVO vo = dao.getUserInfo(id);
		String name = vo.getName();
		// 아이디와 이름을 세션에 저장
		session.setAttribute("user_id", id);
		session.setAttribute("user_name", name);
		// user_mypage.jsp로 이동
		response.sendRedirect("user_mypage.jsp");
	 } else {  // 결과 값 x %>
		<script>
			alert("아이디 비밀번호가 틀렸습니다.");
			<!-- location.href = "user_login.jsp"; -->
			history.go(-1);
		</script>
	<% } %>
	