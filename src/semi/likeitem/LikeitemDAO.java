package semi.likeitem;

	import java.sql.*;
	import java.util.*;

public class LikeitemDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public LikeitemDAO() {
		// TODO Auto-generated constructor stub
	}
	/*db연동*/
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
	/*즐겨찾기 추가*/
	public int likeitem(int idx,String l_id,String l_img,int l_price,String l_name) {
		  try {
			  dbConnect();
			  String sql="insert into likeitem values(?,?,?,?,?)";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, idx);
			  ps.setString(2, l_id);
			  ps.setString(3, l_img);
			  ps.setInt(4, l_price);
			  ps.setString(5, l_name);
			  int count=ps.executeUpdate();
			  return count;
		  }catch(Exception e) {
			  e.printStackTrace();
			  return -1;
		  }finally {
			  try {
				  if(ps!=null)ps.close();
				  if(conn!=null)conn.close();
			  }catch(Exception e2) {}
		  }
		  
	  }
	/*즐겨찾기 삭제*/
	public int likeitemDel(int idx,String u_id) {
		  try {
			  dbConnect();
			  String sql="delete from likeitem where idx=? and l_id=?";
			  ps=conn.prepareStatement(sql);
			  ps.setInt(1, idx);
			  ps.setString(2, u_id);
			  int count=ps.executeUpdate();
			  return count;
		  }catch(Exception e) {
			  e.printStackTrace();
			  return -1;
		  }finally {
			  try {
				  if(ps!=null)ps.close();
				  if(conn!=null)conn.close();
			  }catch(Exception e2) {}
		  }
		  
	  }
	/*즐겨찾기 출력*/
	public ArrayList<LikeitemDTO> likelist(int cp,int listSize,String l_id) {
		
		try {
			dbConnect();
			int start=(cp-1)*listSize+1;
			int end = cp*listSize;
			String sql="select * from (select rownum as rnum,a.* from (select * from likeitem where l_id=?)a)b where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, l_id);
			ps.setInt(2, start);
			ps.setInt(3, end);
			
			rs=ps.executeQuery();
			ArrayList<LikeitemDTO> arr = new ArrayList<LikeitemDTO>();
			while(rs.next()){
				int idx = rs.getInt("idx");
				String l_img = rs.getString("l_img");
				int l_price = rs.getInt("l_price");
				String l_name = rs.getString("l_name");
				LikeitemDTO dto = new LikeitemDTO(idx, l_id, l_img, l_price, l_name);
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
	/*하트 기억*/
	public ArrayList<LikeitemDTO> likethis(String u_id,int idx1) {
		
		try {
			dbConnect();
			String sql="select * from likeitem where l_id=? and idx=?";
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, u_id);
			ps.setInt(2, idx1);
			
			rs=ps.executeQuery();
			ArrayList<LikeitemDTO> arr = new ArrayList<LikeitemDTO>();
			while(rs.next()){
				int idx=idx1;
				String l_id=u_id;
				String l_img = rs.getString("l_img");
				int l_price = rs.getInt("l_price");
				String l_name = rs.getString("l_name");
				LikeitemDTO dto = new LikeitemDTO(idx, l_id, l_img, l_price, l_name);
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
	/*페이징*/
	public int getTotalCnt() {
		try {
			dbConnect();
			
			String sql = "select count(*) from likeitem";
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
	
	
	
	
}
