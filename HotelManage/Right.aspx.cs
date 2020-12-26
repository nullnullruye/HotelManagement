using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;

namespace HotelManage
{
    public partial class Right : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          bind();
          imgtype();
        
           
        }
        public int ye() {
            int allye = BLL_Hotel.Img_Table().Rows.Count;
            int ye = 0;
            if (allye % 36 == 0)
            {
                ye = (allye / 36);

            }
            else
            {
                ye= (allye / 36 + 1);
            }
            return ye;
        
        }


         public  void bind(){
         DataTable dt = BLL_Hotel.Img_Table(1);
         this.DataList1.DataSource = dt;
         this.DataList1.DataBind();

         DataTable dt1= BLL_Hotel.Cha_OutDay();

         if (dt1.Rows.Count >= 1)
         {
             this.Label1.Text = "①：" + dt1.Rows[0]["number"].ToString() + "号房即将在" + dt1.Rows[0]["outtime"].ToString() + "过期，请及时提醒用户续交押金或办理退房手续。";
         }

         if (dt1.Rows.Count >= 2)
         {
             this.Label2.Text = "②：" + dt1.Rows[1]["number"].ToString() + "号房即将在" + dt1.Rows[1]["outtime"].ToString() + "过期，请及时提醒用户续交押金或办理退房手续。";
         }
         if (dt1.Rows.Count >= 3)
         {
             this.Label3.Text = "③：" + dt1.Rows[2]["number"].ToString() + "号房即将在" + dt1.Rows[2]["outtime"].ToString() + "过期，请及时提醒用户续交押金或办理退房手续。";
         }
         if (dt1.Rows.Count >= 4)
         {
             this.Label4.Text = "④：" + dt1.Rows[3]["number"].ToString() + "号房即将在" + dt1.Rows[3]["outtime"].ToString() + "过期，请及时提醒用户续交押金或办理退房手续。";
         }  
    }

         public void imgtype() {
             this.Image1.ImageUrl = "images/ico/type1.jpg";
             this.Image2.ImageUrl = "images/ico/type2.jpg";
             this.Image3.ImageUrl = "images/ico/type3.jpg";
             this.Image4.ImageUrl = "images/ico/type4.jpg";
             this.Image5.ImageUrl = "images/ico/type5.jpg";
             this.Image6.ImageUrl = "images/ico/type6.jpg";
         
         }
         public void imgtype(int type) {
             this.Image1.ImageUrl = "images/ico/type"+type+".jpg";
             this.Image2.ImageUrl = "images/ico/type" + type + ".jpg";
             this.Image3.ImageUrl = "images/ico/type" + type + ".jpg";
             this.Image4.ImageUrl = "images/ico/type" + type + ".jpg";
             this.Image5.ImageUrl = "images/ico/type" + type + ".jpg";
             this.Image6.ImageUrl = "";
             DataTable dt = BLL_Hotel.image_TableType(type);
             this.DataList1.DataSource = dt;
             this.DataList1.DataBind();
         
         }
 


         protected void Button3_Click(object sender, EventArgs e)
         {
             int hehe = Convert.ToInt32(this.TextBox7.Text);
             DataTable dt = BLL_Hotel.Img_Table(hehe);
             this.DataList1.DataSource = dt;
             this.DataList1.DataBind();
         }

         protected void Button1_Click(object sender, EventArgs e)
         {
             imgtype(1);
            
         }

         protected void Button2_Click(object sender, EventArgs e)
         {
             imgtype(2);
             

         }

         protected void Button4_Click(object sender, EventArgs e)
         {
             imgtype(3);
            
         }

         protected void Button5_Click(object sender, EventArgs e)
         {
             imgtype(4);
           
         }
         protected void Button6_Click(object sender, EventArgs e)
         {
             imgtype(5);
            

         }

         protected void Button7_Click(object sender, EventArgs e)
         {
             imgtype(6);
            
         }



    }
}