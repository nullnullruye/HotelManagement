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
    public partial class RoomDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
                textTurnOff();
            }



        }
        public void bind() {

           
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);

            DataTable dt = BLL_Hotel.Cha_OneRecord(roomid);
            this.TextBox1.Text = dt.Rows[0]["gid"].ToString();
            this.TextBox2.Text = dt.Rows[0]["gname"].ToString();
            this.TextBox3.Text = dt.Rows[0]["sex"].ToString();
            this.TextBox4.Text = dt.Rows[0]["mobile"].ToString();
            this.TextBox5.Text = dt.Rows[0]["tname"].ToString();
            this.TextBox6.Text = dt.Rows[0]["pid"].ToString();
            this.TextBox7.Text = dt.Rows[0]["mark"].ToString();
            this.TextBox8.Text = dt.Rows[0]["fname"].ToString();
            this.TextBox9.Text = dt.Rows[0]["rtname"].ToString();
            this.TextBox10.Text = dt.Rows[0]["intime"].ToString();
            this.TextBox11.Text = dt.Rows[0]["number"].ToString();
            this.TextBox12.Text = dt.Rows[0]["outtime"].ToString();
            this.TextBox13.Text = dt.Rows[0]["charge"].ToString()+"元";
            this.TextBox14.Text = dt.Rows[0]["daynum"].ToString();
            this.TextBox15.Text = dt.Rows[0]["chargesum"].ToString()+"元";
        
        
        }

        public void textTurnOn() {
           
            this.TextBox1.Enabled = true;
            this.TextBox2.Enabled = true;
            this.TextBox3.Enabled = true;
            this.TextBox4.Enabled = true;
            this.TextBox5.Enabled = true;
            this.TextBox6.Enabled = true;
            this.TextBox7.Enabled = true;
            this.TextBox8.Enabled = true;
            this.TextBox9.Enabled = true;
            this.TextBox10.Enabled = true;
            this.TextBox11.Enabled = true;
            this.TextBox12.Enabled = true;
            this.TextBox13.Enabled = true;
            this.TextBox14.Enabled = true;
            this.TextBox15.Enabled = true;
        }

        public void textTurnOff()
        {
            this.TextBox1.Enabled = false;
            this.TextBox2.Enabled = false;
            this.TextBox3.Enabled = false;
            this.TextBox4.Enabled = false;
            this.TextBox5.Enabled = false;
            this.TextBox6.Enabled = false;
            this.TextBox7.Enabled = false;
            this.TextBox8.Enabled = false;
            this.TextBox9.Enabled = false;
            this.TextBox10.Enabled = false;
            this.TextBox11.Enabled = false;
            this.TextBox12.Enabled = false;
            this.TextBox13.Enabled = false;
            this.TextBox14.Enabled = false;
            this.TextBox15.Enabled = false;
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            Response.Redirect("AddDays.aspx?roomid="+roomid);
        }

        protected void Button3_Click(object sender, EventArgs e) //退房操作
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            Response.Redirect("QuitHome.aspx?roomid="+roomid);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {

             ClientScript.RegisterStartupScript(this.GetType(), "打印", "window.print();", true);

     
        }

        protected void Button5_Click1(object sender, EventArgs e)
        {
            this.Button2.Visible = false;
            this.Button3.Visible = false;
            
        
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            Response.Redirect("Transform.aspx?roomid=" + roomid);
            
        }
    }
}