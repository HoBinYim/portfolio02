<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가구공장</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<script>
function send(){
    var s=document.idFind.u_name.value;
    var e=document.idFind.u_email.value;
    if(!document.idFind.u_name.value) {
      alert("이름을 입력해주세요.")
      return false;
   }
    if(document.idFind.u_name.value.length<2||document.idFind.u_name.value.length>10) {
       alert("이름을 2~10자 사이로 입력해주세요.")
      return false
   }
    if(!document.idFind.u_email.value) {
      alert("이메일을 입력해주세요.")
      return false;
   }
    if(document.idFind.u_email.value.length<10||document.idFind.u_email.value.length>20) {
       alert("이메일을 10~20자 사이로 입력해주세요.")
      return false
   }
    window.open('idFindPopup.jsp?s='+s+'&e='+e,'idFindPopup','width=400, height=250, left=100, top=50');
}
function idFind1() {
      if(!document.idFind.u_name.value) {
         alert("이름을 입력해주세요.")
         return false;
      }
       if(!document.idFind.u_email.value) {
         alert("이메일을 입력해주세요.")
         return false;
      }
       if(!document.idFind.u_idhint2.value) {
         alert("힌트를 입력해주세요.")
         return false;
      }
   }
</script>   
</head>
<style>
#idFindtable {
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

.btn2:hover{
   background-color:#8c8c8c;
}
</style>
<body>
<%@include file="../header.jsp" %>
<section>
<%
String u_idhint2=request.getParameter("u_idhint2");
String s=request.getParameter("s");
String e=request.getParameter("e");
%>
<form name="idFind" action="idFind_ok.jsp?s=<%=s%>&e=<%=e%>" method="post" onsubmit="return idFind1(this);">
   <h2>아이디 찾기</h2>
   <br>
   <table id="idFindtable">
      <tr>
         <th>이름</th>
      <%
      if(s==null){
      %>
      <td colspan="2"><input id="idFindtext" name="u_name" type="text" placeholder="고객님의 이름을 입력해주세요" style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;" maxlength="10"></td>
      <%
      }else{
      %>
      <td colspan="2"><input id="idFindtext" name="u_name" type="text" value="<%=s%>" style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
      <%
      }
      %>
      <tr>
         <th>이메일</th>
         <%
         if(e==null){
         %>
         <td colspan="2"><input id="idFindtext" name="u_email" type="text" placeholder="가입 시 등록하신 이메일을 입력해주세요" style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;" maxlength="20"></td>
         <%
         }else{
         %>
         <td colspan="2"><input id="idFindtext" name="u_email" type="text" value="<%=e%>" style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
         <%
         }
         %>
      </tr>
      <tr>
         <th>힌트</th>
         <%
         if(u_idhint2==null){
         %>
         <td colspan="2"><input id="idFindtext" name="u_idhint2" type="text" placeholder="아이디 힌트 버튼을 눌러주세요" readonly style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
         <%
         }else{
         %>
         <td><input id="idFindtext" name="u_idhint2" type="text" value=<%=u_idhint2%> readonly style="width: 100%; height: 35px; border-radius: 6px; border: 1px solid #dcdcdc; outline: 0;"></td>
         <%
         }
         %>
         <td><input type="button" name="" value="힌트" onclick="send();" style="margin-left: 10px;" class="btn"></td>
      </tr>
      <tr>
         <td colspan="2"><input type="submit" value="아이디 확인" class="btn2"></td>
      </tr>
   </table>
</form>

</section>
<%@include file="../footer.jsp" %>
</body>
</html>