<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String u_id=(String)session.getAttribute("u_id");

	if(u_id.equals("host")==false){
		%>
		<script>
			window.alert("댓글은 관리자만 쓸 수 있습니다.");
			history.go(-2);//첫번째 방법
		</script>
		<%
	}
	
	
String r_subject=request.getParameter("r_subject");
String r_ref=request.getParameter("r_ref");
String r_lev=request.getParameter("r_lev");
String r_sunbun=request.getParameter("r_sunbun");
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
%>
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
<section>
<form name="reviewRewrite" action="reviewRewrite_ok.jsp">
<input type="hidden" name="r_ref" value="<%=r_ref%>">
<input type="hidden" name="r_lev" value="<%=r_lev%>">
<input type="hidden" name="r_sunbun" value="<%=r_sunbun%>">
<input type="hidden" name="u_id" value="<%=u_id%>">
<input type="hidden" name="idx" value="<%=idx%>">
<table id="writebbs_table">
	<tr>
		<th colspan="3" style="background-color:#eeeeee;">댓글 쓰기</th>
	</tr>
	<tr>
		<th>글제목<th>
		<td colspan="2"><input type="text" name="r_subject" value="re:)<%=r_subject%>" style="border-radius: 0px; border-color: #eeeeee; width:1000px; float: right;"></td>
	</tr>
	<tr>
		<th colspan="3" style="background-color:#eeeeee;">내용</th>
	</tr>
	<tr>
		<td colspan="3"><textarea rows="30" cols="200" name="r_content"></textarea></td>
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