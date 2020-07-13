<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
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
request.setCharacterEncoding("utf-8");
//파라미터 가져오기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
//멤버빈 멤버다오 선언 유저체크 메서드호출
MemberBean mb = new MemberBean();
mb.setId(id);
mb.setPass(pass);

MemberDAO mdao = new MemberDAO();
int check = mdao.userCheck(id, pass);
// check==1 세션값 생성 아이디일치 메인
// check==0 비밀번호틀림 뒤로이동
// check==-1 아이디없음 뒤로이동
if(check==1){
	out.println("아이디 일치");
	session.setAttribute("id",id);
	response.sendRedirect("main.jsp");
}else if(check==0){
	out.println("비밀번호 틀림");
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
	</script>
	<%
}else if(check==-1){
	out.println("아이디 없음");
	%>
	<script type="text/javascript">
		alert("아이디 없음");
		history.back();
	</script>
	<%
	
}

%>
</body>
</html>