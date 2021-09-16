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
#idfindtable {
   margin:0px auto;
   border-spacing:5px;
}
#idfindtable th {
   text-align:left;
   font-size:13px;
}
#idfindtext {
   width:300px;
   height:40px;
}

#idfindbutton {
   text-align:center;
   pading:50px 20px;
   font-size:10px;
}
</style>
<body>
<%@include file="header.jsp" %>
<section>
<form name="idfind">
   <br><br><br><br>
   <h2>아이디 찾기</h2>
   <br>
   <table id="idfindtable">
      <tr>
         <th>이름</th>
      </tr>
      <tr>
         <td><input id="idfindtext" type="text" placeholder="고객님의 이름을 입력해주세요"></td>
      <tr>
      <tr></tr>
      <tr>
         <th>이메일</th>
      </tr>
      <tr>
         <td><input id="idfindtext" type="text" placeholder="가입 시 등록하신 이메일을 입력해주세요"></td>   
      </tr>
      <tr></tr>
      <tr>
         <th>힌트</th>
      </tr>
      <tr>
         <td><input id="idfindtext" type="text" placeholder="고객님이 설정한 힌트를 입력해주세요"></td>
      </tr>
   </table>
      <br>
      <div id="idfindbutton">
      <input type="button" value="확인">
      </div>
      <br>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>