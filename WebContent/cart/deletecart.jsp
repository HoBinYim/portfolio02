<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="semi.shopping.*" %>
       <jsp:useBean id="sdao" class="semi.shopping.ShoppingDAO"></jsp:useBean>

<%
String [] sCheck_1 = request.getParameterValues("ckb");

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
	int result =sdao.deletecart(sCheck);
		 
	
	String msg=result>0?"상품삭제 완료":"상품삭제 실패";
	
	%>
	<script>
	window.alert('<%=msg%>');
	location.href='/myweb/cart/cart.jsp';
	</script>
	<%
	
	 }
}

	 %>
	 
