<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO" scope="session"></jsp:useBean>
<jsp:useBean id="rdto" class="semi.review.ReviewDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"/>
<%@page import="semi.review.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<style>
#reviewContent_tb{
	width:1000;
	margin:0px auto;
	text-align: center;
}
#reviewContent_tb th{
	background-color: #eeeeee;
	border-top: 3px solid #aaaaaa;
}
#reviewContent_tb textarea{
	width:1000px;
	height:500px;
}
</style>
</head>
<%
String u_id=(String)session.getAttribute("u_id");
String r_num_s=request.getParameter("r_num");
int r_num=Integer.parseInt(r_num_s);
ReviewDTO dto= rdao.reviewContent(r_num);
%>
<body>
<%@include file="../header.jsp" %>
<%
String star=null;
if(dto.getR_star()==1){
	star="★☆☆☆☆";
}else if(dto.getR_star()==2){
	star="★★☆☆☆";
}else if(dto.getR_star()==3){
	star="★★★☆☆";
}else if(dto.getR_star()==4){
	star="★★★★☆";
}else{
	star="★★★★★";
}
%>
<input type="hidden" name="idx" value=<%=dto.getIdx()%>>
<input type="hidden" name="r_subject" value=<%=dto.getR_subject()%>>
<input type="hidden" name="r_content" value=<%=dto.getR_content()%>>
<input type="hidden" name="r_num" value=<%=dto.getR_num()%>>

<table id="reviewContent_tb">
	<tr>
		<th colspan="4">리뷰 상세내용</th>
	</tr>
	<tr>
		<td>제목:</td><td><%=dto.getR_subject()%></td>
	</tr>
	<tr>
		<td>작성자:</td><td><%=dto.getU_id() %></td><td>별점:</td><td><%=star%></td>
	</tr>
	<tr>
		<td colspan="4">
			<textarea><%=dto.getR_content()%></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><input type="button" value="삭제" onclick="location.href='reviewDelete.jsp?idx=<%=dto.getIdx()%>&u_id=<%=u_id%>&r_num=<%=dto.getR_num()%>'"><input type="button" value="수정하기" onclick="location.href='reviewModi.jsp?idx=<%=dto.getIdx()%>&u_id=<%=u_id%>&r_subject=<%=dto.getR_subject()%>&r_star=<%=dto.getR_star()%>&r_content=<%=dto.getR_content()%>&r_num=<%=dto.getR_num()%>'">
		<input type="button" value="답변쓰기" onclick="location.href='reviewRewrite.jsp?r_subject=<%=dto.getR_subject()%>&u_id=<%=u_id%>&r_ref=<%=dto.getR_ref()%>&r_lev=<%=dto.getR_lev()%>&r_sunbun=<%=dto.getR_sunbun()%>&r_num=<%=dto.getR_num()%>&idx=<%=dto.getIdx()%>'"></td>
	</tr>
	
</table>
<%@include file="../footer.jsp" %>
</body>
</html>