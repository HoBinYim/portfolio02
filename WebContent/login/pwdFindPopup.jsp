<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="semi.join.*"%>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JUNKEA</title>
<style>
h2{
	text-align:center;
}
.btn{
    background-color:#dcdcdc;
        color:white;
        width: 350px;
        height: 35px;
        font-size: 15px;
        font-weight: 700;
        border-radius: 6px;
        border: 0;
        outline: 0;
        font-size:12px;
}
.btn:hover{
   background-color:#8c8c8c;
}
</style>
</head>
<%
String u_id=request.getParameter("u_id");
%>
<body>
<form name="pwdPopupt" action="pwdFindPopup_ok.jsp">
<input type="hidden" name="u_id" value="<%=u_id%>">
<div style="text-align: center">
	<h3>* 비밀번호 힌트 *</h3>
	<%
	ArrayList<JoinDTO> arr=jdao.pwdFind(u_id);
	if(arr==null||arr.size()==0) {
		%>
		<script>
		window.alert('존재하지 않는 아이디입니다.');
		window.self.close();
		</script>
		<%
	}else{
	for(int i=0;i<arr.size();i++){
	%>
	힌트 : &nbsp;<input type="text" name="hint" value="<%=arr.get(i).getU_pwdhint1()%>" style="width:300px; height:35px; border-radius:6px; border: 1px solid #dcdcdc; outline: 0;" readonly>
	<%
	}
	}
	%>
	<br>
	<br>
	정답 : &nbsp;<input type="text" name="u_pwdhint2" placeholder="가입 시 등록하신 비밀번호를 입력해주세요." style="width:300px; height:35px; border-radius:6px; border: 1px solid #dcdcdc; outline: 0;" maxlength="20">
	<br>
	<br>
	<input type="submit" value="확인" class="btn">
</div>
</form>
</body>
</html>