<%@page import="org.apache.catalina.util.Introspection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="semi.shopping.*" %>
    <%@page import="semi.buylist.*" %>
     <%@page import="java.util.*" %>
   

    <jsp:useBean id="sdao" class="semi.shopping.ShoppingDAO"></jsp:useBean>
    <jsp:useBean id="buydao" class="semi.buylist.BuylistDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<style>
h1{
font-size:100px;
margin-top:150px;
}
</style>
</head>
<%
String u_id=(String)session.getAttribute("u_id");
String hidx = request.getParameter("hidx");
System.out.println(hidx);
if(!hidx.equals("null")){

ArrayList<ShoppingDTO> arr =new ArrayList<ShoppingDTO>();
String [] sCheck_1 = request.getParameterValues("hidx");

for(int i =0;i<sCheck_1.length;i++){
		
		 int sCheck = Integer.parseInt(sCheck_1[i]);
			ShoppingDTO dto =sdao.gettest(sCheck);
			arr.add(dto);
		 
	 
	int idx= arr.get(i).getIdx();
	String b_name= arr.get(i).getS_name();
	 int b_count = arr.get(i).getS_count();
	 int b_price=arr.get(i).getS_price();
	 String b_color=arr.get(i).getS_color();
	 String img = arr.get(i).getImg();
	 int result = buydao.buylist(idx,u_id,img,b_name,b_count,b_price,b_color);
	 
		
	 
}
}else{
	String idx_1 = request.getParameter("buylist_idx");
	String img = request.getParameter("buylist_img");
	String b_name = request.getParameter("buylist_name");
	String b_count_1 = request.getParameter("buylist_count");
	String b_price_1 = request.getParameter("buylist_price");
	String b_color = request.getParameter("buylist_color");
	System.out.println(idx_1);
	System.out.println(img);
	System.out.println(b_name);
	System.out.println(b_count_1);
	System.out.println(b_price_1);
	System.out.println(b_color);
	int idx = Integer.parseInt(idx_1);
	int b_count = Integer.parseInt(b_count_1);
	int b_price = Integer.parseInt(b_price_1);
	
	
	int result = buydao.buylist(idx,u_id,img,b_name,b_count,b_price,b_color);
	
	
	
}
%>

<body>
<%@include file="../header.jsp" %>
<section>
<h1>구매해주셔서<br> 감사합니다</h1>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>