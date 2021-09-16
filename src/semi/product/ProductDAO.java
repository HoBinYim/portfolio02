package semi.product;
import java.sql.*;
import java.util.ArrayList;
public class ProductDAO {
   
   
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;
   
   
   public static final String p_recommend = "p_recommend";
   public static final String p_price = "p_price";
   public static final String p_record = "p_record";
   public static final String desc = "desc";
   public static final String asc = "asc";
   
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
   
   
   
public ProductDAO() {
   // TODO Auto-generated constructor stub
}

public ArrayList<ProductDTO> ImageList() {
   
   try {
      dbConnect();
      String sql="select * from product ";
      ps=conn.prepareStatement(sql);
      rs=ps.executeQuery();
      ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
      while(rs.next()){
         int idx = rs.getInt("idx");
         String imgname = rs.getString("imgname");
         String img1 = rs.getString("img1");
         String img2 = rs.getString("img2");
         String img3 = rs.getString("img3");
         String img4 = rs.getString("img4");
         String p_name = rs.getString("p_name");
         String p_type = rs.getString("p_type");
         int p_price = rs.getInt("p_price");
         String imgcontent = rs.getString("imgcontent");
         int p_recommend = rs.getInt("p_recommend");
         java.sql.Date p_record = rs.getDate("p_record");
         
         
               
         ProductDTO edto = new ProductDTO(idx,imgname,img1,img2,img3,img4,p_name,p_type,p_price,imgcontent,p_recommend,p_record);
         arr.add(edto);
               
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
      
      String sql = "select count(*) from product";
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



public ArrayList<ProductDTO> bestList(int cp,int ls) {
   
   try {
      dbConnect();
      //String sql="select * from jsp_bbs";
      int start=(cp-1)*ls+1;
      int end = cp*ls;
      String sql="select * from (select rownum as rnum,a.* from " + 
            "(select * from product order by p_price desc)a)b  " + 
            "where rnum>=? and rnum<=?";
      ps=conn.prepareStatement(sql);
      ps.setInt(1, start);
      ps.setInt(2, end);
      rs=ps.executeQuery();
      ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
      while(rs.next()){
         int idx = rs.getInt("idx");
         String imgname = rs.getString("imgname");
         String img1 = rs.getString("img1");
         String img2 = rs.getString("img2");
         String img3 = rs.getString("img3");
         String img4 = rs.getString("img4");
         String p_name = rs.getString("p_name");
         String p_type = rs.getString("p_type");
         int p_price = rs.getInt("p_price");
         String imgcontent = rs.getString("imgcontent");
         int p_recommend = rs.getInt("p_recommend");
         java.sql.Date p_record = rs.getDate("p_record");
         
         
               
         ProductDTO edto = new ProductDTO(idx,imgname,img1,img2,img3,img4,p_name,p_type,p_price,imgcontent,p_recommend,p_record);
         arr.add(edto);
               
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



//검색후 정렬
public ArrayList<ProductDTO> sortSerch(String word,int cp,int ls ,String co){
 
 try {
    dbConnect();
    int start=(cp-1)*ls+1;
    int end = cp*ls;
    String sql="select * from (select rownum as rnum,a.* from(select * from product where (p_name || p_type || imgcontent) like '%"+word+"%' order by "+co+")a)b where rnum>=? and rnum<=?";
    
    ps=conn.prepareStatement(sql);
    ps.setInt(1, start);
    ps.setInt(2, end);
    ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
    rs=ps.executeQuery();
    while(rs.next()){
       int idx = rs.getInt("idx");
       String imgname = rs.getString("imgname");
       String img1 = rs.getString("img1");
       String img2 = rs.getString("img2");
       String img3 = rs.getString("img3");
       String img4 = rs.getString("img4");
       String p_name = rs.getString("p_name");
       String p_type = rs.getString("p_type");
       int p_price = rs.getInt("p_price");
       String imgcontent = rs.getString("imgcontent");
       int p_recommend = rs.getInt("p_recommend");
       java.sql.Date p_record = rs.getDate("p_record");
       
       
             
       ProductDTO edto = new ProductDTO(idx,imgname,img1,img2,img3,img4,p_name,p_type,p_price,imgcontent,p_recommend,p_record);
       arr.add(edto);
             
    }
    return arr;
 }catch(Exception e) {
    e.printStackTrace();
    return null;
 }finally {
    try {
       if(rs!=null)rs.close();
       if(ps!=null)ps.close();
       if(conn!=null)conn.close();
    }catch(Exception e2) {}
 }
 
}



public ArrayList<ProductDTO> SortProduct(int cp,int ls ,String co) {
   
   try {
      dbConnect();
      
      int start=(cp-1)*ls+1;
      int end = cp*ls;
      String sql="select * from (select rownum as rnum,a.* from " + 
            "(select * from product order by "+co+")a)b  " + 
            "where rnum>=? and rnum<=?";
      ps=conn.prepareStatement(sql);
      
      ps.setInt(1, start);
      ps.setInt(2, end);
      
      rs=ps.executeQuery();
      ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
      while(rs.next()){
         int idx = rs.getInt("idx");
         String imgname = rs.getString("imgname");
         String img1 = rs.getString("img1");
         String img2 = rs.getString("img2");
         String img3 = rs.getString("img3");
         String img4 = rs.getString("img4");
         String p_name = rs.getString("p_name");
         String p_type = rs.getString("p_type");
         int p_price = rs.getInt("p_price");
         String imgcontent = rs.getString("imgcontent");
         int p_recommend = rs.getInt("p_recommend");
         java.sql.Date p_record = rs.getDate("p_record");
         
         
               
         ProductDTO edto = new ProductDTO(idx,imgname,img1,img2,img3,img4,p_name,p_type,p_price,imgcontent,p_recommend,p_record);
         arr.add(edto);
               
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

public ArrayList<ProductDTO> test2(int cp,int ls ,String ta,String co) {
   
   try {
      dbConnect();
      
      int start=(cp-1)*ls+1;
      int end = cp*ls;
      String sql="select * from (select rownum as rnum,a.* from  (select * from (select * from product where p_type='"+ta+"') order by "+co+")a)b where rnum>=? and rnum<=?";
      ps=conn.prepareStatement(sql);
      
      ps.setInt(1, start);
      ps.setInt(2, end);
      
      rs=ps.executeQuery();
      ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
      while(rs.next()){
         int idx = rs.getInt("idx");
         String imgname = rs.getString("imgname");
         String img1 = rs.getString("img1");
         String img2 = rs.getString("img2");
         String img3 = rs.getString("img3");
         String img4 = rs.getString("img4");
         String p_name = rs.getString("p_name");
         String p_type = rs.getString("p_type");
         int p_price = rs.getInt("p_price");
         String imgcontent = rs.getString("imgcontent");
         int p_recommend = rs.getInt("p_recommend");
         java.sql.Date p_record = rs.getDate("p_record");
         
         
               
         ProductDTO edto = new ProductDTO(idx,imgname,img1,img2,img3,img4,p_name,p_type,p_price,imgcontent,p_recommend,p_record);
         arr.add(edto);
               
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

public ArrayList<ProductDTO> getproduct(int idx1){
      try {
         dbConnect();
         
         String sql = "select * from product where idx=?";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, idx1);
         rs=ps.executeQuery();
         ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
         while(rs.next()) {
            int idx = rs.getInt("idx");
            String imgname = rs.getString("imgname");
            String img1 = rs.getString("img1");
            String img2 = rs.getString("img2");
            String img3 = rs.getString("img3");
            String img4 = rs.getString("img4");
            String p_name = rs.getString("p_name");
            String p_type = rs.getString("p_type");
            int p_price = rs.getInt("p_price");
            String imgcontent = rs.getString("imgcontent");
            int p_recommend = rs.getInt("p_recommend");
            java.sql.Date p_record = rs.getDate("p_record");
                  
            ProductDTO edto = new ProductDTO(idx,imgname,img1,img2,img3,img4,p_name,p_type,p_price,imgcontent,p_recommend,p_record);
         arr.add(edto);
                  
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
         } catch (Exception e) {
            
         }
      }
   
   
}

public ProductDTO gettest(int idx1){
   try {
      dbConnect();
      
      String sql = "select * from product where idx=?";
      ps=conn.prepareStatement(sql);
      ps.setInt(1, idx1);
      rs=ps.executeQuery();
      ProductDTO edto=null;
      while(rs.next()) {
         int idx = rs.getInt("idx");
         String imgname = rs.getString("imgname");
         String img1 = rs.getString("img1");
         String img2 = rs.getString("img2");
         String img3 = rs.getString("img3");
         String img4 = rs.getString("img4");
         String p_name = rs.getString("p_name");
         String p_type = rs.getString("p_type");
         int p_price = rs.getInt("p_price");
         String imgcontent = rs.getString("imgcontent");
         int p_recommend = rs.getInt("p_recommend");
         java.sql.Date p_record = rs.getDate("p_record");
               
         edto = new ProductDTO(idx,imgname,img1,img2,img3,img4,p_name,p_type,p_price,imgcontent,p_recommend,p_record);
      
               
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


public ArrayList<ProductDTO> shoppingList(int cp,int ls,String id) {
   
   try {
      dbConnect();
      //String sql="select * from jsp_bbs";
      int start=(cp-1)*ls+1;
      int end = cp*ls;
      String sql="select * from (select rownum as rnum,a.* from " + 
            "(select * from product order by p_recommend desc)a)b  " + 
            "where rnum>=? and rnum<=?";
      ps=conn.prepareStatement(sql);
      ps.setInt(1, start);
      ps.setInt(2, end);
      rs=ps.executeQuery();
      ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
      while(rs.next()){
         int idx = rs.getInt("idx");
         String imgname = rs.getString("imgname");
         String img1 = rs.getString("img1");
         String img2 = rs.getString("img2");
         String img3 = rs.getString("img3");
         String img4 = rs.getString("img4");
         String p_name = rs.getString("p_name");
         String p_type = rs.getString("p_type");
         int p_price = rs.getInt("p_price");
         String imgcontent = rs.getString("imgcontent");
         int p_recommend = rs.getInt("p_recommend");
         java.sql.Date p_record = rs.getDate("p_record");
         
         
               
         ProductDTO edto = new ProductDTO(idx,imgname,img1,img2,img3,img4,p_name,p_type,p_price,imgcontent,p_recommend,p_record);
         arr.add(edto);
               
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




}