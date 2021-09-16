<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="semi.bbs.BbsDAO"></jsp:useBean>

<%
String u_id=(String)session.getAttribute("u_id");
if(u_id==null || !u_id.equals("host")){
	%>
		<script>
		window.alert("호스트만 게시글을 지울 수 있습니다.");
		location.href='/myweb/bbs/bbs.jsp';
		</script>
	<%
	return;
}
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
int result=bdao.bbsDelete(idx);


String msg=result>0?"게시글이 삭제되었습니다.":"게시글을 삭제할 수 없습니다.";
%>
<script>
window.alert('<%=msg%>');
location.href='/myweb/bbs/bbs.jsp';
</script>