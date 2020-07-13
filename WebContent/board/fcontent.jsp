<%@page import="fboard.FBoardBean"%>
<%@page import="fboard.FBoardDAO"%>
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
FBoardDAO fbdao=new FBoardDAO();
// 조회수 증가  readcount 수정    readcount = readcount+1  조건 num = 
//                  updateReadcount(num) 메서드 호출
fbdao.updateReadcount(num);
// num에 해당하는 글 가져오기
// BoardBean bb  =  getBoard(num) 메서드 호출
FBoardBean bb=fbdao.getBoard(num);



%>
<table border="1">
<tr><td>글번호</td><td><%=bb.getNum() %></td><td>작성일</td><td><%=bb.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%=bb.getName() %></td><td>조회수</td><td><%=bb.getReadcount()%></td></tr>
<tr><td>제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
<tr><td>파일</td><td colspan="3"><img src="../fupload/<%=bb.getFile() %>" width="100" height="100">
<a href="../fupload/<%=bb.getFile() %>">보기 : <%=bb.getFile() %></a><br>
<a href="file_down.jsp?file_name=<%=bb.getFile() %>">다운로드 : <%=bb.getFile() %></a></td></tr>
<img src="../fupload/<%=bb.getFile() %>" width="100" height="100"><br>

<tr><td>내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
<tr><td colspan="4">
<input  type="button" value="글수정" onclick="location.href='fupdateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<input  type="button" value="글삭제" onclick="location.href='fdeleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<input  type="button" value="글목록" onclick="location.href='list_f.jsp?pageNum=<%=pageNum%>'"></td>
</tr>
</table>
</body>
</html>















