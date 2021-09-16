package semi.bbs;

import java.sql.*;
import java.util.*;

public class BbsDAO {
   
   private Connection con;
   private PreparedStatement ps;
   private ResultSet rs;
   
   
   /*db*/
   public void dbCon() {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         String url=("jdbc:oracle:thin:@localhost:1521:xe");
         String user="scott";
         String pwd="1234";
         con=DriverManager.getConnection(url,user,pwd);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   //게시판 글쓰기
     public int bbsWrite(BbsDTO dto,String u_id) {
        
        try {
           dbCon();
           String sql="insert into bbs values(bbs_idx.nextval,?,?,?,?,sysdate,?,?,?)";
           ps=con.prepareStatement(sql);
           ps.setString(1,u_id);
           ps.setString(2, dto.getB_subject());
           ps.setInt(3, dto.getB_readnum());
           ps.setString(4, dto.getB_content());
           ps.setInt(5, dto.getB_ref());
           ps.setInt(6, dto.getB_lev());
           ps.setInt(7, dto.getB_sunbun());
           int count=ps.executeUpdate();
           return count;
        }catch(Exception e) {
           e.printStackTrace();
           return -1;
        }finally {
           try {
              if(ps!=null)ps.close();
              if(con!=null)con.close();
           }catch(Exception e2) {}
        }
        
     }
     
     
     //게시판 목록 보여주기
     public ArrayList<BbsDTO> bbsView(){
        
        try {
           dbCon();
           String sql="select * from bbs";
           ps=con.prepareStatement(sql);
           rs=ps.executeQuery();
           ArrayList<BbsDTO> arr= new ArrayList<BbsDTO>();
           while(rs.next()) {
              int idx=rs.getInt("idx");
              String u_id=rs.getString("u_id");
              String b_subject=rs.getString("b_subject");
              int b_readnum=rs.getInt("b_readnum");
              String b_content=rs.getString("b_content");
              String b_date=rs.getString("b_date");
              int b_ref=rs.getInt("b_ref");
              int b_lev=rs.getInt("b_lev");
              int b_sunbun=rs.getInt("b_sunbun");
              
              BbsDTO dto= new BbsDTO(idx, u_id, b_subject, b_readnum, b_content, b_date, b_ref, b_lev, b_sunbun);
              arr.add(dto);
           }
           return arr;
        }catch(Exception e) {
           e.printStackTrace();
           return null;
        }finally {
           try {
              if(rs!=null)rs.close();
              if(ps!=null)ps.close();
              if(con!=null)con.close();
           }catch(Exception e2) {}
        }
     }
   
   

   public ArrayList<BbsDTO> bbslist(int cp,int listSize){
      try {
         dbCon();
         int start=(cp-1)*listSize+1;
         int end=cp*listSize;
         String sql="select * from (select rownum as rnum,a.* from " + 
               "(select * from bbs order by b_date desc)a)b  " + 
               "where rnum>=? and rnum<=?";
         ps=con.prepareStatement(sql);
         ps.setInt(1, start);
         ps.setInt(2, end);
         rs=ps.executeQuery();
         ArrayList<BbsDTO> arr=new ArrayList<BbsDTO>();
         while(rs.next()){
            int idx=rs.getInt("idx");
            String u_id=rs.getString("u_id");
            String b_subject=rs.getString("b_subject");
            int b_readnum=rs.getInt("b_readnum");
            String b_content=rs.getString("b_content");
            String b_date=rs.getString("b_date");
            int b_ref=rs.getInt("b_ref");
            int b_lev=rs.getInt("b_lev");
            int b_sunbun=rs.getInt("b_sunbun");
              
             BbsDTO dto= new BbsDTO(idx, u_id, b_subject, b_readnum, b_content, b_date, b_ref, b_lev, b_sunbun);
              arr.add(dto);
           }
           return arr;
        }catch(Exception e) {
           e.printStackTrace();
           return null;
        }finally {
           try {
              if(rs!=null)rs.close();
              if(ps!=null)ps.close();
              if(con!=null)con.close();
           }catch(Exception e2) {}
        }
     }
   /*페이징*/
   public int newProductPage() {
      try {
         dbCon();
         String sql="select count(*) from Product";
         ps=con.prepareStatement(sql);
         rs=ps.executeQuery();
         rs.next();
         int count=rs.getInt(1);
         return count==0?1:count;
      }catch(Exception e) {
         e.printStackTrace();
         return 1;
      }finally {
         try {
            if(rs!=null)rs.close();;
            if(ps!=null)ps.close();
            if(con!=null)con.close();
         }catch(Exception e2) {}
      }
   }
   
    //게시판 컨텐츠 자세히보기
     public ArrayList<BbsDTO> bbsShow(int idx){
        
        try {
           dbCon();
           String sql="select * from bbs where idx=?";
           ps=con.prepareStatement(sql);
           ps.setInt(1, idx);
           rs=ps.executeQuery();
           ArrayList<BbsDTO>arr= new ArrayList<BbsDTO>();
           rs.next();
           idx=rs.getInt(1);
           String u_id=rs.getString("u_id");
           String b_subject=rs.getString("b_subject");
           int b_readnum=rs.getInt("b_readnum");
           String b_content=rs.getString("b_content");
           String b_date=rs.getString("b_date");
           int b_ref=rs.getInt("b_ref");
           int b_lev=rs.getInt("b_lev");
           int b_sunbun=rs.getInt("b_sunbun");
           BbsDTO dto= new BbsDTO(idx, u_id, b_subject, b_readnum, b_content, b_date, b_ref, b_lev, b_sunbun);
           arr.add(dto);
           return arr;
          
        }catch(Exception e) {
           e.printStackTrace();
           return null;
        }finally {
           try {
              if(rs!=null)rs.close();
              if(ps!=null)ps.close();
              if(con!=null)con.close();
           }catch(Exception e2) {}
        }
        
        
     }
     
     
     //게시글 삭제하기
     public int bbsDelete(int idx) {
        
        try {
           dbCon();
           String sql="delete from bbs where idx=?";
           ps=con.prepareStatement(sql);
           ps.setInt(1, idx);
           int count=ps.executeUpdate();
           return count;
        }catch(Exception e) {
           e.printStackTrace();
           return -1;
        }finally {
           try {
              if(ps!=null)ps.close();
              if(con!=null)con.close();
           }catch(Exception e2) {}
        }
      
     }
     
     //게시글 수정하기
     public int bbsModify(int idx,String b_subject,String b_content) {
        
        try {
           dbCon();
           String sql="update bbs set b_subject =?, b_content=? where idx=?";
           ps=con.prepareStatement(sql);
           ps.setString(1, b_subject);
           ps.setString(2, b_content);
           ps.setInt(3,idx);
           int count=ps.executeUpdate();
           return count;
           
           
        }catch(Exception e) {
           e.printStackTrace();
           return -1;
        }finally {
           try {
              if(ps!=null)ps.close();
              if(con!=null)con.close();
           }catch(Exception e2) {}
        }
        
     }
     
     //조회수 증가
     public int bbsread(int b_readnum,int idx) {
        
        try {
           dbCon();
           String sql="update bbs set b_readnum= ?+1 where idx=?";
           ps=con.prepareStatement(sql);
           ps.setInt(1,b_readnum);
           ps.setInt(2, idx);
           int count=ps.executeUpdate();
           return count;
        }catch(Exception e) {
           e.printStackTrace();
           return -1;
        }finally {
           try {
              if(ps!=null)ps.close();
              if(con!=null)con.close();
           }catch(Exception e2) {}
        }
        
     }
   
   
   
   
   
   
   
   
   
   
   
   
}