package semi.shopping;

public class ShoppingDTO {
   private int idx_s;
   private int idx;
   private String id;
   private String img;
   private String s_name;
   private int s_count;
   private int s_price;
   private String s_color;
   
   
   public int getIdx() {
      return idx;
   }
   public void setIdx(int idx) {
      this.idx = idx;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getImg() {
      return img;
   }
   public void setImg(String img) {
      this.img = img;
   }
   public String getS_name() {
      return s_name;
   }
   public void setS_name(String s_name) {
      this.s_name = s_name;
   }
   public int getS_count() {
      return s_count;
   }
   public void setS_count(int s_count) {
      this.s_count = s_count;
   }
   public int getS_price() {
      return s_price;
   }
   public void setS_price(int s_price) {
      this.s_price = s_price;
   }
   public String getS_color() {
      return s_color;
   }
   public void setS_color(String s_color) {
      this.s_color = s_color;
   }
   public ShoppingDTO() {
      // TODO Auto-generated constructor stub
   }
   public int getIdx_s() {
      return idx_s;
   }
   public void setIdx_s(int idx_s) {
      this.idx_s = idx_s;
   }
   public ShoppingDTO(int idx_s, int idx, String id, String img, String s_name, int s_count, int s_price,
         String s_color) {
      super();
      this.idx_s = idx_s;
      this.idx = idx;
      this.id = id;
      this.img = img;
      this.s_name = s_name;
      this.s_count = s_count;
      this.s_price = s_price;
      this.s_color = s_color;
   }
   
   
}