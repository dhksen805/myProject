<%@page import="gboard.GBoardDAO"%>
<%@page import="gboard.GBoardBean"%>
<%@page import="java.util.List"%>
<%@page import="comment.commentBean"%>
<%@page import="comment.commentDAO"%>
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
<jsp:include page="../inc/top.jsp"/>
<%
// pageNum파라미터 가져오기
String pageNum=request.getParameter("pageNum");
System.out.println("pageNum값:"+pageNum);

// int num  =   "num" 파라미터 가져오기
int num = 0;
if(request.getParameter("num") != null) num = Integer.parseInt(request.getParameter("num"));
// BoardDAO bdao 객체생성
GBoardDAO gbdao=new GBoardDAO();
// 조회수 증가  readcount 수정    readcount = readcount+1  조건 num = 
//                  updateReadcount(num) 메서드 호출
gbdao.updateReadcount(num);
// num에 해당하는 글 가져오기
// BoardBean bb  =  getBoard(num) 메서드 호출
GBoardBean bb=gbdao.getBoard(num);



%>
<table>
<%=bb.getSubject() %></td></tr>
<td colspan="3">
<img src="../gupload/<%=bb.getFile() %>" width="500" height="500">
<tr><td colspan="4">
<input  type="button" value="글수정" onclick="location.href='gupdateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<input  type="button" value="글삭제" onclick="location.href='gdeleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<input  type="button" value="글목록" onclick="location.href='gallery.jsp?pageNum=<%=pageNum%>'"></td>
</tr>
</table>
</body>
</html>















