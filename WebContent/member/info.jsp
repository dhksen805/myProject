<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
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
// session 가져와서 변수에 저장
String id=(String)session.getAttribute("id");

//패키지 member 파일이름 MemberDAO   리턴할형MemberBean  getMember(아이디) 메서드 만들기
//MemberDAO 객체생성
MemberDAO mdao=new MemberDAO();
//MemberBean mb =    getMember(아이디) 호출
MemberBean mb=mdao.getMember(id);
	%>
아이디:<%=mb.getId() %><br>
비밀번호:<%=mb.getPass() %><br>
이름:<%=mb.getName() %><br>
가입날짜:<%=mb.getReg_date() %><br>
<a href="main.jsp">메인화면</a>
</body>
</html>















