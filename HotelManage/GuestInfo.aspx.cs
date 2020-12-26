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
    public partial class GuestInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }



        public int ye() {
            if (!IsPostBack)
            {
                return Convert.ToInt32(this.TextBox7.Text);
            }
            else {
                return 0;
            }
        }

        public void hehe() {
            int allye = Convert.ToInt32(BLL_Hotel.Cha_Cus().Rows.Count.ToString());
            if (allye % 6 == 0)
            {
                this.TextBox7.Text = (allye / 6).ToString();

            }
            else
            {
                this.TextBox7.Text = (allye / 6 + 1).ToString();
            }
        
        }


        public void bind()
        {
            DataTable dt = BLL_Hotel.Cha_CusFenYe(1);
            this.GridView1.DataSource = dt;
            this.GridView1.DataBind();
            hehe();
                  
         }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "dj") { //如果用户点击了“入住登记”
                int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
                int idd = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("CheckIn.aspx?gid="+idd+"&roomid="+roomid);
            
            }

            if (e.CommandName == "yd")  //如果用户点击了“预订”
            {
                int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
                int idd = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Reserve.aspx?gid=" + idd + "&roomid=" + roomid);

            }



        }
        //查询顾客
        protected void Button1_Click(object sender, EventArgs e)
        {
           
            if (this.TextBox1.Text != "" && this.TextBox2.Text == "" && this.TextBox5.Text == "" && this.TextBox6.Text == "") {
                this.Label1.Text = "Gid";
                int idd = Convert.ToInt32(this.TextBox1.Text);
                DataTable dt=BLL_Hotel.Cha_GuestInfoByGid(idd);
                this.GridView1.DataSource = BLL_Hotel.Cha_GuestInfoByGid(idd,1); ;
                int ye = fenye(dt.Rows.Count);
                this.TextBox3.Text = ye.ToString();
                this.GridView1.DataBind();
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:"+ye+",current:1,});", true);
            
            }
            else if (this.TextBox1.Text == "" && this.TextBox2.Text != "" && this.TextBox5.Text == "" && this.TextBox6.Text == "") {
                string Gname = this.TextBox2.Text;               this.Label1.Text = "Gname";
                DataTable dt = BLL_Hotel.Cha_GuestInfoByGname(Gname);
                this.GridView1.DataSource = BLL_Hotel.Cha_GuestInfoByGname(Gname,1);
                int ye = fenye(dt.Rows.Count);
                this.TextBox3.Text = ye.ToString();
                this.GridView1.DataBind();
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + ye + ",current:1,});", true);


            }

            else if (this.TextBox1.Text == "" && this.TextBox2.Text == "" && this.TextBox5.Text != "" && this.TextBox6.Text == "")
            {
                string Mobile = this.TextBox5.Text;
                this.Label1.Text = "Mobile";
                DataTable dt = BLL_Hotel.Cha_GuestInfoByMobile(Mobile);
                this.GridView1.DataSource = BLL_Hotel.Cha_GuestInfoByMobile(Mobile, 1);
                int ye = fenye(dt.Rows.Count);
                this.TextBox3.Text = ye.ToString();
                this.GridView1.DataBind();
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + ye + ",current:1,});", true);
            }
            else if (this.TextBox1.Text == "" && this.TextBox2.Text == "" && this.TextBox5.Text == "" && this.TextBox6.Text != "")
            {
                string pid = this.TextBox6.Text;
                this.Label1.Text = "Pid";
                DataTable dt = BLL_Hotel.Cha_GuestInfoByPid(pid);
                this.GridView1.DataSource = BLL_Hotel.Cha_GuestInfoByPid(pid, 1);
                int ye = fenye(dt.Rows.Count);
                this.TextBox3.Text = ye.ToString();
                this.GridView1.DataBind();
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + ye + ",current:1,});", true);

            }
            else
            {
            bind();
            }




        }

        //新增顾客
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("GuestReg.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {


                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='White';this.style.color='#343434'");
                e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#C8F2D5';this.style.color='#343434'");



                //设置悬浮鼠标指针形状为"小手"      

                e.Row.Attributes["style"] = "Cursor:hand";

            }     

        }

        public void type() {
            if (this.Label1.Text == "Gid") { 
            
            }



            else if (this.Label1.Text == "Mobile")
            { 
            
            }
            else if(this.Label1.Text=="Pid"){ 
            
            }
        
        
        }

        public int fenye(int allye)
        {
            int ye = 0;
            if (allye % 6 == 0)
            {
                ye = allye / 6;

            }
            else
            {
                ye = allye / 6 + 1;
            }

            return ye;
        }



        protected void Button4_Click(object sender, EventArgs e)
        {
            if (this.Label1.Text == "Gid")
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + this.TextBox3.Text + ",current:"+this.TextBox7.Text+"});", true);
                int hehe = Convert.ToInt32(this.TextBox7.Text);
                DataTable dt = BLL_Hotel.Cha_GuestInfoByGid(Convert.ToInt32(this.TextBox1.Text),hehe);
                this.GridView1.DataSource = dt;
                this.GridView1.DataBind();
            }

            else if (this.Label1.Text == "Gname")
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + this.TextBox3.Text + ",current:" + this.TextBox7.Text + "});", true);
                int hehe = Convert.ToInt32(this.TextBox7.Text);
                DataTable dt = BLL_Hotel.Cha_GuestInfoByGname(this.TextBox2.Text, hehe);
                this.GridView1.DataSource = dt;
                this.GridView1.DataBind();

            }
            else if (this.Label1.Text == "Mobile")
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + this.TextBox3.Text + ",current:" + this.TextBox7.Text + "});", true);
                int hehe = Convert.ToInt32(this.TextBox7.Text);
                DataTable dt = BLL_Hotel.Cha_GuestInfoByMobile(this.TextBox5.Text, hehe);
                this.GridView1.DataSource = dt;
                this.GridView1.DataBind();
            
            }
            else if (this.Label1.Text == "Pid") 
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + this.TextBox3.Text + ",current:" + this.TextBox7.Text + "});", true);
                int hehe = Convert.ToInt32(this.TextBox7.Text);
                DataTable dt = BLL_Hotel.Cha_GuestInfoByPid(this.TextBox6.Text, hehe);
                this.GridView1.DataSource = dt;
                this.GridView1.DataBind();
            
            
            }
            else
            {

                int hehe = Convert.ToInt32(this.TextBox7.Text);
                DataTable dt = BLL_Hotel.Cha_CusFenYe(hehe);
                this.GridView1.DataSource = dt;
                this.GridView1.DataBind();

            }
            
            
          
        }

 













    }
}