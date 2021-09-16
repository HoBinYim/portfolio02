package semi.product;

import java.sql.Date;

public class ProductDTO {
   private int idx;
   private String imgname;
   private String img1;
   private String img2;
   private String img3;
   private String img4;
   private String p_name;
   private String p_type;
   private int p_price;
   private String imgcontent;
   private int p_recommend;
   private Date p_record;
   private String search;
   private String m;
   
   
   
public String getM() {
      return m;
   }


   public void setM(String m) {
      this.m = m;
   }


public ProductDTO() {
   // TODO Auto-generated constructor stub
}


   public String getSearch() {
      return search;
   }


   public void setSearch(String search) {
      this.search = search;
   }

   

   




   public ProductDTO(int idx, String imgname, String img1, String img2, String img3, String img4, String p_name,
         String p_type, int p_price, String imgcontent, int p_recommend, Date p_record) {
      super();
      this.idx = idx;
      this.imgname = imgname;
      this.img1 = img1;
      this.img2 = img2;
      this.img3 = img3;
      this.img4 = img4;
      this.p_name = p_name;
      this.p_type = p_type;
      this.p_price = p_price;
      this.imgcontent = imgcontent;
      this.p_recommend = p_recommend;
      this.p_record = p_record;
   }


   public int getIdx() {
      return idx;
   }


   public void setIdx(int idx) {
      this.idx = idx;
   }


   public String getImgname() {
      return imgname;
   }


   public void setImgname(String imgname) {
      this.imgname = imgname;
   }





   public String getImg1() {
      return img1;
   }


   public void setImg1(String img1) {
      this.img1 = img1;
   }


   public String getImg2() {
      return img2;
   }


   public void setImg2(String img2) {
      this.img2 = img2;
   }


   public String getImg3() {
      return img3;
   }


   public void setImg3(String img3) {
      this.img3 = img3;
   }


   public String getImg4() {
      return img4;
   }


   public void setImg4(String img4) {
      this.img4 = img4;
   }


   public String getP_name() {
      return p_name;
   }


   public void setP_name(String p_name) {
      this.p_name = p_name;
   }


   public String getP_type() {
      return p_type;
   }


   public void setP_type(String p_type) {
      this.p_type = p_type;
   }





   public String getImgcontent() {
      return imgcontent;
   }


   public void setImgcontent(String imgcontent) {
      this.imgcontent = imgcontent;
   }





   public int getP_price() {
      return p_price;
   }


   public void setP_price(int p_price) {
      this.p_price = p_price;
   }


   public int getP_recommend() {
      return p_recommend;
   }


   public void setP_recommend(int p_recommend) {
      this.p_recommend = p_recommend;
   }


   public Date getP_record() {
      return p_record;
   }


   public void setP_record(Date p_record) {
      this.p_record = p_record;
   }
   
}