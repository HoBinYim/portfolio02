package semi.bbs;

import java.sql.*;

public class BbsDTO {

   private int idx;
   private String u_id;
   private String b_subject;
   private int b_readnum;
   private String b_content;
   private String b_date;
   private int b_ref;
   private int b_lev;
   private int b_sunbun;
   
   public BbsDTO() {
      // TODO Auto-generated constructor stub
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

   public String getB_subject() {
      return b_subject;
   }

   public void setB_subject(String b_subject) {
      this.b_subject = b_subject;
   }

   public int getB_readnum() {
      return b_readnum;
   }

   public void setB_readnum(int b_readnum) {
      this.b_readnum = b_readnum;
   }

   public String getB_content() {
      return b_content;
   }

   public void setB_content(String b_content) {
      this.b_content = b_content;
   }

   public String getB_date() {
      return b_date;
   }

   public void setB_date(String b_date) {
      this.b_date = b_date;
   }

   public int getB_ref() {
      return b_ref;
   }

   public void setB_ref(int b_ref) {
      this.b_ref = b_ref;
   }

   public int getB_lev() {
      return b_lev;
   }

   public void setB_lev(int b_lev) {
      this.b_lev = b_lev;
   }

   public int getB_sunbun() {
      return b_sunbun;
   }

   public void setB_sunbun(int b_sunbun) {
      this.b_sunbun = b_sunbun;
   }

   public BbsDTO(int idx, String u_id, String b_subject, int b_readnum, String b_content, String b_date, int b_ref,
         int b_lev, int b_sunbun) {
      super();
      this.idx = idx;
      this.u_id = u_id;
      this.b_subject = b_subject;
      this.b_readnum = b_readnum;
      this.b_content = b_content;
      this.b_date = b_date;
      this.b_ref = b_ref;
      this.b_lev = b_lev;
      this.b_sunbun = b_sunbun;
   }

   
   
   
   
}