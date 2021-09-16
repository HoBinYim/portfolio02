<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import ="semi.join.*"%>
<jsp:useBean id="jdao" class="semi.join.JoinDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String u_id=request.getParameter("u_id");
ArrayList<JoinDTO> arr=jdao.idInfo(u_id);
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

h2{
   text-align: center;
}

.changeInfo_tb{
   text-align: center;
   margin: 0px auto;
   border-radius: 10px;
   padding-bottom:100px;
   border-spacing:0 10px;
}

select {
  width: 100%;
  padding: 16px 20px;
  border: none;
  border-radius: 4px;
  background-color: #f1f1f1;
}
#a input[type=submit] {
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
#a input[type=text]{
    width: 200px;
    height: 45px;
    border-radius: 6px;
    border: 1px solid #dcdcdc;
    outline: 0;
    text-align: center;
}
#a input[type=password]{
    width: 200px;
    height: 45px;
    border-radius: 6px;
    border: 1px solid #dcdcdc;
    outline: 0;
	text-align: center;
}
.btn{
   margin-top: 30px;
}
#a input[type=submit]:hover{
	background-color:#8c8c8c;
}
</style>
<script>
function check(){
	if(!document.changeInfo1.u_idhint1.value) {
		alert("아이디 힌트를 선택해주세요.")
		return false;
	}
	if(!document.changeInfo1.u_idhint2.value) {
		alert("아이디 힌트를 입력해주세요.")
		return false;
	}
	if(document.changeInfo1.u_idhint2.value.length<2||document.changeInfo1.u_idhint2.value.length>20) {
       alert("아이디 힌트를 2~20자 사이로 입력해주세요.")
       return false;
   }
	if(!document.changeInfo1.u_pwd.value) {
		alert("비밀번호를 입력해주세요.")
		return false;
	}
	if(document.changeInfo1.u_pwd.value.length<8||document.changeInfo1.u_pwd.value.length>18) {
       alert("비밀번호를 8~18자 사이로 입력해주세요.")
       return false;
   }
	if(!document.changeInfo1.u_repwd.value) {
		alert("비밀번호를 다시 입력해주세요.")
		return false;
	}
	if(document.changeInfo1.u_pwd.value!=document.changeInfo1.u_repwd.value) {
		alert("비밀번호가 일치하지 않습니다.")
		return false;
	}
	if(!document.changeInfo1.u_pwdhint1.value) {
		alert("비밀번호 힌트를 선택해주세요.")
		return false;
	}
	if(!document.changeInfo1.u_pwdhint2.value) {
		alert("비밀번호 힌트를 입력해주세요.")
		return false;
	}
	if (document.changeInfo1.u_pwdhint2.value.length<2||document.changeInfo1.u_pwdhint2.value.length>20) {
       alert("비밀번호 힌트를 2~20자 사이로 입력해주세요.")
       return false;
   }
	if(!document.changeInfo1.u_name.value) {
		alert("이름을 입력해주세요.")
		return false;
	}
	if (document.changeInfo1.u_name.value.length<2||document.changeInfo1.u_name.value.length>10) {
       alert("이름을 2~10자 사이로 입력해주세요.")
       return false;
	}
	if(!document.changeInfo1.u_email.value) {
		alert("이메일을 입력해주세요.")
		return false;
	}
	if(!document.changeInfo1.u_tel.value) {
		alert("전화번호를 입력해주세요.")
		return false;
	}
	if (document.changeInfo1.u_tel.value.length<10||document.changeInfo1.u_tel.value.length>11) {
       alert("전화번호를 10~11자 사이로 입력해주세요.")
       return false;
	}
	if(!document.changeInfo1.u_addr.value) {
		alert("주소를 입력해주세요.")
		return false;
	}
	if (document.changeInfo1.u_addr.value.length<10||document.changeInfo1.u_addr.value.length>20) {
       alert("주소를 10~20자 사이로 입력해주세요.")
       return false;
	}
}
</script>
</head>
<style>
=
</style>
<body onload="test()">
<%@include file="../header.jsp" %>
<section>
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
   <form name="changeInfo1" action="changeInfo1_ok.jsp" onload="test();" method="post" onsubmit="return check(this);">
    <div id="a" class="temp-box2" align="center">
       <div class="temp-box2_1">
   <h2>회원정보 수정</h2>
   <br>
   <table class="changeInfo_tb">
<%
ArrayList<JoinDTO> arr1=jdao.idInfo(u_id);
if(arr1==null||arr1.size()==0){
   %>
   <tr>
   <td><input id="jointext1" type="text" name="u_idhint2" value=""></td>
   </tr>
   <%
}else{
   for(int i=0;i<arr1.size();i++){
   %>
<tr>
<th>아이디</th>
<td colspan="4"><input type="text" name="u_id" value="<%=u_id%>" readonly style="width:100%;"></td>
</tr>
<tr>
<th>아이디 힌트</th>
<td>
<select name="u_idhint1" id="u_idhint1">
    <option value="" selected="selected">======선택하세요======</option>
    <option value="어머니 성함은?">어머니 성함은?</option>
    <option value="아버지 성함은?">아버지 성함은?</option>
    <option value="가장 좋아하는 스포츠는?">가장 좋아하는 스포츠는?</option>
    <option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
    <option value="가장 좋아하는 연예인은?">가장 좋아하는 연예인은?</option>
    <option value="가장 좋아하는 색상은?">가장 좋아하는 색상은?</option>
    <option value="어릴적 감명깊게 본 영화는?">어릴적 감명깊게 본 영화는?</option>
</select>
</td>
<td><input type="text" name="u_idhint2" style="width:100%;" maxlength="20"></td>
</tr>
<tr>
   <th>비밀번호</th>
   <td colspan="2"><input type="password" name="u_pwd" placeholder="비밀번호을 입력해주세요" style="width:100%;" maxlength="18"></td>
</tr>
<tr>
   <th>비밀번호 확인</th>
   <td colspan="2"><input type="password" name="u_repwd" placeholder="비밀번호을 한번 더 입력해주세요" style="width:100%;" maxlength="18"></td>
   
</tr>
<tr>
   <th>비밀번호 힌트</th>
   <td>
      <select name="u_pwdhint1">
          <option value="" selected="selected">======선택하세요======</option>
          <option value="어머니 성함은?">어머니 성함은?</option>
          <option value="아버지 성함은?">아버지 성함은?</option>
          <option value="가장 좋아하는 스포츠는?">가장 좋아하는 스포츠는?</option>
          <option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
          <option value="가장 좋아하는 연예인은?">가장 좋아하는 연예인은?</option>
          <option value="가장 좋아하는 색상은?">가장 좋아하는 색상은?</option>
          <option value="어릴적 감명깊게 본 영화는?">어릴적 감명깊게 본 영화는?</option>
      </select>
   </td>
   <td><input type="text" name="u_pwdhint2" style="width:100%;" maxlength="20"></td>
</tr>
<tr>
   <th>이름</th>
   <td colspan="2"><input type="text" name="u_name" value="<%=arr.get(i).getU_name()%>" style="float:left; width:100%" maxlength="10"></td>
   
</tr>
<tr>
   <th>이메일</th>
   <td colspan="2"><input type="text" name="u_email" value="<%=arr.get(i).getU_email()%>" style="float:left; width:100%;" readonly></td>   
   
</tr>
<tr>
   <th>휴대폰</th>
   <td colspan="2"><input type="text" name="u_tel" value="<%=arr.get(i).getU_tel()%>"  style="float:left;  width:100%;" maxlength="12"></td>   
   
</tr>
<tr>
   <th>주소</th>
   <td colspan="2"><input type="text" name="u_addr" value="<%=arr.get(i).getU_addr()%>" style="float:left; width:100%;" maxlength="20"></td>
   
</tr>
<tr>
   <th>성별</th>
   <td colspan="2">
      <input type="radio" name="u_sex" value="남">남성
      <input type="radio" name="u_sex" value="여">여성
      <input type="radio" name="u_sex" value="없음" checked="checked">선택안함
   </td>
</tr>
<tr>
   <th>생년월일</th>
   <td colspan="2"><input type="date" name="u_birth" required pattern="\d{2}-\d{2}-\d{2}" value="<%=arr.get(i).getU_birth().substring(0,8)%>"></td>
 </tr>
 <tr>
      <td colspan="3"><input type="submit" value="확인" class="btn" style="margin-left:100px;"></td>
</tr>
<%
}
}
%>
</table>
</div>
</div>
</form>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>