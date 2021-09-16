<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="jdto" class="semi.join.JoinDTO"></jsp:useBean>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"></jsp:useBean>
<%
int result=jdao.join(jdto);
String msg=result>0?"회원가입을 축하합니다!":"회원가입에 실패하였습니다.";
%>
<script>
window.alert('<%=msg%>');
location.href='/myweb/login/login.jsp';
</script>