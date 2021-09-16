package semi.buylist;


import java.sql.*;
import java.util.ArrayList;

import semi.product.ProductDTO;



public class BuylistDAO {
	
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
	
public BuylistDAO() {
	// TODO Auto-generated constructor stub
}

public int buylist(int idx,String u_id,String img,String b_name,int b_count,int b_price, String b_color){
	try {
		dbConnect();

		String sql="insert into buylist values (?,?,?,?,?,?,?,sysdate)";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, idx);
		ps.setString(2, u_id);
		ps.setString(3, img);
		ps.setString(4, b_name);
		ps.setInt(5, b_count);
		ps.setInt(6, b_price);
		ps.setString(7, b_color);

		int count=ps.executeUpdate();
		return count;
	}catch(Exception e){
		e.printStackTrace();
		return -1;
	}finally {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception e2) {}
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



public ArrayList<BuylistDTO> mybuylist(int cp,int ls,String id){
	 
	 try {
	    dbConnect();
	    int start=(cp-1)*ls+1;
	    int end = cp*ls;
	    String sql="select * from (select rownum as rnum,a.* from(select * from buylist where u_id = '"+id+"')a)b where rnum>=? and rnum<=?";
	    
	    ps=conn.prepareStatement(sql);
	    ps.setInt(1, start);
	    ps.setInt(2, end);
	    ArrayList<BuylistDTO> arr = new ArrayList<BuylistDTO>();
	    rs=ps.executeQuery();
	    while(rs.next()){
	       int idx = rs.getInt("idx");
	       String u_id = rs.getString("u_id");
	       String img = rs.getString("img");
	       String b_name = rs.getString("b_name");
	       int b_count = rs.getInt("b_count");
	       int b_price = rs.getInt("b_price");
	       String b_color = rs.getString("b_color");
	       java.sql.Date b_date = rs.getDate("b_date");
	       
	       
	             
	       BuylistDTO edto = new BuylistDTO(idx,u_id,img,b_name,b_count,b_price,b_color,b_date);
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





}
