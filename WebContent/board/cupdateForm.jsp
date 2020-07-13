<%@page import="comment.commentDAO"%>
<%@page import="comment.commentBean"%>
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
<%
//pageNum파라미터 가져오기
String pageNum=request.getParameter("pageNum");
//int num  =   "num" 파라미터 가져오기
int cnum=Integer.parseInt(request.getParameter("cnum"));
// BoardDAO bdao 객체생성
commentDAO bdao=new commentDAO();
// BoardBean bb  = getBoard(num) 메서드 호출()
commentBean cb=bdao.getBoard(cnum);
%>
<form action="cupdatePro.jsp?pageNum=<%=pageNum %>" method="post">
<input type="hidden" name="cnum" value="<%=cnum%>">
<table border="1">
<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"><%=cb.getContent()%></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
</table>
</form>
</body>
</html>






