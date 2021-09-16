<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO" scope="session"></jsp:useBean>
<%
String u_id=(String)session.getAttribute("u_id");
String r_subject=request.getParameter("r_subject");
String r_content=request.getParameter("r_content");
String r_star_s=request.getParameter("r_star");
int r_star=Integer.parseInt(r_star_s);
String r_num_s=request.getParameter("r_num");
int r_num=Integer.parseInt(r_num_s);
int result=rdao.reviewModify(u_id, r_subject, r_content, r_star, r_num);
String msg=result>0?"리뷰가 수정되었습니다":"리뷰를 수정할 수 없습니다.";
%>
<script>
	window.alert('<%=msg%>');
	history.go(-3);//첫번째 방법
</script>