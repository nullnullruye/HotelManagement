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
    public partial class AddDays : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        public void bind()
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            DataTable dt = BLL_Hotel.Cha_OneRecord(roomid);
            this.TextBox1.Text = dt.Rows[0]["Gid"].ToString();
            this.TextBox2.Text = dt.Rows[0]["gname"].ToString();
            this.TextBox3.Text = dt.Rows[0]["mobile"].ToString();
            this.TextBox5.Text = dt.Rows[0]["Tname"].ToString();
            this.TextBox8.Text = dt.Rows[0]["intime"].ToString();
            this.TextBox4.Text = dt.Rows[0]["outtime"].ToString();
            this.TextBox10.Text = dt.Rows[0]["rtname"].ToString();
            this.TextBox11.Text = dt.Rows[0]["number"].ToString();

        }




        public void price()
        { //根据天数计算押金金额
            if (this.TextBox9.Text != "")
            {
                int day = Convert.ToInt32(this.TextBox9.Text);
                int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
                DataTable dt = BLL_Hotel.Cha_One(roomid);//查询该房间每日金额以计算押金
                int DP = Convert.ToInt32(dt.Rows[0]["rtprice"]);
                this.TextBox6.Text = ((day) * DP).ToString();

                DateTime outtime = Convert.ToDateTime(this.TextBox4.Text);
                this.TextBox4.Text = outtime.AddDays(+day).ToString();

            }
        }



        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {
            price();


        }
        //添加入住信息
        protected void Button1_Click(object sender, EventArgs e)
        {
            
                int gid = Convert.ToInt32(this.TextBox1.Text);
                int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
                int day = Convert.ToInt32(this.TextBox9.Text);
                DateTime intime = Convert.ToDateTime(this.TextBox8.Text);
                DateTime outtime = Convert.ToDateTime(this.TextBox4.Text);
                int charge = Convert.ToInt32(this.TextBox6.Text);
                BLL_Hotel.Gai_AddDay(intime, outtime, day, charge, roomid);
                //Response.Write("<script>alert('房间续费成功！');location.href='Roomdetail.aspx?roomid=" + roomid + "';</script>");
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('房间续费成功');location.href='Roomdetail.aspx?roomid=" + roomid + "'", true);
           
       

        }

        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {
            price();
        }


    }
}