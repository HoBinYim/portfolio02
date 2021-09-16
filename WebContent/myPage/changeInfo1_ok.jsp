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
String u_idhint1=request.getParameter("u_idhint1");
String u_idhint2=request.getParameter("u_idhint2");
String u_pwd=request.getParameter("u_pwd");
String u_pwdhint1=request.getParameter("u_pwdhint1");
String u_pwdhint2=request.getParameter("u_pwdhint2");
String u_name=request.getParameter("u_name");
String u_email=request.getParameter("u_email");
String u_tel=request.getParameter("u_tel");
String u_addr=request.getParameter("u_addr");
String u_sex=request.getParameter("u_sex");
String u_birth=request.getParameter("u_birth");
String u_id=request.getParameter("u_id");

ArrayList<JoinDTO> arr=jdao.changeInfo1(u_idhint1, u_idhint2, u_pwd, u_pwdhint1, u_pwdhint2, u_name, u_email, u_tel, u_addr, u_sex, u_birth, u_id);
if(arr==null||arr.size()==0) {
	%>
	%>
	<script>
		window.alert('회원정보 수정완료!');
		location.href='/myweb/myPage/changeInfo.jsp?u_id=<%=u_id%>';
	</script>
	<%
	return;
}else{
	%>
	<script>
		window.alert('회원정보 수정실패!');
		location.href='/myweb/myPage/changeInfo1.jsp';
	</script>
	<%
	return;
}
%>