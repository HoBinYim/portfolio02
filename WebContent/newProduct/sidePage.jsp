<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="semi.product.*" %>
    <jsp:useBean id="pdao" class="semi.product.ProductDAO"></jsp:useBean>
    <%
String ta = request.getParameter("ta");
String co = request.getParameter("co");
if(co==null||co.equals("")){
	co="p_recommend desc";
}
int totalCnt= pdao.getTotalCnt();//db로부터 가져와야할데이터
int listSize=6;//페이지에 보여줄 리스트 수
int pageSize=3;//보여줄 페이지슈

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s==""){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);//사용자의 현재위치


//총페이지구하기
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
<link rel="stylesheet" type="text/css" href="../css/maincss.css">
<style>

.imgBox{
    	margin:193px;
    	margin-top:120px;
    }
    .imgBox img{
    	margin:50px;
h1{
text-align:center;
}


</style>

</head>

<body>

<%@include file="../header.jsp" %>
<section>
<header>
<h1><%=ta %></h1>
<div class="dropdown">
      <button class="dropbtn">정렬</button>
      <div class="dropdown-content">
        <a href="sidePage.jsp?ta=<%=ta %>&co=p_record desc">신상품</a>
        <a href="sidePage.jsp?ta=<%=ta %>&co=p_recommend desc">추천순</a>
        <a href="sidePage.jsp?ta=<%=ta %>&co=p_price desc">높은 가격</a>
        <a href="sidePage.jsp?ta=<%=ta %>&co=p_price asc">낮은 가격</a>
      </div>
    </div>
</header>
<div class="imgBox">
<%
ArrayList<ProductDTO> arr=pdao.test2(cp,listSize,ta,co);
if(arr==null||arr.size()==0){
	%>
	
	<h1>등록된 게시물이 없음</h1>
	
	<%
}else{

		for(int i=0;i<arr.size();i++){
			
			%> <a href="../newProduct/itemList.jsp?idx=<%=arr.get(i).getIdx() %>">
			<img class="img1" src="../image/<%=arr.get(i).getImgname()%>" width="400" height="500" ></a><%
		}
}
	%>
	
</div>
<div class="paging" align="center">
<%
if(userGroup!=0){
	%><a href="sidePage.jsp?ta=<%=ta %>&co=<%=co %>&cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;&lt;</a><%	
}
%>
<%
		for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
			%>&nbsp;&nbsp;<a href="sidePage.jsp?ta=<%=ta %>&co=<%=co %>&cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
			if(i==totalPage){
				break;
			}
			
		}
%>
<%
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%><a href="sidePage.jsp?ta=<%=ta %>&co=<%=co %>&cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%	
}
%>
</div>
</section>

<%@include file="../footer.jsp" %>
</body>
</html>