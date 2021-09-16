<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ldto" class="semi.likeitem.LikeitemDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ldto"/>
<jsp:useBean id="ldao" class="semi.likeitem.LikeitemDAO"></jsp:useBean>

<%
String idx_1=request.getParameter("idx");
int idx = Integer.parseInt(idx_1);
String l_id=(String)session.getAttribute("u_id");
String l_img=request.getParameter("l_img");
String l_price_1=request.getParameter("l_price");
int l_price = Integer.parseInt(l_price_1);
String l_name=request.getParameter("l_name");
String chk_1=request.getParameter("chk");
int chk=Integer.parseInt(chk_1);

int result=ldao.likeitem(idx, l_id, l_img, l_price, l_name);
String msg=result>1?"등록 성공!":"등록 실패!";

%>
<script>
location.href="../newProduct/itemList.jsp?idx=<%=idx%>";
</script>