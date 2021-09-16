<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO" scope="session"></jsp:useBean>
<%
String u_id=request.getParameter("u_id");
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
String r_subject=request.getParameter("r_subject");
String r_content=request.getParameter("r_content");
String r_star_s=request.getParameter("r_star");
int r_star=Integer.parseInt(r_star_s);
String r_num_s=request.getParameter("r_num");
int r_num=Integer.parseInt(r_num_s);
System.out.println(r_num);
System.out.println(u_id);
boolean result=rdao.reviewPermission(u_id, r_num);

if(result==false){
	%>
	<script>
		window.alert('수정할 수 있는 권한이 없습니다.');
		history.go(-2);//첫번째 방법
	</script>
	<%
	return;
}


if(u_id==null){
	%>
		<script>
			window.alert('수정할 수 있는 권한이 없습니다.');
			history.go(-1);//첫번째 방법
		</script>
	<%
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<style>
#reviewModi_tb{
	width:1000;
	margin:0px auto;
	text-align: center;
}
#reviewModit_tb th{
	background-color: #eeeeee;
	border-top: 3px solid #aaaaaa;
}
#reviewModi_tb textarea{
	width:1000px;
	height:500px;
}
</style>
</head>
<body>

<%@include file="/header.jsp" %>
<form name="reviewModi" action="reviewModi_ok.jsp">
<input type="hidden" name="u_id" value=<%=id%>>
<input type="hidden" name="r_num" value=<%=r_num%>>

<table id="reviewModi_tb">
	<tr>
		<th colspan="4">리뷰 상세내용</th>
	</tr>
	<tr>
		<td >제목:</td><td colspan="3"><input type="text"  name="r_subject" value=<%=r_subject%> style="width:100%;"></td>
	</tr>
	<tr>
		<td>작성자:</td><td><%=id%></td><td>별점:</td>
		<td>
			<select name="r_star">
				<option value="1">★☆☆☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="3">★★★☆☆</option>
				<option value="4">★★★★☆</option>
				<option value="5">★★★★★</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<textarea name="r_content"><%=r_content%></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><input type="submit" value="수정하기"></td>
	</tr>	
</table>
</form>
<%@include file="/footer.jsp" %>
</body>
</html>