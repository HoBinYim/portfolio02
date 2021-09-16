<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"></jsp:useBean>
<%
String u_email=request.getParameter("u_email");
boolean check=jdao.emailCheck(u_email);
if(u_email.equals("")) {
	%>
	<script>
	window.alert('이메일을 입력해주세요.');
	location.href='emailCheck.jsp';
	</script>
	<%
}
if(!(u_email.length()>=10&&u_email.length()<=20)){
	%>
	<script>
	window.alert('이메일을 10~20자 사이로 입력해주세요.');
	location.href='emailCheck.jsp';
	</script>
	<%
}
if(check){
	%>
	<script>
	window.alert("<%=u_email%>는 사용중입니다.");
	location.href='emailCheck.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert("<%=u_email%>는 사용가능합니다.");
	opener.document.join.u_email.value='<%=u_email%>';
	window.self.close();
	</script>
	<%
}
%>