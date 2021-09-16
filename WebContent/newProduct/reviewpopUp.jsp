<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	margin:0px auto;
	width:500px;
	height:500px;
	text-align: center;
}

</style>
</head>
<%
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
String u_id=(String)session.getAttribute("u_id");
%>
<%
if(u_id==null){
	
	%>
	<script>
		window.alert('로그인 후 이용가능합니다.');
		self.close();
	</script>
	<% 
}
%>
<body>
<form name="reviewWrite" action="reviewWrite_ok.jsp?idx=<%=idx %>">
<input type="hidden" name="u_id" value="<%=u_id%>">
<input type="hidden" name="idx" value="<%=idx%>">
<table border="1">
	<tr>
		<td colspan="2"><h2>리뷰작성</h2></td>
	</tr>
	<tr>
		<th>제목</th><td><input type="text" name="r_subject" value=""style="background-color:transparent;border:0 solid black;text-align:right;"></td>
	</tr>
	<tr>
		<th colspan="2">내용</th>
	</tr>
	<tr>
		<td colspan="2"><textarea rows="20" cols="80" name="r_content"></textarea></td>
	</tr>
	<tr>
		<th>별점</th>
		<td>
			<select name="r_star">
				<option value="1">☆☆☆☆★</option>
				<option value="2">☆☆☆★★</option>
				<option value="3">☆☆★★★</option>
				<option value="4">☆★★★★</option>
				<option value="5">★★★★★</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="확인"><input type="reset" value="초기화"></td>
	</tr>
</table>
</form>
</body>
</html>