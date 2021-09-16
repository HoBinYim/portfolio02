<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="semi.bbs.*" %>
<jsp:useBean id="bdao" class="semi.bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="bdto" class="semi.bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<%
	String idx_s=request.getParameter("idx");
	int idx=Integer.parseInt(idx_s);
	String readnum=request.getParameter("b_readnum");
	int b_readnum=Integer.parseInt(readnum);
	ArrayList<BbsDTO> arr= bdao.bbsShow(idx);
	int result=bdao.bbsread(b_readnum, idx);
	int readnum_count=result>0?b_readnum+1:b_readnum;
	String u_id=(String)session.getAttribute("u_id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<style>
#showbbs_table{
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
<input type="hidden" name="idx" value=<%=idx%>>
<table id="showbbs_table">
	<tr>
		<th colspan="3" style="background-color:#eeeeee;">게시판 글 보기</th>
	</tr>
	<%
	
		for(int i=0; i<arr.size(); i++){
		%>
		<tr>
			<th>글제목<th><td colspan="3"><%=arr.get(i).getB_subject()%></td>
		</tr>
		<tr>
			<th>작성자</th><td><%=arr.get(i).getU_id() %></td><th>조회수</th><td><%=readnum_count%></td>
		</tr>
		<tr>
			<th colspan="4" style="background-color:#eeeeee;">내용</th>
		</tr>
		<tr>
			<td colspan="4"><textarea rows="30" cols="200" name="b_content" readonly><%=arr.get(i).getB_content() %></textarea></td>
		</tr>
		<tr>
			<td colspan="4"><input type="button" value="삭제" onclick="location.href='bbsDelete_ok.jsp?idx=<%=idx%>&u_id<%=id%>'"><input type="button" value="수정하기" onclick="location.href='bbsModi.jsp?idx=<%=idx%>&b_subject=<%=arr.get(i).getB_subject()%>&b_content=<%=arr.get(i).getB_content()%>&u_id=<%=id%>'"><input type="reset" value="취소" onclick="location.href='/myweb/bbs/bbs.jsp'"></td>
		</tr>
</table>
		<%
		}
	%>
	
</section>
<%@include file="/footer.jsp" %>
</body>
</html>