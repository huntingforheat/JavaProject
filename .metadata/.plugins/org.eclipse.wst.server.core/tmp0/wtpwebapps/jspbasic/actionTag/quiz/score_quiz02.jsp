<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		1. 앞에서 넘어온 폼값을 받아서 평균을 구합니다.
		2. 평균의 60점 이상이면 score_quiz03.jsp로 이동
			"~~님 평균 xx점 합격" 을 출력
		3.평균이 60점 미만이면 score_quiz04.jsp로 이동
		     "~~님 평균 xx점 불합격" 을 출력
		    
		   조건) 세션 사용 X

	*/
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	double ko = Double.parseDouble(request.getParameter("ko"));
	double en = Double.parseDouble(request.getParameter("en"));
	double math = Double.parseDouble(request.getParameter("math"));
	
	double avg = (ko + en + math) / 3;
	avg = (int)(avg * 100)/100.0;
	
	/* if(avg >= 60) {
		// 자바 코드를 이용한 forward
		request.setAttribute("avg", avg);
		request.getRequestDispatcher("score_quiz03.jsp")
		.forward(request , response);
	} else { 
		request.setAttribute("avg", avg);
		request.getRequestDispatcher("score_quiz04.jsp")
		.forward(request, response);
	 }  */
	
%>
		<%if(avg >= 60) { %>
			<jsp:forward page = "score_quiz03.jsp">
				<jsp:param value = "<%=avg %>" name = "avg"/>
			</jsp:forward>
		<%} else {%>
			<jsp:forward page = "score_quiz04.jsp">
				<jsp:param value = "<%=avg %>" name = "avg" />
			</jsp:forward>
		<% } %>

