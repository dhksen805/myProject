<%@page import="gboard.GBoardDAO"%>
<%@page import="gboard.GBoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<%
//한글처리
// request.setCharacterEncoding("utf-8");
// 파일업로드  프로그램 설치 
// www.servlets.com
// com.oreilly.servlet
// cos-20.08.zip  => 압축풀기  cos.jar
// WebContent - WEB-INF - lib - cos.jar 넣기
// 설치한 파일을 객체생성 => 파일업로드 , 정보를 저장
// MultipartRequest multi=new MultipartRequest(request, 업로드할 폴더의 물리적인경로, 파일최대크기설정,한글처리,이름이 동일할때 파일이름 바꾸기);
// 업로드할  WebContent - upload 폴더만들기-업로드할 폴더의 물리적인경로
String uploadPath=request.getRealPath("/gupload");
System.out.println(uploadPath);
//파일최대크기설정
int maxSize=5*1024*1024; // 5M
// 한글설정
//이름이 동일할때 파일이름 바꾸기
MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

// 파라미터 가져오기
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
int readcount =0; //조회수
Timestamp date=new Timestamp(System.currentTimeMillis());
// 폴더에 업로드된 파일일름
String file=multi.getFilesystemName("file");

// 패키지 board  파일이름 BoardBean 멤버변수 set() get()
// BoardBean bb 객체생성
GBoardBean bb=new GBoardBean();
// 자바빈 멤버변수 <= 파라미터값 저장
// bb.setNum(디비에서 큰번호+1);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setReadcount(readcount);
bb.setDate(date);
bb.setFile(file);

// 패키지 board 파일이름 BoardDAO   리턴값 없음  insertBoard(자바빈 주소)
// BoardDAO bdao 객체생성
// insertBoard(자바빈 주소) 메서드호출
GBoardDAO gbdao=new GBoardDAO();
gbdao.insertBoard(bb);

// list.jsp 이동
response.sendRedirect("gallery.jsp");
%>
</body>
</html>










