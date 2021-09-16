<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@page import="java.util.*"%>
<%@ page import ="semi.join.*"%>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"></jsp:useBean>
<jsp:useBean id="jdto" class="semi.join.JoinDTO"></jsp:useBean>
<%
String u_id=(String)session.getAttribute("u_id");


int result=jdao.joinOut(u_id);
session.invalidate();
%>
<script>
window.alert("아쉽지만 다음에 만나요~");
location.href="/myweb/main.jsp";
</script>
<%
%>