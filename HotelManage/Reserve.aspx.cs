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
    public partial class Reserve : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                bind();
                TextBox8.Attributes.Add("onclick", "laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'});aa()");

            }

        }
        public void bind()
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);


            int gid = Convert.ToInt32(Request.QueryString["gid"]);
            DataTable dt2 = BLL_Hotel.Cha_Guestinfo(gid);
            this.TextBox1.Text = dt2.Rows[0]["Gid"].ToString();
            this.TextBox2.Text = dt2.Rows[0]["gname"].ToString();
            this.TextBox3.Text = dt2.Rows[0]["mobile"].ToString();
            this.TextBox5.Text = dt2.Rows[0]["Tname"].ToString();
            this.TextBox8.Text = DateTime.Now.ToString();



            DataTable dt = BLL_Hotel.bind_roomtype();
            this.DropDownList1.DataSource = dt;
            this.DropDownList1.DataTextField = "rtname";
            this.DropDownList1.DataValueField = "rtid";
            this.DropDownList1.DataBind();


            DataTable dt1 = BLL_Hotel.bind_roominfo(1);
            this.DropDownList2.DataSource = dt1;
            this.DropDownList2.DataTextField = "number";
            this.DropDownList2.DataValueField = "roomid";
            this.DropDownList2.DataBind();

            if (roomid != 0) //如果是直接通过欢迎页面已选好房间时，登记时自动选择相应的房间
            {

                DataTable dt3 = BLL_Hotel.Cha_One(roomid);
                this.DropDownList1.SelectedValue = dt3.Rows[0]["rtid"].ToString();

                DataTable dt4 = BLL_Hotel.bind_roominfo(Convert.ToInt32(dt3.Rows[0]["rtid"]));
                this.DropDownList2.DataSource = dt4;
                this.DropDownList2.DataTextField = "number";
                this.DropDownList2.DataValueField = "roomid";
                this.DropDownList2.DataBind();
                this.DropDownList2.SelectedValue = roomid.ToString();

            }

        }



        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            dpbind();
            price();



        }

        public void price()
        { //根据天数计算押金金额
            if (this.TextBox9.Text != "")
            {
                int day = Convert.ToInt32(this.TextBox9.Text);
                int Roomid = Convert.ToInt32(this.DropDownList2.SelectedValue);
                DataTable dt = BLL_Hotel.Cha_One(Roomid);//查询该房间每日金额以计算押金
                int DP = Convert.ToInt32(dt.Rows[0]["rtprice"]);
                this.TextBox6.Text = ((day + 1) * DP).ToString();

                DateTime inttime = Convert.ToDateTime(this.TextBox8.Text);
                this.TextBox4.Text = inttime.AddDays(+day).ToString();

            }
        }

        public void dpbind() //改变房间类型时自动选择相应的房间类型
        {
            int idd = Convert.ToInt32(this.DropDownList1.SelectedValue);
            DataTable dt1 = BLL_Hotel.bind_roominfo(idd);
            this.DropDownList2.DataSource = dt1;
            this.DropDownList2.DataTextField = "number";
            this.DropDownList2.DataValueField = "roomid";
            this.DropDownList2.DataBind();

        }

        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {

            price();
            if (RadioButton1.Checked == true)
            {
                this.TextBox11.Text = this.TextBox6.Text;
            }
            else
            {
                this.TextBox11.Text = "0";
            }


        }
        //添加入住信息
        protected void Button1_Click(object sender, EventArgs e)
        {
            

                int gid = Convert.ToInt32(this.TextBox1.Text);
                int roomid = Convert.ToInt32(this.DropDownList2.SelectedValue);
                int day = Convert.ToInt32(this.TextBox9.Text);
                DateTime intime = Convert.ToDateTime(this.TextBox8.Text);
                DateTime outtime = Convert.ToDateTime(this.TextBox4.Text);
                double charge = Convert.ToInt32(this.TextBox6.Text);
                double actcharge = Convert.ToInt32(this.TextBox11.Text);

                BLL_Hotel.Add_Reserve(gid, roomid, intime, outtime, day,charge,actcharge);
                BLL_Hotel.Gai_roomstate(roomid, 1);
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('预定登记成功！');location.href='ReserveDetail.aspx?roomid=" + roomid + "'", true);


           
        }

        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {
            price();
            if (RadioButton1.Checked == true)
            {
                this.TextBox11.Text = this.TextBox6.Text;
            }
            else
            {
                this.TextBox11.Text = "0";
            }
          
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            this.TextBox11.Text = this.TextBox6.Text;
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            this.TextBox11.Text = "0";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            price();
            if (RadioButton1.Checked == true)
            {
                this.TextBox11.Text = this.TextBox6.Text;
            }
            else
            {
                this.TextBox11.Text = "0";
            }

        }








    }
}