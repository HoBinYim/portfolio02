<%@page import="semi.likeitem.LikeitemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.likeitem.*" %>
<jsp:useBean id="ldto" class="semi.likeitem.LikeitemDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ldto"/>
<jsp:useBean id="ldao" class="semi.likeitem.LikeitemDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");

String l_id=(String)session.getAttribute("u_id");
if(l_id==null||l_id.equals("")) {
	%>
	<script>
	window.alert('로그인후 이용 가능합니다');
	location.href='../main.jsp';
	</script>
	<%
}
int totalCnt=ldao.getTotalCnt();//db로부터
int listSize=6;
int pageSize=3;

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}

int cp=Integer.parseInt(cp_s);//사용자의 현재위치

int totalPage=(totalCnt/listSize)+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<style>
#likeitem {
   
   width: 1300px;
   margin: 0px auto;
   border: 1px solid #dddddd;
}
#likeitem th{
   background-color: #eeeeee;
   text-align: center;
}
#likeitem td{
   text-align: center;
}
#likeitem a {
	text-decoration:none;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<form>
<table id="likeitem" border="1">
<thead>
<tr>
<th>이미지</th>
<th>제목</th>
<th>금액</th>
</tr>
</thead>
<tbody>
<%
ArrayList<LikeitemDTO> arr=ldao.likelist(cp, listSize, l_id);
	if(arr==null||arr.size()==0){
			%>
			<tr>
				<td colspan="3">즐겨찾기에 추가한 목록이 없습니다.</td>
			</tr>
			<%	
	}else {
		for(int i=0;i<arr.size();i++){
			%>
			<tr>
				<td>
					<img src="../image/<%=arr.get(i).getL_img() %>" width="300" height="300">
				</td>
				<td>
					<a href="/myweb/newProduct/itemList.jsp?idx=<%=arr.get(i).getIdx() %>"><%=arr.get(i).getL_name() %></a>
				</td>
				<td>
					<%=arr.get(i).getL_price() %>원
				</td>
			</tr>
			<%
		}
	}
	%>

</tbody>
</table>
</form>
<div class="paging" align="center">
<%
if(userGroup!=0){
	%><a href="likeItem.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;&lt;</a><%	
}
		for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
			%>&nbsp;&nbsp;<a href="likeItem.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
			if(i==totalPage){
				break;
			}
			
		}

if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%><a href="likeItem?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%	
}
%>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>