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

<style type="text/css">
.content{
width:40%;
margin-left:50px;
border:1px;
}
.comment{
width:40%;
margin-left:50px;
border:1px;
}
</style>
</head>
<body>
	<jsp:include page="../inc/top.jsp" />
<%
// pageNum파라미터 가져오기
String pageNum=request.getParameter("pageNum");
System.out.println("pageNum값:"+pageNum);

// int num  =   "num" 파라미터 가져오기
int num = 0;
if(request.getParameter("num") != null) num = Integer.parseInt(request.getParameter("num"));
// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
// 조회수 증가  readcount 수정    readcount = readcount+1  조건 num = 
//                  updateReadcount(num) 메서드 호출
bdao.updateReadcount(num);
// num에 해당하는 글 가져오기
// BoardBean bb  =  getBoard(num) 메서드 호출
BoardBean bb=bdao.getBoard(num);

commentDAO cdao= new commentDAO();

List commentList = cdao.getCommentList(num);

%>
<table border="1" class="content">
<tr><td>글번호</td><td><%=bb.getNum() %></td><td>작성일</td><td><%=bb.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%=bb.getName() %></td><td>조회수</td><td><%=bb.getReadcount()%></td></tr>
<tr><td>제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
<tr><td>내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
<tr><td colspan="4">
<input  type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<input  type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
<input  type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'"></td>
</tr>
</table>

<table border="1" class="comment">
<tr><td>댓글</td><td>작성일</td><td>수정 삭제</td></tr>
<%
for(int i=0;i<commentList.size();i++){
	commentBean cb=(commentBean)commentList.get(i);
	%><tr>
	      <td><%=cb.getContent() %></td>
	      <td><%=cb.getDate() %></td>
	      <td><a href="cupdateForm.jsp?cnum=<%=cb.getCnum()%>&pageNum=<%=pageNum %>">수정</a>
	      <a href="cdeletePro.jsp?cnum=<%=cb.getCnum()%>&num=<%=cb.getNum() %>">삭제</a></td></tr><%
}
%>
<tr><td colspan="4">
<form action="commentPro.jsp?num=<%=num%>&pageNum=<%=pageNum %>" name="comment" method="post">
<textarea rows="10" cols="40" name="content"></textarea>
<input  type="submit" name="register" value="댓글작성">
<input  type="reset" name="reset" value="리셋">
</form>
</td></tr>
</table>

</body>
</html>















