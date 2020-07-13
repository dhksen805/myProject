<%@page import="java.sql.Timestamp"%>
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
<!-- member/joinPro.jsp -->
<%
request.setCharacterEncoding("utf-8");// request 한글처리
// request 저장된 파라미터 값 가져와서 => 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String sample4_postcode=request.getParameter("sample4_postcode");
String sample4_roadAddress=request.getParameter("sample4_roadAddress");
String sample4_jibunAddress=request.getParameter("sample4_jibunAddress");
Timestamp reg_date=new Timestamp(System.currentTimeMillis());
// 패키지 member 파일이름 MemberBean
// 파라미터값을 저장하는 변수 만들고 set,get메서드 만들기
// MemberBean mb 객체생성 => 기억장소 만들기
MemberBean mb = new MemberBean();
// mb에 <= 파라미터값 저장
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setEmail(email);
mb.setSample4_postcode(sample4_postcode);
mb.setSample4_roadAddress(sample4_roadAddress);
mb.setSample4_jibunAddress(sample4_jibunAddress);
mb.setReg_date(reg_date);

// 패키지 member 파일이름 MemberDAO  리턴값 없음 insertMember(자바빈) 메서드 만들기
// MemberDAO mdao 객체생성
MemberDAO mdao = new MemberDAO();
// insertMember() 메서드 호출
mdao.insertMember(mb);

// "회원가입성공" login.jsp 이동

%>
<script type="text/javascript">
	alert("회원가입성공")
	location.href="login.jsp";
</script>

</body>
</html>