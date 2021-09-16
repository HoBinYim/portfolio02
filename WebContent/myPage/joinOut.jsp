<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
String u_id=(String)session.getAttribute("u_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JUNKEA</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<style>
.temp-box1{
   margin-bottom:100px;
   float:left;
   margin-left:180px;
   background-color:#EAEAEA;
}

.temp-box2{
   float:center;
   margin-top: 30px;
}

.temp-box1 p:hover{
   background-color: #EAEAEA;
}

.temp-box1 a{
   text-decoration:none;
   color: #000000;
}

.temp-box2_1{
   padding-top: 10px;
}
.changeInfo_tb{
   text-align: center;
   margin: 0px auto;
   border-radius: 10px;
   padding-bottom:100px;
   margin-top: 30px;
   border-spacing:0 10px;
}
input[type=submit] {
            background-color:#dcdcdc;
            color:white;
            width: 300px;
            height: 45px;
            font-size: 15px;
            font-weight: 700;
            border-radius: 6px;
            margin-top: 20px;
            border: 0;
            outline: 0;
}
input[id="a"]{
    width: 200px;
    height: 45px;
    border-radius: 6px;
    border: 1px solid #dcdcdc;
    outline: 0;
    text-align: center;
}
input[id="b"]{
    width: 200px;
    height: 45px;
    border-radius: 6px;
    border: 1px solid #dcdcdc;
    outline: 0;
    text-align: center;
}
.btn:hover{
    background-color:#8c8c8c;
}
</style>
<script>
function check() {
	if(!document.joinOut.u_pwd.value) {
		alert("비밀번호를 입력해주세요.")
		return false;
	}
	if(document.joinOut.u_pwd.value.length<8||document.joinOut.u_pwd.value.length>18) {
	    alert("비밀번호를 8~18자 사이로 입력해주세요.")
	    return false;
	}
}
</script>
</head>
<body>
<%@include file="../header.jsp" %>
<main>
<form name="joinOut" action="joinOut_ok.jsp" method="post" onsubmit="return check(this);">
<div class="main-container">
     <div class="temp-box1">
       <h3>My 쇼핑</h3>
       <br>
       <p><a href="/myweb/myPage/myPage.jsp">구매내역</a></p>
       <br>
       <h3>My 정보</h3>
       <br>
       <p><a href="/myweb/myPage/changeInfo.jsp">개인정보 확인/수정</a></p>
       <p><a href="/myweb/myPage/joinOut.jsp">회원탈퇴</a></p>
   </div>
    <div class="temp-box2" align="center">
       <div class="temp-box2_1">
       <h2>회원탈퇴</h2>
      <p><%=u_name%>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 확인합니다.</p>
      <table class="changeInfo_tb">
         <tr>
            <th>아이디</th>
            <td><input id="a" type="text" name="u_id" value="<%=id%>" readonly></td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td><input id="b" type="password" name="u_pwd" maxlength="18"></td>
         </tr>
         <tr>
            <td colspan="2" align="center"><input type="submit" value="확인" class="btn"></td>
         </tr>
      </table>
      </div>
    </div>
</div>
</form>
</main>
<%@include file="../footer.jsp" %>
</body>
</html>