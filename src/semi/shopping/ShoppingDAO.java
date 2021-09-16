package semi.shopping;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import semi.product.ProductDTO;
import semi.shopping.ShoppingDTO;

public class ShoppingDAO {
   
   
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;
   
   

   
   public void dbConnect(){
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         
         String url = "jdbc:oracle:thin:@localhost:1521:xe";
          String user = "scott";
          String pwd = "1234";
          conn =DriverManager.getConnection(url,user,pwd);
      } catch (ClassNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
       
       
   }
   
   public int addshoppinglist(int idx,String id,String img,String s_name,int s_count,int s_price,String s_color) {
      try {
         dbConnect();

         String sql="insert into shopping values(shopping_s_idx.nextval,?,?,?,?,?,?,?)";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, idx);
         ps.setString(2, id);
         ps.setString(3, img);
         ps.setString(4, s_name);
         ps.setInt(5, s_count);
         ps.setInt(6,s_price);
         ps.setString(7, s_color);
         
         int count=ps.executeUpdate();
         return count;
      }catch(Exception e){
         e.printStackTrace();
         return -1;
      }finally {
         try {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         }catch(Exception e2) {
            
         }
      }
   }
   
   public ShoppingDTO gettest(int idx1){
      try {
         dbConnect();
         
         String sql = "select * from shopping where s_idx=?";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, idx1);
         rs=ps.executeQuery();
         ShoppingDTO edto=null;
         while(rs.next()) {
            int s_idx=rs.getInt("s_idx");
            int idx = rs.getInt("idx");
            String id = rs.getString("u_id");
            String img = rs.getString("img");
            String s_name = rs.getString("s_name");
            int s_count = rs.getInt("s_count");
            int s_price = rs.getInt("s_price");
            String s_color = rs.getString("s_color");
                  
            edto = new ShoppingDTO(s_idx,idx,id,img,s_name,s_count,s_price,s_color);
         
                  
         }
         return edto;

      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
            return null;
      }finally {
         try {
            if(rs!=null)rs.close();
               if(ps!=null)ps.close();
               if(conn!=null)conn.close();
         } catch (Exception e) {
            
         }
      }


   }
   
   
   public ArrayList<ShoppingDTO> buylist(int cp,int ls,String id1) {
      
      try {
         dbConnect();
         
         int start=(cp-1)*ls+1;
         int end = cp*ls;
         String sql="select * from (select rownum as rnum,a.* from " + 
               "(select * from shopping where u_id='"+id1+"' order by s_idx desc)a)b  " + 
               "where rnum>=? and rnum<=?";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, start);
         ps.setInt(2, end);
         rs=ps.executeQuery();
         ArrayList<ShoppingDTO> arr = new ArrayList<ShoppingDTO>();
         while(rs.next()){
            int s_idx=rs.getInt("s_idx");
            int idx = rs.getInt("idx");
            String id = rs.getString("u_id");
            String img = rs.getString("img");
            String s_name = rs.getString("s_name");
            int s_count = rs.getInt("s_count");
            int s_price = rs.getInt("s_price");
            String s_color = rs.getString("s_color");

            ShoppingDTO dto = new ShoppingDTO(s_idx,idx,id,img,s_name,s_count,s_price,s_color);
            arr.add(dto);
                  
         }
         return arr;
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
         return null;
      }finally {
         try {
            if(rs!=null)rs.close();
            if(ps!=null)ps.close();
            if(conn!=null)conn.close();
         } catch (Exception e2) {
            // TODO: handle exception
         }
      }
      
   }
   
   public int getTotalCnt() {
      try {
         dbConnect();
         
         String sql = "select count(*) from shopping";
         ps=conn.prepareStatement(sql);
         rs=ps.executeQuery();
         rs.next();
         int count = rs.getInt(1);
         return count ==0?1:count;
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
         return 1;
      }finally {
         try {
            if(rs!=null)rs.close();
               if(ps!=null)ps.close();
               if(conn!=null)conn.close();
         } catch (Exception e2) {
            // TODO: handle exception
         }
         
      }
      
   }
   
         public int deletecart(int num) {
            try {
               dbConnect();
               
               String sql="delete from shopping where s_idx=?";
               
               ps = conn.prepareStatement(sql);
               ps.setInt(1, num);
               
               int count = ps.executeUpdate();
               
               return count;
               
            } catch (Exception e) {
               // TODO: handle exception
               e.printStackTrace();
               return -1;
            }finally {
               try {
                  if(ps!=null)ps.close();
                     if(conn!=null)conn.close();
               } catch (Exception e2) {
                  // TODO: handle exception
               }
            }
            
         }
   
   
}