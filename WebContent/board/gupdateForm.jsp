<%@page import="gboard.GBoardBean"%>
<%@page import="gboard.GBoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/top.jsp" />
<%
//int num  =   "num" 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
// BoardDAO bdao 객체생성
GBoardDAO gbdao=new GBoardDAO();
// BoardBean bb  = getBoard(num) 메서드 호출()
GBoardBean bb=gbdao.getBoard(num);
%>
<form action="gupdatePro.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%=num%>">
<table border="1">
<tr><td>작성자</td><td><input type="text" name="name" value="<%=bb.getName()%>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=bb.getSubject()%>"></td></tr>
<tr><td>파일</td><td><input type="file" name="file" value="<%=bb.getFile()%>"></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
</table>
</form>
</body>
</html>






