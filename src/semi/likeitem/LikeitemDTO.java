package semi.likeitem;

public class LikeitemDTO {

	private int idx;
	private String l_id;
	private String l_img;
	private int l_price;
	private String l_name;
	
	public LikeitemDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getL_id() {
		return l_id;
	}

	public void setL_id(String l_id) {
		this.l_id = l_id;
	}

	public String getL_img() {
		return l_img;
	}

	public void setL_img(String l_img) {
		this.l_img = l_img;
	}

	public int getL_price() {
		return l_price;
	}

	public void setL_price(int l_price) {
		this.l_price = l_price;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public LikeitemDTO(int idx, String l_id, String l_img, int l_price, String l_name) {
		super();
		this.idx = idx;
		this.l_id = l_id;
		this.l_img = l_img;
		this.l_price = l_price;
		this.l_name = l_name;
	}
	
	
	
}
