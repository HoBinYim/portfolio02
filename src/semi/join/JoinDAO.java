package semi.join;

import java.sql.*;
import java.sql.Date;
import java.util.*;
import semi.join.JoinDTO;


public class JoinDAO {
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public static final int NOT_ID=1;
	public static final int NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;	
	
	public JoinDAO() {
	}
	
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
	
	/**회원가입 관련 메서드*/
	public int join(JoinDTO dto){
		try {
			dbCon();

			String sql="insert into join values (join_idx.nextval,?,?,?,?,?,?,?,?,?,?,?,TO_DATE(?,'YYYY-MM-DD'),sysdate)";
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getU_id());
			ps.setString(2, dto.getU_idhint1());
			ps.setString(3, dto.getU_idhint2());
			ps.setString(4, dto.getU_pwd());
			ps.setString(5, dto.getU_pwdhint1());
			ps.setString(6, dto.getU_pwdhint2());
			ps.setString(7, dto.getU_name());
			ps.setString(8, dto.getU_email());
			ps.setString(9, dto.getU_tel());
			ps.setString(10, dto.getU_addr());
			ps.setString(11, dto.getU_sex());
			ps.setString(12, dto.getU_birth());
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(con!=null) con.close();
			}catch(Exception e2) {}
		}
	}
	
	/**id 중복검사 관련 메서드*/
	public boolean emailCheck(String u_email) {
		boolean check=false;
		try {
			dbCon();
			String sql="select * from join where u_email=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, u_email);
			rs=ps.executeQuery();
			check = rs.next();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(con!=null) con.close();
			}catch(Exception e2) {}
		}
		return check;
	}
	
	/**email 중복검사 관련 메서드*/
	public boolean idCheck(String u_id) {
		boolean check=false;
		try {
			dbCon();
			String sql="select * from join where u_id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, u_id);
			rs=ps.executeQuery();
			check = rs.next();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(con!=null) con.close();
			}catch(Exception e2) {}
		}
		return check;
	}
	
	/**로그인 관련 메서드*/
	public int login(String u_id, String u_pwd) {
		try {
			dbCon();
			
	        String sql="select u_pwd from join where u_id=?";
	        ps=con.prepareStatement(sql);
	        ps.setString(1, u_id);
	        rs=ps.executeQuery();
	        if(rs.next()) {
	           String db_pwd=rs.getString("u_pwd");
	           if(db_pwd.equals(u_pwd)) {
	               return LOGIN_OK;
	           }
	           else {
	              return NOT_PWD;
	           }
	        }
	        else {
	           return NOT_ID;
	        }
	     } catch (Exception e) {
	        e.printStackTrace();
	        return ERROR;
	     } finally {
	        try {
	        	if(rs!=null)rs.close();
	            if(ps!=null)ps.close();
	            if(con!=null)con.close();
	        } catch (Exception e2) {}
	        }
	}
	
	/**사용자 정보 추출 관련 메서드*/
	public String getUserInfo(String u_id) {
		try {
			dbCon();
			
			String sql="select u_name from join where u_id=?";
	        ps=con.prepareStatement(sql);
	        ps.setString(1, u_id);
	        rs=ps.executeQuery();
	        rs.next();
	        return rs.getString("u_name");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(con!=null)con.close();
			} catch (Exception e2) {}
		}
   }
	
	/**아이디 찾기 관련 메서드*/
	public ArrayList<JoinDTO> idFind(String u_name1, String u_email1) {
		   try {
			   dbCon();
		     
		      String sql="select * from join where u_name=? and u_email=?";
		      ps=con.prepareStatement(sql);
		      ps.setString(1, u_name1);
		      ps.setString(2, u_email1);
		      
		      rs=ps.executeQuery();
		      ArrayList<JoinDTO> arr = new ArrayList<JoinDTO>();
		      while(rs.next()){
		         int idx = rs.getInt("idx");
		         String u_id = rs.getString("u_id");
		         String u_idhint1 = rs.getString("u_idhint1");
		         String u_idhint2 = rs.getString("u_idhint2");
		         String u_pwd = rs.getString("u_pwd");
		         String u_pwdhint1 = rs.getString("u_pwdhint1");
		         String u_pwdhint2 = rs.getString("u_pwdhint2");
		         String u_name = rs.getString("u_name");
		         String u_email = rs.getString("u_email");
		         String u_tel = rs.getString("u_tel");
		         String u_addr = rs.getString("u_addr");
		         String u_sex = rs.getString("u_sex");
		         String u_birth = rs.getString("u_birth");
		         java.sql.Date joindate = rs.getDate("joindate");
		         
		         JoinDTO edto = new JoinDTO(idx,  u_id,  u_idhint1, u_idhint2,  u_pwd,  u_pwdhint1, u_pwdhint2,  u_name,  u_email,  u_tel,  u_addr,  u_sex,  u_birth, joindate);
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
		         if(con!=null)con.close();
		      } catch (Exception e2) {
		         // TODO: handle exception
		      }
		   }   
		}
	
	
	/**아이디 힌트 관련 메서드*/
	public ArrayList<JoinDTO> idHintFind(String u_email_1, String u_idhint2_1) {
		   try {
			   dbCon();
		     
		      String sql="select * from join where u_email=? and u_idhint2=?";
		      ps=con.prepareStatement(sql);
		      ps.setString(1, u_email_1);
		      ps.setString(2, u_idhint2_1);
		      
		      rs=ps.executeQuery();
		      ArrayList<JoinDTO> arr = new ArrayList<JoinDTO>();
		      while(rs.next()){
		         int idx = rs.getInt("idx");
		         String u_id = rs.getString("u_id");
		         String u_idhint1 = rs.getString("u_idhint1");
		         String u_idhint2 = rs.getString("u_idhint2");
		         String u_pwd = rs.getString("u_pwd");
		         String u_pwdhint1 = rs.getString("u_pwdhint1");
		         String u_pwdhint2 = rs.getString("u_pwdhint2");
		         String u_name = rs.getString("u_name");
		         String u_email = rs.getString("u_email");
		         String u_tel = rs.getString("u_tel");
		         String u_addr = rs.getString("u_addr");
		         String u_sex = rs.getString("u_sex");
		         String u_birth = rs.getString("u_birth");
		         java.sql.Date joindate = rs.getDate("joindate");
		         
		         JoinDTO edto = new JoinDTO(idx,  u_id,  u_idhint1, u_idhint2,  u_pwd,  u_pwdhint1, u_pwdhint2,  u_name,  u_email,  u_tel,  u_addr,  u_sex,  u_birth, joindate);
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
		         if(con!=null)con.close();
		      } catch (Exception e2) {
		         // TODO: handle exception
		      }
		   }   
		}
	
	/**비밀번호 찾기 관련 메서드*/
	public ArrayList<JoinDTO> pwdFind(String u_id1) {
		   try {
			   dbCon();
		     
		      String sql="select * from join where u_id=?";
		      ps=con.prepareStatement(sql);
		      ps.setString(1, u_id1);
		      
		      rs=ps.executeQuery();
		      ArrayList<JoinDTO> arr = new ArrayList<JoinDTO>();
		      while(rs.next()){
		         int idx = rs.getInt("idx");
		         String u_id = rs.getString("u_id");
		         String u_idhint1 = rs.getString("u_idhint1");
		         String u_idhint2 = rs.getString("u_idhint2");
		         String u_pwd = rs.getString("u_pwd");
		         String u_pwdhint1 = rs.getString("u_pwdhint1");
		         String u_pwdhint2 = rs.getString("u_pwdhint2");
		         String u_name = rs.getString("u_name");
		         String u_email = rs.getString("u_email");
		         String u_tel = rs.getString("u_tel");
		         String u_addr = rs.getString("u_addr");
		         String u_sex = rs.getString("u_sex");
		         String u_birth = rs.getString("u_birth");
		         java.sql.Date joindate = rs.getDate("joindate");
		         
		         JoinDTO edto = new JoinDTO(idx,  u_id,  u_idhint1, u_idhint2,  u_pwd,  u_pwdhint1, u_pwdhint2,  u_name,  u_email,  u_tel,  u_addr,  u_sex,  u_birth, joindate);
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
		         if(con!=null)con.close();
		      } catch (Exception e2) {
		         // TODO: handle exception
		      }
		   }   
		}
	
	/**비밀번호 힌트 관련 메서드*/
	public ArrayList<JoinDTO> pwdHintFind(String u_id_1, String u_pwdhint2_1) {
		   try {
			   dbCon();
		     
		      String sql="select * from join where u_id=? and u_pwdhint2=?";
		      ps=con.prepareStatement(sql);
		      ps.setString(1, u_id_1);
		      ps.setString(2, u_pwdhint2_1);
		      
		      rs=ps.executeQuery();
		      ArrayList<JoinDTO> arr = new ArrayList<JoinDTO>();
		      while(rs.next()){
		         int idx = rs.getInt("idx");
		         String u_id = rs.getString("u_id");
		         String u_idhint1 = rs.getString("u_idhint1");
		         String u_idhint2 = rs.getString("u_idhint2");
		         String u_pwd = rs.getString("u_pwd");
		         String u_pwdhint1 = rs.getString("u_pwdhint1");
		         String u_pwdhint2 = rs.getString("u_pwdhint2");
		         String u_name = rs.getString("u_name");
		         String u_email = rs.getString("u_email");
		         String u_tel = rs.getString("u_tel");
		         String u_addr = rs.getString("u_addr");
		         String u_sex = rs.getString("u_sex");
		         String u_birth = rs.getString("u_birth");
		         java.sql.Date joindate = rs.getDate("joindate");
		         
		         JoinDTO edto = new JoinDTO(idx,  u_id,  u_idhint1, u_idhint2,  u_pwd,  u_pwdhint1, u_pwdhint2,  u_name,  u_email,  u_tel,  u_addr,  u_sex,  u_birth, joindate);
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
		         if(con!=null)con.close();
		      } catch (Exception e2) {
		         // TODO: handle exception
		      }
		   }   
		}
	
	/**비밀번호 변경 관련 메서드*/
	public int pwdModi(String u_pwd_1,String u_id_1) {
		   try {
			  dbCon();
		     
		      String sql="update join set u_pwd=? where u_id=?";
		      ps=con.prepareStatement(sql);
		      ps.setString(1, u_pwd_1);
		      ps.setString(2, u_id_1);
		      int count=ps.executeUpdate();
		      return count;
		   } catch (Exception e) {
		      // TODO: handle exception
		      e.printStackTrace();
		      return -1;
		   }finally {
		      try {
		         if(rs!=null)rs.close();
		         if(ps!=null)ps.close();
		         if(con!=null)con.close();
		      } catch (Exception e2) {}
		   }   
		}
	
	/**회원정보 확인 관련 메서드*/
	public ArrayList<JoinDTO> changeInfo(String u_id1, String u_pwd1) {
		   try {
			  dbCon();
		     
		      String sql="select * from join where u_id=? and u_pwd=?";
		      ps=con.prepareStatement(sql);
		      ps.setString(1, u_id1);
		      ps.setString(2, u_pwd1);
		      
		      rs=ps.executeQuery();
		      ArrayList<JoinDTO> arr = new ArrayList<JoinDTO>();
		      while(rs.next()){
		         int idx = rs.getInt("idx");
		         String u_id = rs.getString("u_id");
		         String u_idhint1 = rs.getString("u_idhint1");
		         String u_idhint2 = rs.getString("u_idhint2");
		         String u_pwd = rs.getString("u_pwd");
		         String u_pwdhint1 = rs.getString("u_pwdhint1");
		         String u_pwdhint2 = rs.getString("u_pwdhint2");
		         String u_name = rs.getString("u_name");
		         String u_email = rs.getString("u_email");
		         String u_tel = rs.getString("u_tel");
		         String u_addr = rs.getString("u_addr");
		         String u_sex = rs.getString("u_sex");
		         String u_birth = rs.getString("u_birth");
		         java.sql.Date joindate = rs.getDate("joindate");
		         
		         JoinDTO edto = new JoinDTO(idx,  u_id,  u_idhint1, u_idhint2,  u_pwd,  u_pwdhint1, u_pwdhint2,  u_name,  u_email,  u_tel,  u_addr,  u_sex,  u_birth, joindate);
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
		         if(con!=null)con.close();
		      } catch (Exception e2) {
		         // TODO: handle exception
		      }
		   }
		   
		}
	
	/**회원정보 관련 메서드*/
	public ArrayList<JoinDTO> idInfo(String u_id_1) {
		   try {
			   dbCon();
		     
		      String sql="select * from join where u_id=?";
		      ps=con.prepareStatement(sql);
		      ps.setString(1, u_id_1);
		      
		      rs=ps.executeQuery();
		      ArrayList<JoinDTO> arr = new ArrayList<JoinDTO>();
		      while(rs.next()){
		         int idx = rs.getInt("idx");
		         String u_id = rs.getString("u_id");
		         String u_idhint1 = rs.getString("u_idhint1");
		         String u_idhint2 = rs.getString("u_idhint2");
		         String u_pwd = rs.getString("u_pwd");
		         String u_pwdhint1 = rs.getString("u_pwdhint1");
		         String u_pwdhint2 = rs.getString("u_pwdhint2");
		         String u_name = rs.getString("u_name");
		         String u_email = rs.getString("u_email");
		         String u_tel = rs.getString("u_tel");
		         String u_addr = rs.getString("u_addr");
		         String u_sex = rs.getString("u_sex");
		         String u_birth = rs.getString("u_birth");
		         java.sql.Date joindate = rs.getDate("joindate");
		         
		         JoinDTO edto = new JoinDTO( idx,  u_id,  u_idhint1, u_idhint2,  u_pwd,  u_pwdhint1, u_pwdhint2,  u_name,  u_email,  u_tel,  u_addr,  u_sex,  u_birth, joindate);
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
		         if(con!=null)con.close();
		      } catch (Exception e2) {
		         // TODO: handle exception
		      }
		   }
		}
	
	
	/////////////////
	
	
	/**회원정보 변경 관련 메서드*/
	public ArrayList<JoinDTO> changeInfo1(String u_idhint1_1, String u_idhint2_1, String u_pwd_1, String u_pwdhint1_1, String u_pwdhint2_1, String u_name_1, String u_email_1, String u_tel_1, String u_addr_1, String u_sex_1, String u_birth_1, String u_id_1) {
		   try {
			   dbCon();
		     
		      String sql="update join set u_idhint1=?, u_idhint2=?, u_pwd=?, u_pwdhint1=?, u_pwdhint2=?, u_name=?, u_email=?, u_tel=?, u_addr=?, u_sex=?, u_birth=TO_DATE(?,'YYYY-MM-DD') where u_id=?";
		      ps=con.prepareStatement(sql);
		      ps.setString(1, u_idhint1_1);
		      ps.setString(2, u_idhint2_1);
		      ps.setString(3, u_pwd_1);
		      ps.setString(4, u_pwdhint1_1);
		      ps.setString(5, u_pwdhint2_1);
		      ps.setString(6, u_name_1);
		      ps.setString(7, u_email_1);
		      ps.setString(8, u_tel_1);
		      ps.setString(9, u_addr_1);
		      ps.setString(10, u_sex_1);
		      ps.setString(11, u_birth_1);
		      ps.setString(12, u_id_1);
		      
		      rs=ps.executeQuery();
		      ArrayList<JoinDTO> arr = new ArrayList<JoinDTO>();
		      while(rs.next()){
		         int idx = rs.getInt("idx");
		         String u_id = rs.getString("u_id");
		         String u_idhint1 = rs.getString("u_idhint1");
		         String u_idhint2 = rs.getString("u_idhint2");
		         String u_pwd = rs.getString("u_pwd");
		         String u_pwdhint1 = rs.getString("u_pwdhint1");
		         String u_pwdhint2 = rs.getString("u_pwdhint2");
		         String u_name = rs.getString("u_name");
		         String u_email = rs.getString("u_email");
		         String u_tel = rs.getString("u_tel");
		         String u_addr = rs.getString("u_addr");
		         String u_sex = rs.getString("u_sex");
		         String u_birth = rs.getString("u_birth");
		         java.sql.Date joindate = rs.getDate("joindate");
		         
		         JoinDTO edto = new JoinDTO( idx,  u_id,  u_idhint1, u_idhint2,  u_pwd,  u_pwdhint1, u_pwdhint2,  u_name,  u_email,  u_tel,  u_addr,  u_sex,  u_birth, joindate);
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
		         if(con!=null)con.close();
		      } catch (Exception e2) {
		         // TODO: handle exception
		      }
		   }
		}
	
	/**회원정보 탈퇴 관련 메서드*/
	public int joinOut(String u_id1) {
		   try {
			   dbCon();
		     
		      String sql="delete from join where u_id=?";
		      ps=con.prepareStatement(sql);
		      ps.setString(1, u_id1);
		     
		      int count = ps.executeUpdate();
		      
		     
		      return count;
		   } catch (Exception e) {
		      // TODO: handle exception
		      e.printStackTrace();
		      return -1;
		   }finally {
		      try {
		         if(rs!=null)rs.close();
		         if(ps!=null)ps.close();
		         if(con!=null)con.close();
		      } catch (Exception e2) {
		         // TODO: handle exception
		      }
		   }
		}
	
	/**사용자 정보 관련 메서드*/
	public ArrayList<JoinDTO> getbuyInfo(String u_id) {
        try {
           dbCon();
          
           String sql="select * from join where u_id=?";
           ps=con.prepareStatement(sql);
           ps.setString(1, u_id);
           
           
           rs=ps.executeQuery();
           ArrayList<JoinDTO> arr = new ArrayList<JoinDTO>();
           while(rs.next()){
              int idx = rs.getInt("idx");
              String u_id_1 = rs.getString("u_id");
              String u_idhint1 = rs.getString("u_idhint1");
              String u_idhint2 = rs.getString("u_idhint2");
              String u_pwd = rs.getString("u_pwd");
              String u_pwdhint1 = rs.getString("u_pwdhint1");
              String u_pwdhint2 = rs.getString("u_pwdhint2");
              String u_name = rs.getString("u_name");
              String u_email = rs.getString("u_email");
              String u_tel = rs.getString("u_tel");
              String u_addr = rs.getString("u_addr");
              String u_sex = rs.getString("u_sex");
              String u_birth = rs.getString("u_birth");
              java.sql.Date joindate = rs.getDate("joindate");
              
              JoinDTO edto = new JoinDTO( idx,  u_id_1,  u_idhint1, u_idhint2,  u_pwd,  u_pwdhint1, u_pwdhint2,  u_name,  u_email,  u_tel,  u_addr,  u_sex,  u_birth, joindate);
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
              if(con!=null)con.close();
           } catch (Exception e2) {
              // TODO: handle exception
           }
        }
        
     }
	
}	
