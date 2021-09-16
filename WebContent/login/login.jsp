<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JUNKEA</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
</head>
<style>
#logintable {
	margin:0px auto;
	border-spacing:5px;
}
#logintable th {
	text-align:left;
	font-size:13px;
}
#logintext {
  width:300px;
  height:40px;
}
h2 {
	text-align:center;
}
#loginbutton {
	text-align:center;
	pading:50px 20px;
	font-size:10px;
}
#loginbutton a {
	text-decoration: none;
	color:black;
}
.btn{
    background-color:#dcdcdc;
        color:white;
        width: 300px;
        height: 35px;
        font-size: 15px;
        font-weight: 700;
        border-radius: 6px;
        border: 0;
        outline: 0;
        font-size:12px;
        margin-top:10px;
}
.btn:hover{
   background-color:#8c8c8c;
}
</style>
<%
String saveid="";
Cookie cks[]=request.getCookies();
if(cks==null){
	for(int i=0;i<cks.length;i++) {	
		if(cks[i].getName().equals("saveid")){
			saveid=cks[i].getValue();
		}
	}
}
%>
<body>
<%@include file="../header.jsp" %>
<section>
<form name="login" method="post" action="login_ok.jsp">
	<br><br><br><br>
	<h2>로그인</h2>
	<br>
	<table id="logintable">
		<tr>
			<th>아이디</th>
		<tr>
		<tr>
			<td><input id="logintext" type="text" name="u_id" value="<%=saveid%>" placeholder="아이디를 입력해주세요" maxlength="15" style="width: 300px; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
		<tr>
		<tr></tr>
		<tr>
			<th>비밀번호</th>
		<tr>	
		<tr>
			<td><input id="logintext" type="password" name="u_pwd" placeholder="비밀번호를 입력해주세요" maxlength="18" style="width: 300px; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>	
		</tr>
	</table>
		<div id="loginbutton">
		<input type="checkbox" name="saveid" <%=saveid.equals("")?"":"checked"%>>아이디 저장 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/myweb/login/idFind.jsp">아이디 찾기</a> | <a href="pwdFind.jsp">비밀번호 찾기</a>
		</div>
		<br>
		<div align="center">
		<input type="submit" value="로그인" class="btn">
		<br>
		<input type="button" value="회원가입" onclick="location.href='/myweb/join/join.jsp'" class="btn">
		</div>
		<br>
</form>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>