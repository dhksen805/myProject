<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="gboard.GBoardBean"%>
<%@page import="gboard.GBoardDAO"%>
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
String uploadPath=request.getRealPath("/fupload");
System.out.println(uploadPath);
//파일최대크기설정
int maxSize=5*1024*1024; // 5M
// 한글처리
request.setCharacterEncoding("utf-8");
// num name pass subject content 파라미터 가져오기
MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String file=multi.getFilesystemName("file");
// BoardBean bb객체생성
GBoardBean bb=new GBoardBean();
// 멤버변수 <= 파라미터 저장
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setFile(file);
System.out.println(pass);

// BoardDAO bdao 객체생성
GBoardDAO gbdao=new GBoardDAO();
// int check = passCheck(bb)   num pass 일치하는지 체크
int check = gbdao.passCheck(bb);
// check==1 num pass 일치  updateBoard(bb) 수정 list.jsp 이동
// check==0  "비밀번호틀림" 뒤로이동
if(check==1){
	gbdao.updateBoard(bb);
	response.sendRedirect("gallery.jsp");
}else{
	//"비밀번호틀림" 뒤로이동 
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>











