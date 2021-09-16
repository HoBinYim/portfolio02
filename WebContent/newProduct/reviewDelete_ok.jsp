<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO" scope="session"></jsp:useBean>
<%
String u_id=request.getParameter("u_id");
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
String r_num_s=request.getParameter("r_num");
int r_num=Integer.parseInt(r_num_s);
int result=rdao.reviewDelete(u_id, idx, r_num);
String msg=result>0?"리뷰가 삭제되었습니다.":"리뷰를 삭제할 수 없습니다.";
%>
<script>
	window.alert('<%=msg%>');
	location.href='/myweb/newProduct/itemList.jsp?idx=<%=idx%>'
</script>