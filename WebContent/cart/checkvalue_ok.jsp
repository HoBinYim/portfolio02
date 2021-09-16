<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.util.*" %>
    <%@page import="semi.product.*" %>
    <jsp:useBean id="pdao" class="semi.product.ProductDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
ArrayList<ProductDTO> arr =new ArrayList<ProductDTO>();
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
	ProductDTO dto =pdao.gettest(sCheck);
		 arr.add(dto);
		 
	 }

}
%>

</body>
</html>