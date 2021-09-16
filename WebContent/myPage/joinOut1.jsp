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
.temp-box1 a{
   text-decoration:none;
   color: #000000;
}

.temp-box2_1{
   padding-top: 10px;
}
input[type=submit] {
			margin-top:50px;
            background-color:#dcdcdc;
            color:white;
            width: 70px;
            height: 45px;
            font-size: 15px;
            font-weight: 700;
            border-radius: 6px;
            border: 0;
            outline: 0;
}
input[id="a"] {
			margin-top:50px;
            background-color:#dcdcdc;
            color:white;
            width: 70px;
            height: 45px;
            font-size: 15px;
            font-weight: 700;
            border-radius: 6px;
            border: 0;
            outline: 0;
}
fieldset {
	border:1 solid navy;
	width:930px;
	padding:15px;
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
<form name="joinOut" action="joinOut1_ok.jsp" method="post" onsubmit="return check(this);">
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
</div>
    <div class="temp-box" align="center">
	    <h2 align="center">회원정보 확인</h2>
		<p align="center">정말로 탈퇴하시겠습니까?</p>
		<br>
		<fieldset>
			<legend style="color: red;">유의사항</legend>
			<p align="left">1. 회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며, 회원탈퇴 진행 시 해당 아이디는 영구적으로 삭제됩니다.</p>
			<p align="left">2. 회원탈퇴 처리 후에는 장바구니 내역, 구매 내역, 즐겨찾기 내역이 삭제됩니다.</p>
			<p align="left">3. 게시판형 서비스에 등록한 게시물은 탈퇴 후에도 남아 있습니다. 글이 남아 있는 것을 원치 않으신다면 삭제 후 탈퇴해 주세요.</p>
		</fieldset>
		<input type="submit" value="탈퇴" class="btn">&nbsp;&nbsp;<input id="a" type="button" value="취소" class="btn" onclick="location.href='changeInfo.jsp'">
    </div>
</form>
</main>
<%@include file="../footer.jsp" %>
</body>
</html>