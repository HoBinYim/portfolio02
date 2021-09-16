<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.*" %>
    <%@page import="semi.shopping.*" %>
    <jsp:useBean id="sdao" class="semi.shopping.ShoppingDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<style>
#bbs_table{
   width: 1300px;
   margin: 0px auto;
   border: 1px solid #dddddd;
}
#bbs_table th{
   background-color: #eeeeee;
   text-align: center;
}
#bbs_table td{
   text-align: center;
}
</style>

</head>

<%
String u_id=(String)session.getAttribute("u_id");

if(u_id==null){
	%>
	<script>
	window.alert('로그인 후 이용가능한 서비스입니다.');
	location.href='/myweb/login/login.jsp';
	</script>
	<%
	return;
}
int totalCnt= sdao.getTotalCnt();//db로부터 가져와야할데이터
int listSize=3;//페이지에 보여줄 리스트 수
int pageSize=5;//보여줄 페이지슈

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
<body>
<%@include file="../header.jsp" %>
<section>
<article>
<form name ="buylist" action="/myweb/newProduct/buyProduct.jsp?&section=2" onsubmit='return info_chk()'>
<h1>장바구니~</h1>
 <script>
   function info_chk() {
		return true;
		}
		
		
		function info_chk2(frm) {
			 if (confirm("정말 삭제하시겠습니까?")) {
	             // 확인 버튼 클릭 시 동작
				 frm.action="/myweb/cart/deletecart.jsp";
	             
				 frm.submit();
				 
	         } else {
	             // 취소 버튼 클릭 시 동작
	             alert("장바구니페이지로 돌아갑니다.");
	             frm.action="/myweb/cart/cart.jsp"
	         }
		 
		 return true;
		}
		

   </script>
<table id="bbs_table">
<thead>
<tr>
<th>전체</th>
<th>이미지</th>
<th>제목</th>
<th>색상</th>
<th>수량</th>
<th>금액</th>
</tr>
</thead>
<tbody>
<%


ArrayList<ShoppingDTO> arr=sdao.buylist(cp,listSize,u_id);

		for(int i=0;i<arr.size();i++){
		
			%>
			<tr>
				<td>
				
<input type="checkBox" name="ckb" checked value="<%=arr.get(i).getIdx_s()%>">
					
					<%
					int sum =  (arr.get(i).getS_count() * arr.get(i).getS_price());
					%>
					
				</td>
				<td>
				<a href="/myweb/newProduct/itemList.jsp?idx=<%=arr.get(i).getIdx() %>">
					<img src="../image/<%=arr.get(i).getImg()%>" width="300" height="300">
					</a>
				</td>
				<td>
					<%=arr.get(i).getS_name() %>
				</td>
				<td>
					<%=arr.get(i).getS_color() %>
				</td>
				<td>
					<%=arr.get(i).getS_count() %>개
				</td>
				<td>
					<%=sum %>원
				</td>
			</tr>
			<%
			
		}
	
	%>

</tbody>
</table>
<div align="center">
<input type="submit" value="구매" >
<input type="button" value="삭제" onclick="return info_chk2(this.form)">
</div>
</form>
<div class="paging" align="center">
<%
if(userGroup!=0){
	%><a href="cart.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;&lt;</a><%	
}
%>
<%
		for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
			%>&nbsp;&nbsp;<a href="cart.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
			if(i==totalPage){
				break;
			}
			
		}
%>
<%
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%><a href="cart?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%	
}
%>
</div>
</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>