<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="semi.product.*" %>
    <%@page import="semi.review.*" %>
    <%@page import="semi.likeitem.*" %>
    
    <jsp:useBean id="pdao" class="semi.product.ProductDAO"></jsp:useBean>
    <jsp:useBean id="rdao" class="semi.review.ReviewDAO"></jsp:useBean>
    <jsp:useBean id="ldto" class="semi.likeitem.LikeitemDTO"></jsp:useBean>
    <jsp:setProperty property="*" name="ldto"/>
    <jsp:useBean id="ldao" class="semi.likeitem.LikeitemDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/maincss.css">
<%
String u_id=(String)session.getAttribute("u_id");
String idx_1 = request.getParameter("idx");
int idx1 = Integer.parseInt(idx_1);
%>
<style>
#bestProductContent2_table{
   width: 500px;
   height: 500px;
   border-spacing: 0px;
   border-collapse: separate;
}
#bestProductContent2_table td{
   text-align: right;
}

#table_title{
   font-size: 30px;
   border-bottom: 1px solid #d2d2d2;
}
.table_sub{
   color:#8c8c8c;
   font-size: 17px;
}
.bestContent{
      width: 1500px;
      margin:0 auto;
      
}
.btn_submit{
 background-image: url('../images/cart2.png');
    background-position:  0px 0px;
    background-repeat: no-repeat;
    width: 60px;
    height: 29px;
    border: 0px;
 cursor:pointer;
 outline: 0;
}
/*하트 찜하기*/
input[id="heartchk"] {
   display:none;
}
input[id="heartchk"] + label em {
   display:inline-block;
   width:25px;
   height:20px;
   margin-right:5px;
   background:url(../image/heart.jpg) 0 0 no-repeat;
   vertical-align:middle;
}
input[id="heartchk"]:checked + label em {
   background-position:-39px 0;
}
/*tapmenu*/
.tab_content{
   margin-top:120px;
   text-align:center;
}
input[type="radio"] {display:none;}
input[type="radio"] + label {
   display:inline-block;
   padding:20px;
   background:#ccc;
   color:#999;
   font-size:14px;
   cursor:pointer;
}
input[type="radio"]:checked + label {
   background:#aaa;
   color:#000;
}
.conbox {
   widht:300px;
   margin:0 auto;
   display:none;
}
input[id="tab01"]:checked ~ .con1 {display:block;}
input[id="tab02"]:checked ~ .con2 {display:block;}

#review_tb{
   
   width:1100px;
   margin:0px auto;   

}

#review_tb th{
   background-color: #eeeeee;
   border-top: 3px solid #aaaaaa;
}

#review_tb td{
   

}

.review_title{
   border:3px solid #aaaaaa;
   background-color: #dcdcdc;
}
/*img tapmenu*/
.tapimg_content {
   float:left;
   widht:300px;
   height:400px;
   margin:50px;
   margin-left:257px;
}
input[type="radio"] {
   display:none;
}
.tapimgbox {
   width:400px;
   height:450px;
   display:none;
}
.imgboxbtn {
   padding:10px;
   margin-left:60px;
}
label[for*="tapimg"] {
   display:inline-block;
   padding:10px;
   cursor:pointer;
   margin:5px;
   -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
input[id="tapimg01"]:checked ~ .tapbox1 {
   display:block;
}
input[id="tapimg02"]:checked ~ .tapbox2 {
   display:block;
}
input[id="tapimg03"]:checked ~ .tapbox3 {
   display:block;
}
input[id="tapimg01"]:checked ~ .imgboxbtn > label[for="tapimg01"] {
   -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
}
input[id="tapimg02"]:checked ~ .imgboxbtn > label[for="tapimg02"] {
   -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
}
input[id="tapimg03"]:checked ~ .imgboxbtn > label[for="tapimg03"] {
   -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
}
/*버튼 css*/
 .btn{
    background-color:#dcdcdc;
        color:white;
        width: 100px;
        height: 45px;
        font-size: 15px;
        font-weight: 700;
        border-radius: 6px;
        border: 0;
        outline: 0;
        font-size:12px;

}
#bbbb{
	text-decoration: none;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<section>
<%
ArrayList<ProductDTO> arr=pdao.getproduct(idx1);
if(arr==null||arr.size()==0){
   
}else{
   for(int i=0;i<arr.size();i++){
      ProductDTO dto = arr.get(i);
      %>
<script>
   function info_chk() {
      return true;
      
      }
      
      
      function info_chk2(frm) {
    	  
    	  form = document.user_form;
    	  var count = form.count.value;
    	
          if (confirm("장바구니에 담았습니다. 이동하시겠습니까?")) {
                // 확인 버튼 클릭 시 동작
             frm.action="/myweb/cart/cart_ok.jsp?count="+count+"&idx=<%=idx1 %>&img=<%=dto.getImg1() %>&s_name=<%=dto.getP_name() %>&s_price=<%=dto.getP_price() %>";
                
             frm.submit();
             
            } else {
                // 취소 버튼 클릭 시 동작
                alert("동작을 취소했습니다.");
                frm.action="/myweb/newProduct/itemList.jsp?idx=<%=idx1 %>&img=<%=dto.getImg1() %>&s_name=<%=dto.getP_name() %>&s_price=<%=dto.getP_price() %>";
            }
       
       
       return true;
      }
      function heartclick(heart){
			<%int chk=0; %>
			if(heart.checked==true) {
				<%chk=1;%>
				location.href='../likeitem/like_ok.jsp?idx=<%=idx1%>&l_img=<%=dto.getImg1()%>&l_price=<%=dto.getP_price()%>&l_name=<%=dto.getP_name()%>&chk=<%=chk%>';
			}else{
				location.href='../likeitem/likedel.jsp?idx=<%=idx1%>';
			}
		}
   </script>
<div class="bestContent">
<div class="tapimg_content">
   <input type="radio" name="tabimg" id="tapimg01" checked>
   <input type="radio" name="tabimg" id="tapimg02">
   <input type="radio" name="tabimg" id="tapimg03">
   
   <div class="tapimgbox tapbox1"><img src="../image/<%=dto.getImg1() %>" width=400px; height=450px;></div>
   <div class="tapimgbox tapbox2"><img src="../image/<%=dto.getImg2() %>" width=400px; height=450px;></div>
   <div class="tapimgbox tapbox3"><img src="../image/<%=dto.getImg3() %>" width=400px; height=450px;></div>
   
   <div class="imgboxbtn">
      <label for="tapimg01"><img src="../image/<%=dto.getImg1() %>" width=50px; height=60px;></label>
      <label for="tapimg02"><img src="../image/<%=dto.getImg2() %>" width=50px; height=60px;></label>
      <label for="tapimg03"><img src="../image/<%=dto.getImg3() %>" width=50px; height=60px;></label>
   </div>
</div>
<div style="float:left width:500px; height:500px;">
<form name="user_form" method=post action="/myweb/newProduct/buyProduct.jsp?idx=<%=idx1 %>&img=<%=dto.getImg1() %>&s_name=<%=dto.getP_name() %>&s_price=<%=dto.getP_price() %>
                                " onsubmit='return info_chk()'>
<table id="bestProductContent2_table">
<%
	if(u_id==null){
		%>
		<tr>
      <th id="table_title" colspan="2"><%=dto.getP_name() %>
      </th>
   </tr>
   <tr>
      <th class="table_sub">가격</th>
      <td><b><%=dto.getP_price()%>원</b></td>
   </tr>
   <tr>
      <th class="table_sub">컬러</th>
      <td>
      
      <select name="selectBox" id="selectBox" style="border-radius: 5px; width:200px; height: 35px; border: 1px solid #999;">
         <option value="pink">pink</option>
         <option value="black">black</option>
         <option value="white">white</option>
      </select>
      
      </td>
   </tr>
   
   
   <tr>
      <th class="table_sub">수량</th>
      <td><input type="number" name="count"  value="1" min="1" style=" width:198px; height: 35px; border-radius: 5px; border: 1px solid #999;"></td>
   </tr>
   <tr>
		<%
	}else{
		%>
		<tr>
      <th id="table_title" colspan="3"><%=dto.getP_name() %>
      </th>
   </tr>
   <tr>
      <th class="table_sub">가격</th>
      <td colspan="2"><b><%=dto.getP_price()%>원</b></td>
   </tr>
   <tr>
      <th class="table_sub">컬러</th>
      <td  colspan="2">
      
      <select name="selectBox" id="selectBox" style="border-radius: 5px; width:200px; height: 35px; border: 1px solid #999;">
         <option value="pink">pink</option>
         <option value="black">black</option>
         <option value="white">white</option>
      </select>
      
      </td>
   </tr>
   
   
   <tr>
      <th class="table_sub">수량</th>
      <td  colspan="2"><input type="number" name="count"  value="1" min="1" style=" width:198px; height: 35px; border-radius: 5px; border: 1px solid #999;"></td>
   </tr>
   <tr>
		<%
	}
%>
   
        <%
		if(u_id==null){
			%>
			<td><input type="button" value="카트" class="btn"  onclick="return info_chk2(this.form)"></td>
         	<td><input type="submit" value="구매" class="btn"></td>
		      <%
		}else{
				ArrayList<LikeitemDTO> arr2=ldao.likethis(u_id, idx1);
			if(arr2==null||arr2.size()==0){
				%>
				<td>
			   	  <input type="checkbox" id="heartchk" name="heart" onclick="heartclick(this)">
			   	  <label for="heartchk"><em></em>찜하기</label>
			   	  </td>
			      <td><input type="button" value="카트" class="btn"  onclick="return info_chk2(this.form)"></td>
       			  <td><input type="submit" value="구매" class="btn" ></td>
				<%
			}else{
				%>
				<td>
			   	  <input type="checkbox" id="heartchk" name="heart" onclick="heartclick(this)" checked>
			   	  <label for="heartchk"><em></em>찜하기</label>
			   	  </td>
			      <td><input type="button" value="카트" class="btn"  onclick="return info_chk2(this.form)"></td>
         			<td><input type="submit" value="구매" class="btn" ></td>
				<%
			}
			}%>
   </tr>
</table>
</form>
</div>
</div>
<%
   }
} 
ArrayList<ReviewDTO>r_arr= rdao.reviewList(idx1);
%>
<div class="tab_content">
   <input type="radio" name="tapmenu" id="tab01" checked>
   <label for="tab01">상세정보</label>
   <input type="radio" name="tapmenu" id="tab02">
   <label for="tab02">review</label>
   
   <div class="conbox con1">
   <%
   for(int i=0;i<arr.size();i++){
      ProductDTO dto = arr.get(i);
      %>
      <img src="../image/<%=dto.getImg4() %>" width="1200">
      <%
   }
   %>
   </div>
   
   <div class="conbox con2">
   
   <table id="review_tb">
      <tr>
         <th colspan="6">리뷰</th>
      </tr>
      <tr>
      <td class="review_title">번호</td><td class="review_title">아이디</td><td class="review_title">제목</td><td class="review_title">내용</td><td class="review_title">별점</td><td class="review_title">작성일</td>
      </tr>
      
      <%
         String star=null;
         for(int i=0; i<r_arr.size();i++){
            
            if(r_arr.get(i).getR_star()==1){
               star="★☆☆☆☆";
            }else if(r_arr.get(i).getR_star()==2){
               star="★★☆☆☆";
            }else if(r_arr.get(i).getR_star()==3){
               star="★★★☆";
            }else if(r_arr.get(i).getR_star()==4){
               star="★★★★☆";
            }else{
               star="★★★★★";
            }
            %>
            <tr>
            <td><%=r_arr.get(i).getR_num()%></td><td><%=r_arr.get(i).getU_id()%></td>
            <td>
            <%
               for(int z=0;z<r_arr.get(i).getR_lev();z++){
                  out.println("&nbsp;&nbsp;");
               }
               %>
            <a id="bbbb" href="reviewContent.jsp?r_num=<%=r_arr.get(i).getR_num()%>&u_id=<%=u_id%>"><%=r_arr.get(i).getR_subject() %></a></td><td><%=r_arr.get(i).getR_content()%></td><td><%=star%></td><td><%=r_arr.get(i).getR_date()%></td>
            </tr>
            <%
            
         }
         
      
      %>
      <tr>
         <td><input type="button" value="리뷰작성" onclick='reviewpopUp();'></td>
      </tr>
           <tr>
         <%
            String idx_s= request.getParameter("idx");
            int idx=Integer.parseInt(idx_s);
            int r_star=rdao.reviewAvg(idx);
            String star1=null;
            
            if(r_star==0){
                star1="리뷰가 작성되지 않았습니다.";
            }else if(r_star==1){
                star1="★☆☆☆☆";
            }else if(r_star==2){
                star1="★★☆☆☆";
            }else if(r_star==3){
                star1="★★★☆☆";
            }else if(r_star==4){
                star1="★★★★☆";
            }else{
                star1="★★★★★";
            }
         %>
         <td colspan="6">
            별점:<%=star1%>
         </td>
         
      </tr>
      
   </table>
   </div>
</div>




<a href="#" class="scrollToTop"><img src="/myweb/image/upbutton2.png" width="90" height="60"></a>


<script>
   function reviewpopUp(){
      
      window.open('reviewpopUp.jsp?idx=<%=idx1%>&u_id=<%=u_id%>','reviewpopUp','width=480px , height=450px');
   }
</script>




</section>
<%@include file="../footer.jsp" %>
</body>
</html>