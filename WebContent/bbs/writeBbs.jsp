<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<style>
#writebbs_table{
	border:1px solid #eeeeee;
	width: 1300px;
	text-align: center;
	margin:0px auto;
}

</style>
</head>
<body>
<%@include file="/header.jsp" %>
<%
String u_id=request.getParameter("u_id");
String host_id="host";
if(id.equals(host_id)==false){
	%>
	<script>
		window.alert("관리자만 작성할 수 있습니다.");
		history.go(-2);//첫번째 방법
	</script>
	<%
}
%>
<section>
<form name="writeBbs" action="writeBbs_ok.jsp">
<table id="writebbs_table">
	<tr>
		<th colspan="3" style="background-color:#eeeeee;">게시판 글 쓰기</th>
	</tr>
	<tr>
		<th>글제목<th>
		<td colspan="2"><input type="text" name="b_subject" style="border-radius: 0px; border-color: #eeeeee; width:1000px; float: right;"></td>
	</tr>
	<tr>
		<th colspan="3" style="background-color:#eeeeee;">내용</th>
	</tr>
	<tr>
		<td colspan="3"><textarea rows="30" cols="200" name="b_content"></textarea></td>
	</tr>
	<tr>
		<td colspan="3"><input type="submit" value="등록"><input type="reset" value="다시쓰기"></td>
	</tr>
</table>
</form>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>