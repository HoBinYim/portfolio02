package semi.buylist;

import java.sql.*;

public class BuylistDTO {
	
	private int idx;
	private String u_id;
	private String img;
	private String b_name;
	private int b_count;
	private int b_price;
	private String b_color;
	private Date b_date;
	
	
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


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	public String getB_name() {
		return b_name;
	}


	public void setB_name(String b_name) {
		this.b_name = b_name;
	}


	public int getB_count() {
		return b_count;
	}


	public void setB_count(int b_count) {
		this.b_count = b_count;
	}


	public int getB_price() {
		return b_price;
	}


	public void setB_price(int b_price) {
		this.b_price = b_price;
	}


	public String getB_color() {
		return b_color;
	}


	public void setB_color(String b_color) {
		this.b_color = b_color;
	}


	public Date getB_date() {
		return b_date;
	}


	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}


	public BuylistDTO(int idx, String u_id, String img, String b_name, int b_count, int b_price, String b_color,
			Date b_date) {
		super();
		this.idx = idx;
		this.u_id = u_id;
		this.img = img;
		this.b_name = b_name;
		this.b_count = b_count;
		this.b_price = b_price;
		this.b_color = b_color;
		this.b_date = b_date;
	}
}
