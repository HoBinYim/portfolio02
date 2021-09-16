<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="jdto" class="semi.join.JoinDTO"></jsp:useBean>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"></jsp:useBean>
<%
String u_id=request.getParameter("u_id");
String u_pwd=request.getParameter("u_pwd");
%>
<%
int result=jdao.pwdModi(u_pwd,u_id);
String msg=result>0?"비밀번호를 변경했습니다.":"비밀번호가 일치하지 않습니다.";
%>
<script>
window.alert('<%=msg%>');
location.href='/myweb/login/login.jsp';
</script>