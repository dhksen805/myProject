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
    <div>
        <form action="SendMail.jsp" method="post">
            <table>
                <tr><th colspan="2">메일 보내기</th></tr>
                <tr><td>from</td><td><input type="text" name="from" /></td></tr>
                <tr><td>to</td><td><input type="text" name="to" /></td></tr>
                <tr><td>subject</td><td><input type="text" name="subject" /></td></tr>
                <tr><td>content</td><td><textarea name="content" style="width:170px; height:200px;"></textarea></td></tr>
                <tr><td colspan="2" style="text-align:right;"><input type="submit" value="Transmission"/></td></tr>
            </table>
        </form>
    </div>
    <jsp:include page="../inc/bottom.jsp" />
</body>
</html>


