<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<style>
</style>
</head>
<body>
<%@include file="header.jsp" %>
<section>
<div class="sliding">
   <input type="radio" name="slide" id="slide01" checked>
   <input type="radio" name="slide" id="slide02">
   <input type="radio" name="slide" id="slide03">
   
   <div class="slidewrap">
      <ul class="slidelist">
         <li>
            <a>
               <label for="slide03" class="left"></label>
               <img src="image/mainslide1.jpg" height="600">
               <label for="slide02" class="right"></label>
            </a>
            </li>
            <li>
            <a>
               <label for="slide01" class="left"></label>
               <img src="image/mainslide2.jpg" height="600">
               <label for="slide03" class="right"></label>
            </a>
            </li>
            <li>
            <a>
               <label for="slide02" class="left"></label>
               <img src="image/mainslide3.jpg" height="600">
               <label for="slide01" class="right"></label>
            </a>
         </li>
      </ul>
   </div>
</div>
<h1>이 달의 상품</h1>
<form name=imgtable>
<table class="imgtable">
<tr>
<td>
<div class="bestProductPage_img1">
<a href="/myweb/newProduct/itemList.jsp?idx=138"><img class="main_imglist" src="image/bed5_1.JPG"width="400" height="300"></a>
</div>
</td>
<td>
<div class="bestProductPage_img1">
<a href="/myweb/newProduct/itemList.jsp?idx=108"><img class="main_imglist" src="image/bookcase13_2.jpg"width="400" height="300"></a>
</div>
</td>
<td>
<div class="bestProductPage_img1">
<a href="/myweb/newProduct/itemList.jsp?idx=51"><img class="main_imglist" src="image/cabinet13_2.jpg"width="400" height="300"></a>
</div>
</td>
</tr>
<tr>
<td><del>
850,000원
</del><br><br>
650,000원
</td>
<td><del>
550,000원
</del><br><br>
450,000원
</td>
<td><del>
950,000원
</del><br><br>
750,000원
</td>
</tr>
</table>
</form>
<hr>
<h1>할인중인 상품</h1>
<form name=imgtable>
<table class="imgtable">
<tr>
<td>
<div class="bestProductPage_img1">
<a href="/myweb/newProduct/itemList.jsp?idx=1"><img class="main_imglist" src="image/hang1_3.jpg"width="400" height="300"></a>
</div>
</td>
<td>
<div class="bestProductPage_img1">
<a href="/myweb/newProduct/itemList.jsp?idx=25"><img class="main_imglist" src="image/drawer6_3.jpg"width="400" height="300"></a>
</div>
</td>
<td>
<div class="bestProductPage_img1">
<a href="/myweb/newProduct/itemList.jsp?idx=81"><img class="main_imglist" src="image/chair5_3.jpg"width="400" height="300"></a>
</div>
</td>
</tr>
<tr>
<td><del>
850,000원
</del><br><br>
650,000원
</td>
<td><del>
550,000원
</del><br><br>
450,000원
</td>
<td><del>
950,000원
</del><br><br>
750,000원
</td>
</tr>
</table>
</form>


</section>
<%@include file="footer.jsp" %>
</body>
</html>