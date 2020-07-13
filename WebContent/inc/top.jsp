<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="header">

<%
request.setCharacterEncoding("utf-8");
// String id = (String)세션값 가져오기
String id = (String)session.getAttribute("id");
// 세션값 없으면 login join
// 		있으면 ...님 logout

%>
<style>

#nav_menu ul {

list-style-type:none;

/* 좌측 여백 없애기 */

padding-left:0px;

/* 우측 정렬 하기 */

float:reft;

}

#nav_menu ul li {

display:inline;

border-left: 1px solid #c0c0c0;

/* 테두리와 메뉴 간격 벌리기. padding: 위 오른쪽 아래 왼쪽; */

padding: 0px 10px 0px 10px;

/* 메뉴와 테두리 사이 간격 벌리기. margin: 위 오른쪽 아래 왼쪽; */

margin: 5px 0px 5px 0px;

}

#nav_menu ul li:first-child {

border-left: none;

}

</style>
        <div class="container">
            <div class="row">
                <div class="header clearfix">
                    <h1>
                        <a href="../member/main.jsp">
                            <em><img src="../assets/img/mainlogo.jpg" alt="movie"></em>   
                            <strong><img src="../assets/img/logo-sub.png" alt="LIFE THEATER"></strong>
                        </a>
                    </h1>
                    
                    <div id="nav_menu">
                    <ul>
                        <li><h2 class="ir_so">전체메뉴</h2></li>
                            <li><a href="../board/list.jsp">추천영화</a></li>
                            <li><a href="../board/gallery.jsp">영화 스크린샷</a></li>
                            <li><a href="../board/list_f.jsp">이벤트 쿠폰</a></li>
                            <li><a href="#">자유게시판</a></li>
                            <li><%if(id==null){%>
	<div id="login"><a href="../member/login.jsp">로그인</a> | <a href="../member/join.jsp">회원가입</a></div>
	<%}else{%>
	<div id="login"><%=id%>님 | <a href="../member/logout.jsp">
	logout</a> | <a href="../member/updateForm.jsp">회원정보수정</a> | <a href="../member/mailForm.jsp">이메일</a>
	| <a href="../member/info.jsp">내정보</a></div>
	<%}%></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>