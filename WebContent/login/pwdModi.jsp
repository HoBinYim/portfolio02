<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
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
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
</head>
<style>
#pwdModitable {
   width:500px;
   margin:0px auto;
   border-spacing:15px;
   margin-bottom: 100px;
}
.btn{
    background-color:#dcdcdc;
        color:white;
        width: 100%;
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
.btn2{
   background-color:#dcdcdc;
        color:white;
        width: 40%;
        height: 35px;
        font-size: 15px;
        font-weight: 700;
        border-radius: 6px;
        border: 0;
        outline: 0;
        font-size:12px;
        margin-left:170px;
        margin-top: 30px;
}
h2{
   text-align: center;
   margin-top: 100px;
}
</style>
<script>
function check() {
	if(!document.pwdModi.u_pwd.value) {
		alert("비밀번호를 입력해주세요.")
		return false;
	}
    if(!document.pwdModi.u_repwd.value) {
		alert("비밀번호를 다시 입력해주세요.")
		return false;
	}
    if(document.pwdModi.u_pwd.value!=document.pwdModi.u_repwd.value) {
		alert("비밀번호가 일치하지 않습니다.")
		return false;
	}
}
</script>
<body>
<%@include file="../header.jsp" %>
<section>
<%
String u_id=request.getParameter("u_id");
String u_pwdhint2=request.getParameter("u_pwdhint2");
%>
<form name="pwdModi" action="pwdModi_ok.jsp" method="post" onsubmit="return check(this);">
<input type="hidden" name="u_id" value="<%=u_id%>">
	<h2>비밀번호 변경</h2>
	<br>
	<table id="pwdModitable">
	<%
	ArrayList<JoinDTO> arr=jdao.pwdHintFind(u_id, u_pwdhint2);
	if(arr==null||arr.size()==0){
	%>
	<tr>
		<td><input type="text">값이 없습니다.</td>
	</tr>
	<%
	}else{
	for(int i=0;i<arr.size();i++){
	%>
		<tr>
			<th>현재 비밀번호</th>
			<td><input id="pwdModitext" name="u_id" value="<%=arr.get(i).getU_pwd().substring(0,3)+"******"%>" type="text" style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;" readonly></td>
		</tr>
		<tr>
			<th>변경할 비밀번호</th>
			<td><input id="pwdModitext" name="u_pwd" type="password" placeholder="고객님의 비밀번호를 입력해주세요" maxlength="20" style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
		</tr>
		<tr>
			<th>비밀번호 재확인</th>
			<td><input id="pwdModitext" name="u_repwd" type="password" placeholder="고객님의 비밀번호를 입력해주세요" maxlength="20" style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="비밀번호 변경" class="btn2"></td>
		</tr>
	</table>
	<%
	}
	}
	%>
</form>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>