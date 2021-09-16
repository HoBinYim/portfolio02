<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.join.*"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String u_id=request.getParameter("u_id");
String u_pwdhint2=request.getParameter("u_pwdhint2");
%>
<%
ArrayList<JoinDTO> arr=jdao.pwdHintFind(u_id, u_pwdhint2);
if(u_pwdhint2.equals("")) {
	%>
	<script>
	window.alert('힌트를 입력해주세요.');
	history.go(-1);
	</script>
	<%
}else if(!(u_pwdhint2.length()>=2&&u_pwdhint2.length()<=20)){
	%>
	<script>
	window.alert('힌트를 2~20자 사이로 입력해주세요.');
	history.go(-1);
	</script>
	<%
}else if(arr==null||arr.size()==0) {
	%>
	<script>
	window.alert('힌트가 일치하지 않습니다.');
	history.go(-1);
	</script>
	<%
}else{
	%>
	<script>
	window.self.close();
	opener.location.href='pwdFind.jsp?hint3=<%=u_pwdhint2%>&u_id=<%=u_id%>';
	</script>
	<%
}
%>