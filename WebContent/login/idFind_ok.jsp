<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import ="semi.join.*"%>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String s=request.getParameter("s");
String e=request.getParameter("e");
String u_idhint2=request.getParameter("u_idhint2");

ArrayList<JoinDTO> arr=jdao.idFind(s,e);
if(arr==null||arr.size()==0) {
	%>
	<script>
	window.alert('존재하지 않는 아이디입니다.');
	history.go(-1);
	</script>
	<%
}else{
	%>
	<script>
	window.alert('<%=s%>님의 아이디는 <%=arr.get(0).getU_id().substring(0,3)+"***"%>입니다.');
	location.href='/myweb/login/login.jsp';
	</script>
	<%
}
%>