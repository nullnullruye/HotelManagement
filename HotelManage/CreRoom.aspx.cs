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
    public partial class CreRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        public void bind() {
            this.DropDownList1.DataSource = BLL_Hotel.Bind_LouCeng();
            this.DropDownList1.DataTextField = "Fname";
            this.DropDownList1.DataValueField = "Fid";
            this.DropDownList1.DataBind();
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            DataTable dt = BLL_Hotel.Cha_One(roomid);
            this.TextBox4.Text = dt.Rows[0]["RTname"].ToString();
            this.TextBox1.Text = roomid.ToString();
            this.TextBox1.Enabled = false;
            this.TextBox4.Enabled = false;

        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int rommid = Convert.ToInt32(this.TextBox1.Text);
            string mark = this.TextBox7.Text;
            int louceng = Convert.ToInt32(this.DropDownList1.SelectedValue);
            string name = this.TextBox2.Text;
            BLL_Hotel.Add_Room(name, louceng, mark, rommid);
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('房间新增成功');location.href='Right.aspx'", true);

        }
    }
}