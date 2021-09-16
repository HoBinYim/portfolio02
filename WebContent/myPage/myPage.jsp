<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="semi.buylist.*" %>
<jsp:useBean id="buydao" class="semi.buylist.BuylistDAO"></jsp:useBean>
<%
String u_id=(String)session.getAttribute("u_id");
if(u_id==null){
	%>
	<script>
	window.alert('로그인 후 이용가능한 서비스입니다.');
	location.href='/myweb/login/login.jsp';
	</script>
	<%
	return;
}
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
            width: 70px;
            height: 45px;
            font-size: 15px;
            font-weight: 700;
            border-radius: 6px;
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
.btn{
	margin-top: 20px;
}
#bbs_table{
   width: 1300px;
   margin: 0px auto;
   border: 1px solid #dddddd;
}
#bbs_table th{
   background-color: #eeeeee;
   text-align: center;
}
#bbs_table td{
   text-align: center;
}
</style>
<script>
function check() {
	if(!document.changeInfo.u_pwd.value) {
		alert("비밀번호를 입력해주세요.")
		return false;
	}
	if(document.changeInfo.u_pwd.value.length<8||document.changInfo.u_pwd.value.length>18) {
	    alert("비밀번호를 8~18자 사이로 입력해주세요.")
	    return false;
	}
}
</script>
</head>
<%
int totalCnt= buydao.getTotalCnt();//db로부터 가져와야할데이터
int listSize=3;//페이지에 보여줄 리스트 수
int pageSize=5;//보여줄 페이지슈

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s==""){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);//사용자의 현재위치


//총페이지구하기
int totalPage=(totalCnt/listSize)+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;

if(cp%pageSize==0)userGroup--;
%>
<body>
<%@include file="../header.jsp" %>
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
<section>
<article>
<form name ="buylist" action="/myweb/newProduct/buyProduct.jsp?&section=2" onsubmit='return info_chk()'>
<h1>구매목록</h1>

<table id="bbs_table">
<thead>
<tr>

<th>제품</th>
<th>상품명</th>
<th>색상</th>
<th>수량</th>
<th>금액</th>
<th>구매 날짜</th>
</tr>
</thead>
<tbody>
<%
ArrayList<BuylistDTO> arr=buydao.mybuylist(cp,listSize,u_id);

		for(int i=0;i<arr.size();i++){
			%>
			<tr>
					<% 
					int sum =  (arr.get(i).getB_count() * arr.get(i).getB_price());
					%>
				
				<td>
					<img src="../image/<%=arr.get(i).getImg()%>" width="300" height="300">
				</td>
				<td>
					<%=arr.get(i).getB_name() %>
				</td>
				<td>
					<%=arr.get(i).getB_color() %>
				</td>
				<td>
					<%=arr.get(i).getB_count() %>개
				</td>
				<td>
					<%=sum %>원
				</td>
				<td>
					<%=arr.get(i).getB_date() %>
				</td>
			</tr>
			<%
			
		}
	
	%>

</tbody>
</table>

</form>
<div class="paging" align="center">
<%
if(userGroup!=0){
	%><a href="/myweb/myPage/myPage.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;&lt;</a><%	
}
%>
<%
		for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
			%>&nbsp;&nbsp;<a href="/myweb/myPage/myPage.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
			if(i==totalPage){
				break;
			}
			
		}
%>
<%
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%><a href="/myweb/myPage/myPage.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%	
}
%>
</div>
</article>
</section>
</div>
</div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>