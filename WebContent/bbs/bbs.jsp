<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.bbs.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bdto" class="semi.bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="semi.bbs.BbsDAO"></jsp:useBean>
<%
String u_id=(String)session.getAttribute("u_id");

if(u_id==null){
   %>
   <script>
      window.alert("로그인 후 이용해주세요");
      location.href="/myweb/main.jsp";
   </script>
   <%
   return;
}

%>
<%
int totalCnt=bdao.newProductPage();//db로부터
int listSize=5;
int pageSize=1;

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
   cp_s="1";
}

int cp=Integer.parseInt(cp_s);//사용자의 현재위치

int totalPage=(totalCnt/listSize)+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<style>
#bbs_table {
   
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
#bbs_table a {
	text-decoration: none;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>

<section>
<h3 style="text-align: center;">공지사항</h3>
<table id="bbs_table">
   <tr>
      <th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
   </tr>
   
   <%
   ArrayList<BbsDTO> arr= bdao.bbslist(cp,listSize);
   if(arr.size()==0 || arr==null){
      %>
      <tr>
         <td colspan="5">등록된 게시글이 없습니다.</td>
      </tr>
      <%
   }
   
   for(int i=0; i<arr.size(); i++){
      
   %>
      <tr>
         <td><%=arr.get(i).getIdx() %></td>
         <td><a href="showBbs.jsp?idx=<%=arr.get(i).getIdx()%>&b_readnum=<%=arr.get(i).getB_readnum()%>&u_id=<%=id%>"><%=arr.get(i).getB_subject()%></a></td>
         <td>호스트</td>
         <td><%=arr.get(i).getB_date() %></td>
         <td><%=arr.get(i).getB_readnum()%></td>
      </tr>
             
   <%
   
   }
   %>
   <%
      if(id.equals("host")==false){
           %>
            
         <%
         }
   %>
    <%
      if(id.equals("host")==true){
      %>
      <tr>
    <td colspan="5" align="center"><input type="button" value="글쓰기" onclick="location.href='writeBbs.jsp?u_id=<%=id%>'"></td>
       
      <%
      
      }
      %>
   </tr>
</table>
<table class="paging" align="center">
	<tr>
		<td>
		<%
		if(userGroup!=0){
			%><a href="bbs.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&nvlArr;</a><%
		}
		%>
		<%
			for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
				%>&nbsp;&nbsp;<a href="bbs.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<%
				if(i==totalPage){
					break;
				}
			}
		%>
		<%
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			%><a href="bbs.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&nvrArr;</a><%
		}
		%>
		</td>
	</tr>
</table>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>