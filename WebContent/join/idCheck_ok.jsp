<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"></jsp:useBean>
<%
String u_id=request.getParameter("u_id");
boolean check=jdao.idCheck(u_id);
if(u_id.equals("")) {
	%>
	<script>
	window.alert('아이디를 입력해주세요.');
	location.href='idCheck.jsp';
	</script>
	<%
}
if(!(u_id.length()>=6&&u_id.length()<=15)){
	%>
	<script>
	window.alert('아이디를 6~15자 사이로 입력해주세요.');
	location.href='idCheck.jsp';
	</script>
	<%
}
if(check){
	%>
	<script>
	window.alert("<%=u_id%>는 사용중인 아이디 입니다.");
	location.href='idCheck.jsp';
	</script>
	<%
}else{
	%>
	<script>
	window.alert("<%=u_id%>는 사용가능한 아이디 입니다.");
	opener.document.join.u_id.value='<%=u_id%>';
	window.self.close();
	</script>
	<%
}
%>