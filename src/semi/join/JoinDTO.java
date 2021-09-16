package semi.join;

import java.sql.*;

public class JoinDTO {
	
	private int idx;
	private String u_id;
	private String u_idhint1;
	private String u_idhint2;
	private String u_pwd;
	private String u_pwdhint1;
	private String u_pwdhint2;
	private String u_name;
	private String u_email;
	private String u_tel;
	private String u_addr;
	private String u_sex;
	private String u_birth;
	private Date joindate;
	   
	public JoinDTO() {
	}

	public JoinDTO(int idx, String u_id, String u_idhint1, String u_idhint2, String u_pwd, String u_pwdhint1,
			String u_pwdhint2, String u_name, String u_email, String u_tel, String u_addr, String u_sex, String u_birth,
			Date joindate) {
		super();
		this.idx = idx;
		this.u_id = u_id;
		this.u_idhint1 = u_idhint1;
		this.u_idhint2 = u_idhint2;
		this.u_pwd = u_pwd;
		this.u_pwdhint1 = u_pwdhint1;
		this.u_pwdhint2 = u_pwdhint2;
		this.u_name = u_name;
		this.u_email = u_email;
		this.u_tel = u_tel;
		this.u_addr = u_addr;
		this.u_sex = u_sex;
		this.u_birth = u_birth;
		this.joindate = joindate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_idhint1() {
		return u_idhint1;
	}

	public void setU_idhint1(String u_idhint1) {
		this.u_idhint1 = u_idhint1;
	}

	public String getU_idhint2() {
		return u_idhint2;
	}

	public void setU_idhint2(String u_idhint2) {
		this.u_idhint2 = u_idhint2;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public String getU_pwdhint1() {
		return u_pwdhint1;
	}

	public void setU_pwdhint1(String u_pwdhint1) {
		this.u_pwdhint1 = u_pwdhint1;
	}

	public String getU_pwdhint2() {
		return u_pwdhint2;
	}

	public void setU_pwdhint2(String u_pwdhint2) {
		this.u_pwdhint2 = u_pwdhint2;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_tel() {
		return u_tel;
	}

	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}

	public String getU_addr() {
		return u_addr;
	}

	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}

	public String getU_sex() {
		return u_sex;
	}

	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	
}
