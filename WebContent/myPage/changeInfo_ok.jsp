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
String u_pwd=request.getParameter("u_pwd");

ArrayList<JoinDTO> arr=jdao.changeInfo(u_id, u_pwd);
if(arr==null||arr.size()==0) {
	%>
	<script>
		window.alert('비밀번호가 틀렸습니다.');
		location.href='changeInfo.jsp';
	</script>
	<%
}else{
	%>
	<script>
		location.href='changeInfo1.jsp?u_id=<%=u_id%>';
	</script>
	<%
}
%>