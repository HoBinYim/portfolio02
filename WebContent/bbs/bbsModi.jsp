<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
String b_subject=request.getParameter("b_subject");
String b_content=request.getParameter("b_content");
String u_id=request.getParameter("u_id");

if(u_id==null || u_id.equals("host")==false){
	%>
		<script>
			window.alert('수정할 수 있는 권한이 없습니다.');
			history.go(-1);//첫번째 방법
		</script>
	<%
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<style>
#bbsmodi_table{
	border:1px solid #eeeeee;
	width: 1300px;
	text-align: center;
	margin:0px auto;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<form name="bbsModify" action="bbsModi_ok.jsp">
<input type="hidden" name="idx" value=<%=idx%>>
<table id="bbsmodi_table">
		<tr>
			<th colspan="3" style="background-color:#eeeeee;">게시판 글 보기</th>
		</tr>
		<tr>
			<th>글제목<th><td colspan="2"><input type="text" name="b_subject" value=<%=b_subject%> style="border-radius: 0px; border-color: white; width:1000px; float: right; color:black;"></td>
		</tr>
		<tr>
			<th colspan="3" style="background-color:#eeeeee;">내용</th>
		</tr>
		<tr>
			<td colspan="3"><textarea rows="30" cols="200" name="b_content"><%=b_content%></textarea></td>
		</tr>
		<tr>
			<td colspan="3"><input type="submit" value="수정"></td>
		</tr>
</table>
</form>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>