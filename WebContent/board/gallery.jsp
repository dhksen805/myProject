<%@page import="gboard.GBoardBean"%>
<%@page import="gboard.GBoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
 <meta charset="utf-8">
 <title>gallery</title>
 <link href='http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicWeb'
        rel='stylesheet'>
 <style>
  body { font-family: 'NanumGothicWeb'; }
  #gallery{
  border:0px #1d0c16;
  height:1200px;
  width:100%;
  margin-left:auto;
  margin-right:auto;
  overflow:visible;
  background:#EAEAEA;
  -webkit-box-shadow:#272229 10px 10px 20px;
  -moz-box-shadow:#272229 10px 10px 20px;
  box-shadow:#272229 10px 10px 30px;
  }

  #gallery ul{margin-left:-30px;}

  #gallery ul li{
  list-style-type:none;
  display:inline-table;
  padding:10px;
  }

  #gallery ul li .pic{
  -webkit-transition: all 0.6s ease-in-out;
  opacity:0;
  visibility:hidden;
  position:absolute;
  margin-top:10px;
  margin-left:-20px;
  border:1px solid black;
  -webkit-box-shadow:#272229 2px 2px 10px;
  -moz-box-shadow:#272229 2px 2px 10px;
  box-shadow:#272229 2px 2px 10px;
  }

  #gallery ul li .small:hover{cursor:pointer;}

  #gallery ul li:hover .pic{
  width:320px;
  height:240px;
  opacity:1;
  visibility:visible;
  float:right;
  }
 </style>
</head>
<body>
	<!-- //header -->
	<jsp:include page="../inc/top.jsp" />
	<!-- //header -->
<%
// BoardDAO bdao 객체생성    
GBoardDAO gbdao=new GBoardDAO();
// 게시판 글개수   getBoardCount()  count(*)
// int count = getBoardCount() 호출
int count=gbdao.getBoardCount();

// 한화면에 보여줄 가져올 글 개수 설정 
int pageSize=9;
// 현페이지 번호 가져오기  pageNum 파라미터 가져오기
String pageNum=request.getParameter("pageNum");
// 현페이지 번호가 없으면 "1"페이지로 설정
if(pageNum==null){
	pageNum="1";
}
// pageNum => 정수형으로 변경
int currentPage=Integer.parseInt(pageNum);
// 10개씩 잘라서 1페이지 시작하는 행번호 구하기
int startRow=(currentPage-1)*pageSize+1;
// endRow
int endRow=currentPage*pageSize;

//리턴할형 List  getBoardList(시작하는행번호,글개수) 만들기
// select * from board order by num desc limit 시작하는행번호-1,글개수
// List boardList= getBoardList(startRow,pageSize) 호출
List boardList=gbdao.getBoardList(startRow, pageSize);
%>
 
 

<div id="gallery">
  <ul>
    <%
for(int i=0;i<boardList.size();i++){
	GBoardBean bb=(GBoardBean)boardList.get(i);
	%>
   <li width="360" height="270" border="0" alt="" class="small">
   <a href="gcontent.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
   <img src="../gupload/<%=bb.getFile()%>" width="360" height="270" border="0" alt="" class="small">
   <img src="../gupload/<%=bb.getFile()%>" border="0" alt="" class="pic"></a></li>
   <%}%>
  </ul>
 </div>
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값이 있으면 글쓰기 버튼 보이기
if(id!=null){
	%><input type="button" value="사진업로드" class="btn" 
onclick="location.href='gwrite.jsp'"><%
}
%>

 
<%
// 전체 페이지수 구하기    
int pageCount= count / pageSize + (count%pageSize==0?0:1);
// 한화면에 보여줄 페이지 개수
int pageBlock=5;
// 한화면에 보여줄 시작페이지 번호 구하기
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// 한화면에 보여줄 끝페이지 번호 구하기
int endPage=startPage+pageBlock-1;
//  endPage 10  <=  전체 페이지수 5페이지
if(endPage > pageCount){
	endPage=pageCount;
}
// [이전]  10페이지 이전
if(startPage > pageBlock){
	%> <a href="gallery.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a> <%
}

// 1~ 10  11~20   startPage  ~ endPage
for(int i=startPage;i<=endPage;i++){
	%> <a href="gallery.jsp?pageNum=<%=i%>"><%=i%></a> <%
}

//[다음] 10페이지 다음
if(endPage < pageCount){
	%> <a href="gallery.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a> <%
}
%>
 
 
</body>
</html>

