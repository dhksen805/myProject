<%@page import="comment.commentDAO"%>
<%@page import="comment.commentBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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
// 한글처리
request.setCharacterEncoding("utf-8");
//pageNum파라미터 가져오기
String pageNum=request.getParameter("pageNum");
// num name pass subject content 파라미터 가져오기
int cnum=Integer.parseInt(request.getParameter("cnum"));
String content=request.getParameter("content");
// BoardBean bb객체생성
commentBean cb=new commentBean();
// 멤버변수 <= 파라미터 저장
cb.setCnum(cnum);
cb.setContent(content);

// BoardDAO bdao 객체생성
commentDAO bdao=new commentDAO();
// int check = passCheck(bb)   num pass 일치하는지 체크
	bdao.updateBoard(cb);
	response.sendRedirect("list.jsp?pageNum="+pageNum);
%>
</body>
</html>











