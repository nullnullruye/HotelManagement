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
    public partial class ChangeGuest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                bind();
            }
        }
        public void bind() {
            DataTable dt = BLL_Hotel.bind_GuestTname();
            this.DropDownList1.DataSource = dt;
            this.DropDownList1.DataValueField = "GTid";
            this.DropDownList1.DataTextField = "Tname";
            this.DropDownList1.DataBind();
            int idd=Convert.ToInt32(Request.QueryString["gid"]);
            DataTable dt1 = BLL_Hotel.Cha_Guestinfo(idd);
            this.TextBox1.Text = dt1.Rows[0]["gname"].ToString();
            this.TextBox3.Text = dt1.Rows[0]["mobile"].ToString();
            this.TextBox8.Text = dt1.Rows[0]["pid"].ToString();
            this.TextBox9.Text = dt1.Rows[0]["chargesum"].ToString();

            if (dt1.Rows[0]["sex"].ToString() == "女") {
                this.RadioButton2.Checked = true;
            }
            this.DropDownList1.SelectedValue = dt1.Rows[0]["gtid"].ToString();

        
        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = this.TextBox1.Text;
            string mobile = this.TextBox3.Text;
            string pid = this.TextBox8.Text;
            int chargesum = Convert.ToInt32(this.TextBox9.Text);
            int GTid = Convert.ToInt32(this.DropDownList1.SelectedValue);
            string sex = "男";
            if (this.RadioButton2.Checked == true) {
                sex = "女";           
            }
            int idd = Convert.ToInt32(Request.QueryString["gid"]);
            BLL_Hotel.ChangeGuestInfo(name,GTid,sex,mobile,chargesum,pid,idd);
            Response.Write("<script>alert('客户信息修改！');location.href='GuestMan.aspx';</script>");
        }
    }
}