<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdto" class="semi.review.ReviewDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"/>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO" scope="session"></jsp:useBean>
<%
int result=rdao.reviewRewrite(rdto);
String msg=result>0?"답변 작성 성공":"답변 작성 실패";
%>
<script>
window.alert("<%=msg%>");
location.href='/myweb/main.jsp'
</script>