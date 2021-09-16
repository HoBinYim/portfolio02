<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        width: 300px;
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
<body>
<div style="text-align: center">
	<h3>* 아이디 중복검사 *</h3>
	<form name="idCheck" action="idCheck_ok.jsp" method="post">
		아이디 : &nbsp;<input type="text" name="u_id" style="width:200px; height:35px; border-radius:6px; border: 1px solid #dcdcdc; outline: 0;" maxlength="15" placeholder="아이디를 입력해주세요">
		<br>
		<br>
		<input type="submit" value="중복검사" class="btn">
	</form>
</div>
</body>
</html>