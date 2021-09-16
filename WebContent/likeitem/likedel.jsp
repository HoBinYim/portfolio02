<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ldto" class="semi.likeitem.LikeitemDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ldto"/>
<jsp:useBean id="ldao" class="semi.likeitem.LikeitemDAO"></jsp:useBean>
<%
String idx1_1=request.getParameter("idx");
int idx = Integer.parseInt(idx1_1);
String l_id=(String)session.getAttribute("u_id");

int result=ldao.likeitemDel(idx, l_id);
String msg=result>1?"삭제 성공!":"삭제 실패!";
%>
<script>
location.href="../newProduct/itemList.jsp?idx=<%=idx%>";
</script>