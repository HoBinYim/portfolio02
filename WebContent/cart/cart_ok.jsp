<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="semi.shopping.*" %>
    <jsp:useBean id="sdao" class="semi.shopping.ShoppingDAO"></jsp:useBean>
<%
String s_count_1 = request.getParameter("count");
String idx_1 = request.getParameter("idx");
if(idx_1==null||idx_1.equals(""))
{
	idx_1="0";
}


String u_id="";
if(session.getAttribute("u_id")!=null)
{
	u_id=(String)session.getAttribute("u_id");
}
String img = request.getParameter("img");
String s_name = request.getParameter("s_name");

String s_price_1 = request.getParameter("s_price");
String s_color= request.getParameter("selectBox");
if(s_price_1==null||s_price_1.equals(""))
{
	s_price_1="0";
}
if(s_color==null||s_color.equals(""))
{
	s_color="pink";
}

int idx = Integer.parseInt(idx_1);
int s_price = Integer.parseInt(s_price_1);
if(s_count_1==null || s_count_1.equals("")){
	%>
	<script>
	window.alert("개수를 입력안했습니다.");
	location.href="/myweb/newProduct/itemList.jsp?idx=<%=idx_1%>&img=<%=img%>&s_name=<%=s_name%>&s_price=<%=s_price_1%>";
	</script>
	<%
	return;
}
int s_count = Integer.parseInt(s_count_1);
int result = sdao.addshoppinglist(idx, u_id, img, s_name, s_count, s_price, s_color);

%>

	<script>
	document.location.href="cart.jsp"
	</script>