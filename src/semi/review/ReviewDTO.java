package semi.review;

import java.sql.*;

public class ReviewDTO {
	
	private int rnum;
	private int r_num; //리뷰 작성 순서
	private String u_id; //회원 아이디
	private int idx; // 제품 번호
	private String r_subject;//리뷰 제목
	private String r_content;//리뷰 내용
	private int r_star; //별점
	private Date r_date; //작성일
	private int r_ref;
	private int r_lev;
	private int r_sunbun;
	
	public ReviewDTO() {
		super();
	}


	

	public ReviewDTO(int r_num, String u_id, int idx, String r_subject, String r_content, int r_star, Date r_date,
			int r_ref, int r_lev, int r_sunbun) {
		super();
		this.r_num = r_num;
		this.u_id = u_id;
		this.idx = idx;
		this.r_subject = r_subject;
		this.r_content = r_content;
		this.r_star = r_star;
		this.r_date = r_date;
		this.r_ref = r_ref;
		this.r_lev = r_lev;
		this.r_sunbun = r_sunbun;
	}

	


	public ReviewDTO(int rnum, int r_num, String u_id, int idx, String r_subject, String r_content, int r_star,
			Date r_date, int r_ref, int r_lev, int r_sunbun) {
		super();
		this.rnum = rnum;
		this.r_num = r_num;
		this.u_id = u_id;
		this.idx = idx;
		this.r_subject = r_subject;
		this.r_content = r_content;
		this.r_star = r_star;
		this.r_date = r_date;
		this.r_ref = r_ref;
		this.r_lev = r_lev;
		this.r_sunbun = r_sunbun;
	}




	public int getRnum() {
		return rnum;
	}




	public void setRnum(int rnum) {
		this.rnum = rnum;
	}




	public int getR_num() {
		return r_num;
	}


	public void setR_num(int r_num) {
		this.r_num = r_num;
	}


	public String getU_id() {
		return u_id;
	}


	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public String getR_subject() {
		return r_subject;
	}


	public void setR_subject(String r_subject) {
		this.r_subject = r_subject;
	}


	public String getR_content() {
		return r_content;
	}


	public void setR_content(String r_content) {
		this.r_content = r_content;
	}


	public int getR_star() {
		return r_star;
	}


	public void setR_star(int r_star) {
		this.r_star = r_star;
	}


	public Date getR_date() {
		return r_date;
	}


	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}


	public int getR_ref() {
		return r_ref;
	}


	public void setR_ref(int r_ref) {
		this.r_ref = r_ref;
	}


	public int getR_lev() {
		return r_lev;
	}


	public void setR_lev(int r_lev) {
		this.r_lev = r_lev;
	}


	public int getR_sunbun() {
		return r_sunbun;
	}


	public void setR_sunbun(int r_sunbun) {
		this.r_sunbun = r_sunbun;
	}
	
	
	
	
	
	
	
	

}
