<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@page import="java.util.*"%>
<%@page import="java.net.*"%>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"></jsp:useBean>
<%
String u_id=request.getParameter("u_id");
String u_pwd=request.getParameter("u_pwd");
String saveid=request.getParameter("saveid");

int result=jdao.login(u_id, u_pwd);

if(result==jdao.LOGIN_OK){
	
	if(saveid==null) {
		Cookie ck=new Cookie("saveid", u_id);
		ck.setMaxAge(0);
		response.addCookie(ck);
	}else{
		Cookie ck=new Cookie("saveid", u_id);
		ck.setMaxAge(60*60*24);
		response.addCookie(ck);
	}
	String u_name=jdao.getUserInfo(u_id);
	session.setAttribute("u_id", u_id);
	session.setAttribute("u_name", u_name);
	  %>
	  <script>
	  window.alert("<%=u_name%>님 환영합니다");
	  location.href="../main.jsp"
	  </script>
	  <%
}
else if(result==jdao.NOT_ID||result==jdao.NOT_PWD){
   %>
   <script>
      window.alert("아이디 또는 비밀번호가 잘못되었습니다.");
      location.href="login.jsp";
   </script>
   <%
}
%>