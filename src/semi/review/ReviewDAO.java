package semi.review;

import java.sql.*;
import java.util.ArrayList;

public class ReviewDAO {
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	//db
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
	
	//ref확인 메서드
	public int getMaxRef() {
		try {
			String sql="select max(r_ref) from review";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			int r_ref=0;
			if(rs.next()) {
				r_ref=rs.getInt(1);
			}
			return r_ref;
			
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				
			}catch(Exception e2) {}
		}
	}
	
	
	
	//리뷰쓰기
	public int reviewWrite(ReviewDTO dto) {
		
		try {
			dbCon();
			int r_ref=getMaxRef()+1;
			String sql="insert into review values(r_num_idx.nextval,?,?,?,?,?,sysdate,?,0,0)";
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getU_id());
			ps.setInt(2,dto.getIdx());
			ps.setString(3, dto.getR_subject());
			ps.setString(4, dto.getR_content());
			ps.setInt(5, dto.getR_star());
			ps.setInt(6, r_ref);
			int count=ps.executeUpdate();
			return count;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(rs!=null)rs.close();
			}catch(Exception e2) {}
		}
	}
	
	//순번
	public void sunbunUpdate(int r_ref,int r_sunbun) {
	      try {
	         String sql="update review set r_sunbun=r_sunbun+1 where r_ref=? and r_sunbun>=?";
	         ps=con.prepareStatement(sql);
	         ps.setInt(1, r_ref);
	         ps.setInt(2, r_sunbun);
	         ps.executeUpdate();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(ps!=null)ps.close();
	         }catch(Exception e2) {}
	      }
	   }
	
	//답변글쓰기
	public int reviewRewrite(ReviewDTO dto) {
		try {
			dbCon();
			sunbunUpdate(dto.getR_ref(),dto.getR_sunbun()+1);
			String sql="insert into review values(r_num_idx.nextval,?,?,?,?,0,sysdate,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getU_id());
			ps.setInt(2,dto.getIdx());
			ps.setString(3, dto.getR_subject());
			ps.setString(4, dto.getR_content());
			ps.setInt(5, dto.getR_ref());
			System.out.println("ref:"+dto.getR_ref());
			ps.setInt(6, dto.getR_lev()+1);
			System.out.println("lev:"+dto.getR_lev());
			ps.setInt(7, dto.getR_sunbun()+1);
			System.out.println("sunun:"+dto.getR_sunbun());
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
	

	
	//리뷰목록보기
	public ArrayList<ReviewDTO> reviewList(int idx){
		
		try {
			dbCon();
			String sql="select * from (select * from review where idx=?) order by r_ref desc, r_sunbun asc";
			ps=con.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			ArrayList<ReviewDTO>arr= new ArrayList<ReviewDTO>();
			while(rs.next()) {
				int r_num=rs.getInt(1);
				String u_id=rs.getString(2);
				idx=rs.getInt(3);
				String r_subject=rs.getString(4);
				String r_content=rs.getString(5);
				int r_star=rs.getInt(6);
				Date r_date=rs.getDate(7);
				int r_ref=rs.getInt(8);
				int r_lev=rs.getInt(9);
				int r_sunbun=rs.getInt(10);
				ReviewDTO dto= new ReviewDTO(r_num, u_id, idx, r_subject, r_content, r_star, r_date, r_ref, r_lev, r_sunbun);
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
	
	
	//리뷰컨텐츠 자세히 보기
	public ReviewDTO reviewContent(int r_num){
		
		try {
			dbCon();
			String sql="select * from review where r_num=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, r_num);
			rs=ps.executeQuery();
			rs.next();
			r_num=rs.getInt(1);
			String u_id=rs.getString(2);
			int idx=rs.getInt(3);
			String r_subject=rs.getString(4);
			String r_content=rs.getString(5);
			int r_star=rs.getInt(6);
			Date r_date=rs.getDate(7);
			int r_ref=rs.getInt(8);
			int r_lev=rs.getInt(9);
			int r_sunbun=rs.getInt(10);
			ReviewDTO dto= new ReviewDTO(r_num, u_id, idx, r_subject, r_content, r_star, r_date, r_ref, r_lev, r_sunbun);
			return dto;
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
	
	//리뷰 삭제
	public int reviewDelete(String u_id,int idx,int r_num) {
		
		try {
			dbCon();
			String sql="delete from review where u_id=? and idx=? and r_num=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, u_id);
			ps.setInt(2, idx);
			ps.setInt(3, r_num);
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
	
	//수정권한
	public boolean reviewPermission(String id,int r_num) {
		
		try {
			dbCon();
			String sql="select * from review where u_id=? and r_num=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, r_num);
			rs=ps.executeQuery();
			boolean result=false;
			if(rs.next()) {
				result= true;
			}else {
				result=false;
			}
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(con!=null)con.close();
			}catch(Exception e2) {}
		}
		
	}
	

	
	//수정하기
	public int reviewModify(String u_id,String r_subject, String r_content,int r_star,int r_num) {
		
		try {
			dbCon();
			String sql="update review set u_id=?, r_subject=?, r_content=?, r_star=?,r_date=sysdate where r_num=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, u_id);
			ps.setString(2, r_subject);
			ps.setString(3, r_content);
			ps.setInt(4, r_star);
			ps.setInt(5, r_num);
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
	
	
	
	//평균
	   public int reviewAvg(int idx) {
	      
	      try {
	         dbCon();
	         String sql="select avg(r_star) from review where idx=?";
	         ps=con.prepareStatement(sql);
	         ps.setInt(1, idx);
	         rs=ps.executeQuery();
	         rs.next();
	         int avg=rs.getInt(1);
	         return avg;
	      }catch(Exception e) {
	         e.printStackTrace();
	         return -1;
	      }finally {
	         try {
	            if(rs!=null)rs.close();
	            if(ps!=null)ps.close();
	            if(con!=null)con.close();
	         }catch(Exception e2) {}
	      }
	   }

	
	
}
