<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("u_id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
<input type="checkbox" id="menuicon">
<label for="menuicon"><!-- for를 이용해 라벨을 눌러도 input 체크 -->
   <span></span><!-- 줄 3개 -->
   <span></span>
   <span></span>
</label>
<div class="sidebar" align="center">
   <ul>
      <li><a href="/myweb/newProduct/sidePage.jsp?ta=서랍&co=p_price desc">서랍</a></li>
      <li><a href="/myweb/newProduct/sidePage.jsp?ta=수납장&co=p_price desc">수납장</a></li>
      <li><a href="/myweb/newProduct/sidePage.jsp?ta=행거&co=p_price desc">행거</a></li>
      <li><a href="/myweb/newProduct/sidePage.jsp?ta=소파&co=p_price desc">소파</a></li>
      <li><a href="/myweb/newProduct/sidePage.jsp?ta=침대&co=p_price desc">침대</a></li>
      <li><a href="/myweb/newProduct/sidePage.jsp?ta=옷장&co=p_price desc">옷장</a></li>
      <li><a href="/myweb/newProduct/sidePage.jsp?ta=욕실&co=p_price desc">욕실</a></li>
      <li><a href="/myweb/newProduct/sidePage.jsp?ta=책상&co=p_price desc">책상</a></li>
      <li><a href="/myweb/newProduct/sidePage.jsp?ta=선반&co=p_price desc">선반</a></li>
      <li><a href="/myweb/newProduct/sidePage.jsp?ta=식탁&co=p_price desc">식탁</a></li>
      <li><a href="/myweb/newProduct/sidePage.jsp?ta=의자&co=p_price desc">의자</a></li>
      <li><a href="/myweb/newProduct/sidePage.jsp?ta=책장&co=p_price desc">책장</a></li>
   </ul>
</div>
<label for="menuicon" class="sidebackground"></label>
<%
String u_name=(String)session.getAttribute("u_name");
%>
<div class="mainlogin"><a class="mainlogin">
<%
if(u_name==null) {
   %>
      <input type="button" value="로그인" onclick="location.href='/myweb/login/login.jsp'" style="border:none; border-radius:5px; background-color: #FAC87D;"> | </a>
      <a class="mainlogin"><input type="button" value="회원가입" onclick="location.href='/myweb/join/join.jsp'" style="border:none; border-radius:5px; background-color: #FAC87D;"></a>
   <%
}else {
   %>
      <input type="button" value="<%=u_name%>님 " onclick="location.href='/myweb/myPage/myPage.jsp'" style="border:none; border-radius:5px; background-color: #FAC87D;"> | </a>
      <a class="mainlogin"><input type="button" value="로그아웃" onclick="location.href='/myweb/login/logout.jsp'" style="border:none; border-radius:5px; background-color: #FAC87D;"></a>   
   <%
}
%>
</div>
 <div>
 	<a href="/myweb/main.jsp"><img class="mainlogo" src="/myweb/image/mainjun.png"></a>
 </div>
</header>

 <nav class="menubarfix">

   
      <ul>
      
         <li><a href="/myweb/bestProduct/bestProduct.jsp?co=p_recommend desc">베스트</a></li>
         <li><a href="/myweb/newProduct/newProduct.jsp?co=p_record desc">신상품</a></li>
         <li><a href="/myweb/likeitem/likeItem.jsp">즐겨찾기</a></li>
         <li><a href="/myweb/bbs/bbs.jsp?u_id=<%=id%>">게시판</a></li>
         <li><input type="text"  name="search"></li>
         <li><input type="button" value="검색" onclick='search();' style="margin-left:-220px;" ></li>
         <li><a href="/myweb/cart/cart.jsp"><img alt="cart" src="/myweb/image/cart2.jpg" style="width:60px; height:60px; margin-bottom:-20px;"></a></li>
         <li><a href="/myweb/myPage/myPage.jsp"><img alt="mypage" src="/myweb/image/mypage.png" style="width:35px; height:35px; margin-bottom:-10px;"></a></li>
          
      </ul>
    
   </nav>
   <script>
function search(){
	var search = document.all.search.value;
	location.href="/myweb/search/search.jsp?search="+search+"";
	
}

</script>
   

</body>
</html>