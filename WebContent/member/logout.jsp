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
// 세션값 초기화
session.invalidate();
// "로그아웃"
// main.jsp 이동
%>
<script type="text/javascript">
	alert("로그아웃");
	location.href="main.jsp";
</script>
</body>
</html>
