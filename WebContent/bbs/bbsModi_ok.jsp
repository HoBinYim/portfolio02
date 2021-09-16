<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="semi.bbs.BbsDAO"></jsp:useBean>
<%
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
String b_subject=request.getParameter("b_subject");
String b_content=request.getParameter("b_content");

int result=bdao.bbsModify(idx, b_subject, b_content);
String msg=result>0?"게시글을 수정했습니다.":"게시글을 수정할 수 없습니다.";
%>

<script>
window.alert('<%=msg%>');
location.href='/myweb/bbs/bbs.jsp';
</script>