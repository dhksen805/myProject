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
//첨부파일 파일업로드
// 1. 서버안에 폴더 만들어서 파일을 넣고 // 파일이름 디비에 저장 
//    1)데이터베이스 열이름 file 추가
//    2)화면에 <input type="file" name="file">
//    3)form태그에 추가  enctype="multipart/form-data
// 2. 파일을 데이터베이스에 저장
%>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<form action="fwritePro.jsp" method="post" enctype="multipart/form-data">
<table border="1">
<tr><td>작성자</td><td><input type="text" name="name"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
<tr><td>파일</td><td><input type="file" name="file"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글쓰기"></td></tr>
</table>
</form>
</body>
</html>








