<%@page import="comment.commentDAO"%>
<%@page import="comment.commentBean"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/board/deletePro.jsp</h1>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
//pageNum파라미터 가져오기
// String pageNum=request.getParameter("pageNum");
// num  pass 파라미터 가져오기
int cnum = 0;
if(request.getParameter("cnum") != null) cnum = Integer.parseInt(request.getParameter("cnum"));

int num = 0;
if(request.getParameter("num") != null) num = Integer.parseInt(request.getParameter("num"));
//BoardBean bb 
commentBean bb=new commentBean();
bb.setCnum(cnum);
//BoardDAO bdao 객체생성
commentDAO bdao=new commentDAO();
bdao.deleteBoard(bb);
response.sendRedirect("content.jsp?num="+num);
%>
</body>
</html>
