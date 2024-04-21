<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-idth, initial-scale=1">
   

    <title>Welcome to MyWorld</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	
	 <!-- jQuery -->
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

</head>
<body>
	<%@include file = "../include/include_header.jsp" %>

	<section>
		<div align = "center">
			<form name = "regform" action = "register.board" method = "post">
				<h2>게시판 글 작성 페이지</h2>
				<hr>
				<table border = "1" style = "widht : 500px">
					<tr>
						<td>작성자</td>
						<td><input type="text" name = "writer" size = "10"></td>
					</tr>
					<tr>
						<td>글 제목</td>
						<td><input type="text" name = "title"></td>
					</tr>
					<tr>
						<td>글 내용</td>
						<td><textarea name = "content" rows = "10" style = "width:100%"></textarea></td>
					</tr>
					<tr>
						<td colspan = "2" align = "center">
							<input type ="button" value = "등록" onclick = "registCheck()">
							<input type ="button" value = "목록" onclick = "location.href = 'list.board?pageNum=${param.pageNum}'">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
    
    <%@include file = "../include/include_footer.jsp" %>
    
    <script type = "text/javascript">
    	function registCheck() {
    		// 작성자, 글 제목에 공백확인, 공백이 아니라면 submit() 처리
    		if(document.regform.writer.value == '') {
    			alert("작성자 입력은 필수 사항입니다.");
    			return;
    		} else if(document.regform.title.value == '') {
    			alert("제목 입력은 필수 사항입니다.");
    			return;
    		} else if(document.regform.content.value.length >= 2000) {
    			alert("2000글자 미만으로 작성 해주세요");
    			return;
    		} else if(document.regform.writer.value.length >= 50) {
    			alert("50글자 미만으로 작성 해주세요");
    			return;
    		} else if(document.regform.title.value.length >= 50) {
    			alert("50글자 미만으로 작성 해주세요");
    			return;
    		} else if(confirm("작성을 완료하시겠습니까?")) {
    				document.regform.submit();
    			}
    		}
    </script>
   
</body>
</html>