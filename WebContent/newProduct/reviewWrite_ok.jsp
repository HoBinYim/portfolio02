<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO" scope="session"></jsp:useBean>
<jsp:useBean id="rdto" class="semi.review.ReviewDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"/>
<%
int result=rdao.reviewWrite(rdto);
String msg=result>0?"리뷰가 등록되었습니다.":"리뷰를 등록할 수 없습니다.";
String idx1 = request.getParameter("idx");
%>
<script>
window.alert('<%=msg%>');
window.close();
opener.location.href="/myweb/newProduct/itemList.jsp?idx=<%=idx1%>";
</script>