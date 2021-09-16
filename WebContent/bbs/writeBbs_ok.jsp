<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdto" class="semi.bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="semi.bbs.BbsDAO"></jsp:useBean>

<%
String u_id=(String)session.getAttribute("u_id");
int result=bdao.bbsWrite(bdto,u_id);
String msg=result>0?"게시글 등록완료":"게시글 등록실패";
%>

<script>
window.alert('<%=msg%>');
location.href='/myweb/bbs/bbs.jsp';
</script>