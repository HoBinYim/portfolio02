<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.product.*" %>

<jsp:useBean id="pdto" class="semi.product.ProductDTO"></jsp:useBean>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="semi.product.ProductDAO"></jsp:useBean>
<%
String co=request.getParameter("co");
if(co==null||co.equals("")){
	co="p_recommend desc";
}
int totalCnt=pdao.getTotalCnt();//db로부터
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
   h1{
text-align:center;
}
    .imgBox{
    	margin:193px;
    	margin-top:50px;
    }
    .imgBox img{
    	margin:50px;
    }
/*********************************/

/*********************************/
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<header>
    <h1>베스트</h1>
    <br>
    <div class="dropdown">
      <button class="dropbtn">정렬</button>
      <div class="dropdown-content">
        <a href="bestProduct.jsp?co=p_record desc">신상품</a>
        <a href="bestProduct.jsp?co=p_recommend desc">추천순</a>
        <a href="bestProduct.jsp?co=p_price desc">높은 가격</a>
        <a href="bestProduct.jsp?co=p_price">낮은 가격</a>
      </div>
    </div>
    <br>
</header>
<br>
<div class="imgBox">
    	<%
    		ArrayList<ProductDTO> arr=pdao.SortProduct(cp, listSize, co);
			for(int i=0;i<arr.size();i++){
				%> <a href="../newProduct/itemList.jsp?idx=<%=arr.get(i).getIdx() %>">
					<img src="../image/<%=arr.get(i).getImgname()%>"width="400" height="500"></a>
				<%
			}
		%>
<table class="paging" align="center">
	<tr>
		<td>
		<%
		if(userGroup!=0){
			%><a href="bestProduct.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&nvlArr;</a><%
		}
		%>
		<%
			for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
				%>&nbsp;&nbsp;<a href="bestProduct.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
				if(i==totalPage){
					break;
				}
			}
		%>
		<%
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			%><a href="bestProduct.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&nvrArr;</a><%
		}
		%>
		</td>
	</tr>
</table>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>