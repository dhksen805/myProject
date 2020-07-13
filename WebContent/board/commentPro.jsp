<%@page import="comment.commentDAO"%>
<%@page import="comment.commentBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/board/writePro.jsp</h1>
<%
//한글처리
request.setCharacterEncoding("utf-8");
// 파라미터 가져오기
int num = 0;

if(request.getParameter("num") != null) num = Integer.parseInt(request.getParameter("num"));

String content=request.getParameter("content");
Timestamp date=new Timestamp(System.currentTimeMillis());
String pageNum=request.getParameter("pageNum");
// 패키지 board  파일이름 BoardBean 멤버변수 set() get()
// BoardBean bb 객체생성
commentBean cb=new commentBean();
// 자바빈 멤버변수 <= 파라미터값 저장
// bb.setNum(디비에서 큰번호+1);
cb.setNum(num);
cb.setContent(content);
cb.setDate(date);

// 패키지 board 파일이름 BoardDAO   리턴값 없음  insertBoard(자바빈 주소)
// BoardDAO bdao 객체생성
// insertBoard(자바빈 주소) 메서드호출
commentDAO cdao=new commentDAO();
cdao.insertBoard(cb);

// list.jsp 이동
response.sendRedirect("content.jsp?num="+num+"&pageNum="+pageNum);
%>
</body>
</html>










