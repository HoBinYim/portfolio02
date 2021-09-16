<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가구공장</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
</head>
<style>
h2{
   text-align: center;
}
#jointable{
   
   margin: 0px auto;
   border-spacing: 0 10px;   
}
input[type=password]{
   width: 94%;
    height: 35px;
      border-radius: 6px;
    border: 1px solid #dcdcdc;
    outline: 0;
}
select {
  width: 100%;
  padding: 16px 20px;
  border: none;
  border-radius: 4px;
  background-color: #f1f1f1;
}
.btn{
    background-color:#dcdcdc;
        color:white;
        width: 17%;
        height: 45px;
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
#radio_join{

   margin-left: 90px;
}
</style>
<script>
function idCheck() {
   window.open('idCheck.jsp','idCheck','width=400, height=300, left=100, top=50');
   }
function emailCheck() {
   window.open('emailCheck.jsp','emailCheck','width=400, height=300, left=100, top=50');
}
function check() {
   if(!document.join.u_id.value) {
      alert("아이디를 입력해주세요.")
      return false;
   }
   if(!document.join.u_idhint1.value) {
      alert("아이디 힌트를 선택해주세요.")
      return false;
   }
   if(!document.join.u_idhint2.value) {
      alert("아이디 힌트를 입력해주세요.")
      return false;
   }
   if (document.join.u_idhint2.value.length<2||document.join.u_idhint2.value.length>20) {
        alert("아이디 힌트를 2~20자 사이로 입력해주세요.")
        return false;
    }
   if(!document.join.u_pwd.value) {
      alert("비밀번호를 입력해주세요.")
      return false;
   }
   if (document.join.u_pwd.value.length<8||document.join.u_pwd.value.length>18) {
        alert("비밀번호를 8~18자 사이로 입력해주세요.")
        return false;
    }
   if(!document.join.u_repwd.value) {
      alert("비밀번호를 다시 입력해주세요.")
      return false;
   }
   if(document.join.u_pwd.value!=document.join.u_repwd.value) {
      alert("비밀번호가 일치하지 않습니다.")
      return false;
   }
   if(!document.join.u_pwdhint1.value) {
      alert("비밀번호 힌트를 선택해주세요.")
      return false;
   }
   if(!document.join.u_pwdhint2.value) {
      alert("비밀번호 힌트를 입력해주세요.")
      return false;
   }
   if (document.join.u_pwdhint2.value.length<2||document.join.u_pwdhint2.value.length>20) {
        alert("비밀번호 힌트를 2~20자 사이로 입력해주세요.")
        return false;
    }
   if(!document.join.u_name.value) {
      alert("이름을 입력해주세요.")
      return false;
   }
   if (document.join.u_name.value.length<2||document.join.u_name.value.length>10) {
        alert("이름을 2~10자 사이로 입력해주세요.")
        return false;
   }
   if(!document.join.u_email.value) {
      alert("이메일을 입력해주세요.")
      return false;
   }
   if (document.join.u_email.value.length<10||document.join.u_email.value.length>20) {
        alert("이메일을 10~20자 사이로 입력해주세요.")
        return false;
   }
   if(!document.join.u_tel.value) {
      alert("전화번호를 입력해주세요.")
      return false;
   }
   if (document.join.u_tel.value.length<10||document.join.u_tel.value.length>11) {
        alert("전화번호를 10~11자 사이로 입력해주세요.")
        return false;
   }
   if(!document.join.u_addr.value) {
      alert("주소를 입력해주세요.")
      return false;
   }
   if (document.join.u_addr.value.length<10||document.join.u_addr.value.length>20) {
        alert("주소를 10~20자 사이로 입력해주세요.")
        return false;
   }
}
</script>
<body>
<%@include file="../header.jsp" %>
<section>
<form name="join" action="join_ok.jsp" method="post" onsubmit="return check(this);">
<%
String u_id=request.getParameter("u_id");
String u_email=request.getParameter("u_email");
%>
   <br><br><br><br>
   <h2>회원가입</h2>
   <br>
   <div>
   <table id="jointable">
      <tr>
         <th>아이디</th>
         <%
         if(id==null){
         %>
         <td colspan="3"><input type="text" name="u_id" placeholder="중복확인을 눌러주세요" readonly class="join_text" style="width: 73%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;">
         <input type="button" value="중복검사" onclick="idCheck();" class="btn"></td>
         <%
         }else{
         %>
         <td colspan="3"><input  type="text" name="u_id" value="<%=id%>" readonly class="join_text" style="width: 73%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;">
         <input type="button" value="중복검사" onclick="idCheck();" class="btn"></td>
         <%
         }
         %>
      <tr>
      <tr>
         <th>아이디 힌트</th>
         <td>
            <select name="u_idhint1">
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
         <td><input type="text" name="u_idhint2" placeholder="힌트를 입력해주세요" maxlength="20" style="width: 80%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
      </tr>
      <tr>
         <th>비밀번호</th>
         <td colspan="3"><input type="password" name="u_pwd" placeholder="비밀번호를 입력해주세요" maxlength="18" size="18"></td>
      
      </tr>
      <tr>
         <th>비밀번호 확인</th>
         <td colspan="3"><input type="password" name="u_repwd" placeholder="비밀번호를 한번 더 입력해주세요" maxlength="18" size="18"></td>
         
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
         <td><input type="text" name="u_pwdhint2" placeholder="힌트를 입력해주세요" style="width: 80%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
      </tr>
      <tr>
         <th>이름</th>
         <td colspan="3"><input type="text" name="u_name"placeholder="이름을 입력해주세요" maxlength="10" size="10" class="join_text" style="width: 90%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
      </tr>
      <tr>
         <th>이메일</th>
         <%
         if(u_email==null){
         %>
         <td colspan="3"><input type="text" name="u_email" placeholder="중복확인을 눌러주세요" readonly class="join_text" style="width: 73%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;">
         <input type="button" value="중복검사" onclick="emailCheck();" class="btn"></td>
         <%
         }else{
         %>
         <td colspan="3"><input type="text" name="u_email" value="<%=u_email%>" readonly  class="join_text" style="width: 73%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
         <td><input type="button" value="중복검사" onclick="emailCheck();" class="btn"></td>
         <%
         }
         %>
      </tr>
      <tr>
         <th>휴대폰</th>
         <td colspan="3"><input type="text" name="u_tel" placeholder="숫자만 입력해주세요" maxlength="12" size="12" size="20" class="join_text" style="width: 90%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>   
      </tr>
      <tr>
         <th>주소</th>
         <td colspan="3"><input type="text" name="u_addr" placeholder="주소를 입력해주세요" maxlength="20" size="20" class="join_text" style="width: 90%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
         
      </tr>
      <tr>
         <th>성별</th>
         <td >
            <div id="radio_join">
            <input type="radio" name="u_sex" value="남" >남성
            <input type="radio" name="u_sex" value="여">여성
            <input type="radio" name="u_sex" value="없음" checked="checked">선택안함
            </div>
         </td>
      </tr>
      <tr>
         <th>생년월일</th>
         <td colspan="3">
            <input type="date" name="u_birth" required pattern="\d{4}-\d{2}-\d{2}"  style="margin-left: 90px;">
         </td>
         
      </tr>
      <tr>
         <td colspan="3"><input type="submit" value="확인" class="btn" style="margin-left: 230px;"></td>
      </tr>
   </table>
   </div>
</form>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>