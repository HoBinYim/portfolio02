<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="semi.join.*" %>
    <%@page import="semi.shopping.*" %>
    
    <jsp:useBean id="jdao" class="semi.join.JoinDAO"></jsp:useBean>
    <jsp:useBean id="sdao" class="semi.shopping.ShoppingDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<script>
function cancle(){
	location.href="/myweb/main.jsp";
}
</script>
<style>
#bbs_table {
   padding:30px;
   width: 1300px;
   margin: 0px auto;
  
}
#bbs_table th{
   
   text-align: left;
   font-size:30px;
   border-bottom:1px solid skyblue;
}
#bbs_table td{
padding:10px;
   font-size:20px;
   width:500px;
}
.firstline{
text-align:left;

margin-right:10px;
}
.secondline{
text-align:center;

}
form{
margin-top:100px;
}
</style>
</head>
<% 
ArrayList<ShoppingDTO> arr =new ArrayList<ShoppingDTO>();
String [] sCheck_1 = request.getParameterValues("ckb");

String u_id=(String)session.getAttribute("u_id");
int sum = 0;
%>
<body>
<%@include file="../header.jsp" %>
<section>

<form name="buyProduct" action="buyComplete.jsp">
<h1>주문/결제</h1>
<%

ArrayList<JoinDTO> arr1 = jdao.getbuyInfo(u_id);

for(int i=0;i<arr1.size();i++){
	JoinDTO edto = arr1.get(i);
%>
<table id="bbs_table" >
<tr>
<th colspan="2">구매자 정보</th>
</tr>
	<tr>
		<td class="firstline">
		이름
		</td>
		<td class="secondline">
		<%=edto.getU_name() %>
		</td>
		</tr>
		
		<tr>
		<td class="firstline">
		이메일
		</td>
		<td class="secondline">
		<%=edto.getU_email() %>
		</td>
		</tr>
		
		<tr>
		<td class="firstline">
		휴대폰 번호
		</td>
		<td class="secondline">
		<%=edto.getU_tel() %>
		</td>
		
	</tr>
</table>

<table id="bbs_table" >
	<tr>
		<th colspan="2">받는사람정보</th>
	</tr>
	<tr>
		<td class="firstline">
		이름
		</td>
		<td class="secondline">
		<%=edto.getU_name() %>
		</td>
	</tr>
		<tr>
		<td class="firstline">
		배송주소
		</td>
		<td class="secondline">
		<%=edto.getU_addr() %>
		</td>
	</tr>
		<tr>
		<td class="firstline">
		연락처
		</td>
		<td class="secondline">
		<%=edto.getU_tel() %>
		</td>
	</tr>
</table>
<% } %>
<%
if(sCheck_1==null){
	String idx_1 = request.getParameter("idx");
	int idx = Integer.parseInt(idx_1);
String img = request.getParameter("img");
String s_name = request.getParameter("s_name");
String count1 = request.getParameter("count");
int count = Integer.parseInt(count1);
String s_price1 = request.getParameter("s_price");
int s_price = Integer.parseInt(s_price1);
String color = request.getParameter("selectBox");
System.out.println(u_id);

%>

<input type="hidden" name="buylist_idx" value=<%=idx %>>
<input type="hidden" name="hidx" value="null">
<input type="hidden" name="buylist_count" value=<%=count %>>
<input type="hidden" name="buylist_color" value=<%=color %>>
<input type="hidden" name="buylist_price" value=<%=s_price %>>
<input type="hidden" name="buylist_img" value=<%=img %>>
<input type="hidden" name="buylist_name" value=<%=s_name %>>

<table id="bbs_table" >
	<tr>
		<th colspan="2">
	결제정보
		</th>
	</tr>
	<tr>
		<td class="firstline">
		상품명
		</td>
		<td class="secondline">
		 <%=s_name %>
		</td>
	</tr>
	<tr>
		<td class="firstline">
		금액
		</td>
		<td class="secondline">
		<%=s_price %>원
		</td>
	</tr>
	<tr>
		<td class="firstline">
		색상
		</td>
		<td class="secondline">
		<%=color%>
		</td>
	</tr>
	<tr>
		<td class="firstline">
		수량
		</td>
		<td class="secondline">
		<%=count %>개
		</td>
	</tr>
	<tr>
		<td class="firstline">
		배송비
		</td>
		<td class="secondline">
		2500원
		</td>
	</tr>
	<tr>
		<td class="firstline">
		결제수단
		</td>
		<td class="secondline">
		<input type="radio" name="pay">핸드폰
		<input type="radio" name="pay">신용카드
		<input type="radio" name="pay">가상계좌
		<input type="radio" name="pay">계좌이체
		</td>
	</tr>
	<tr>
	<th colspan="2">
	</th>
	</tr>
	
	<tr>
		<td class="firstline">
		총결제금액
		</td>
		<td class="secondline"> 
		<%=s_price+2500 %>원
		</td>
	</tr>
</table>
<% } else{%>

<table id="bbs_table" >
	<tr>
		<th colspan="2">
	결제정보
		</th>
	</tr>
	</table>
<% 
for(int i =0;i<sCheck_1.length;i++){
	 if(sCheck_1[i]==null){

	%>
	<script>
	window.alert("체크된 값이 없습니다.");
	 location.href="/myweb/cart/cart.jsp";
	</script>
	<% 
	 }else{
		 int sCheck = Integer.parseInt(sCheck_1[i]); 
	ShoppingDTO dto =sdao.gettest(sCheck);
		 arr.add(dto);
		 
	 }

	 %>
	 <input type="hidden" name="hidx" value=<%=arr.get(i).getIdx_s() %>>
	 <table id="bbs_table">
	 <tr>
		<td class="firstline">
		상품명
		</td>
		<td class="secondline">
		 <%=arr.get(i).getS_name()%>
		</td>
	</tr>
	<tr>
		<td class="firstline">
		금액
		</td>
		<td class="secondline">
		<%=arr.get(i).getS_price() %>원
		<%
		sum+=arr.get(i).getS_price();
		%>
		</td>
	</tr>
	<tr>
		<td class="firstline">
		색상
		</td>
		<td class="secondline">
		<%=arr.get(i).getS_color() %>
		</td>
	</tr>
	<tr>
		<td class="firstline">
		수량
		</td>
		<td class="secondline">
		<%=arr.get(i).getS_count() %>개
		</td>
		
	</tr>
	</table>
	 <%
	 
}
%>
<table id="bbs_table">
	<tr>
		<td class="firstline">
		배송비
		</td>
		<td class="secondline">
		2500원
		</td>
	</tr>
	<tr>
		<td class="firstline">
		결제수단
		</td>
		<td class="secondline">
		<input type="radio" name="pay">핸드폰
		<input type="radio" name="pay">신용카드
		<input type="radio" name="pay">가상계좌
		<input type="radio" name="pay">계좌이체
		</td>
	</tr>
	<tr>
	<th colspan="2">
	</th>
	</tr>
	<tr>
		<td class="firstline">
		총결제금액
		</td>
		<td class="secondline"> 
			<%=sum %>원
		</td>
	</tr>
</table>
<%} %>
<div align="center">
<input type="submit" value="구매" class="btn" >
<input type="button" value="취소" class="btn" onclick="cancle()">
</div>
</form>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>