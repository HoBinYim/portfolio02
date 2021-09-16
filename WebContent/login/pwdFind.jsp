<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JUNKEA</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<script>
function send(){
    var u_id=document.pwdFind.u_id.value;
    if(!document.pwdFind.u_id.value) {
		alert("아이디를 입력해주세요.")
		return false;
	}
    window.open('pwdFindPopup.jsp?u_id='+u_id,'pwdFindPopup','width=400, height=250, left=100, top=50');
}
function pwdFind1() {
    if(!document.pwdFind.u_id.value) {
		alert("아이디를 입력해주세요.")
		return false;
	}
    if(!document.pwdFind.u_pwdhint2.value) {
		alert("힌트를 입력해주세요.")
		return false;
	}
}
</script>
</head>
<style>
#pwdFindtable {
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
        margin-top:30px;
}
h2{
   text-align: center;
   margin-top: 100px;
}

.btn2:hover{
   background-color:#8c8c8c;
}
</style>
<body>
<%@include file="../header.jsp" %>
<section>
<form name="pwdFind" action="pwdFind_ok.jsp" onsubmit="return pwdFind1(this);" method="post">
<%
String hint3=request.getParameter("hint3");
String u_id=request.getParameter("u_id");
%>
	<h2>비밀번호 찾기</h2>
	<br>
	<table id="pwdFindtable">
		<tr>
			<th>아이디</th>
		<%
		if(u_id==null){
		%>
		<td colspan="2"><input id="pwdFindtext" name="u_id" type="text" placeholder="고객님의 아이디를 입력해주세요" maxlength="15" style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
		<%
		}else{
		%>
		<td colspan="2"><input id="pwdFindtext" name="u_id" type="text" value="<%=u_id%>" style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;" readonly></td>
		<%
		}
		%>
		</tr>
		<tr>
			<th>힌트</th>
			<%
			if(hint3==null){
			%>
			<td colspan="2"><input id="pwdFindtext" name="u_pwdhint2" type="text" placeholder="힌트 버튼을 눌러주세요" style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;" readonly></td>
			<%
			}else{
			%>
			<td><input id="pwdFindtext" name="u_pwdhint2" type="text" value=<%=hint3%> style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;" readonly><td>
			<%
			}
			%>
			<td><input type="button" name="" value="힌트" onclick="send();" style="margin-left: 10px;" class="btn"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="비밀번호 확인" class="btn2"></td>
		</tr>
	</table>
</form>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>