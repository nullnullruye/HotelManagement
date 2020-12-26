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
    public partial class GuestReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bind();
        }
        public void bind() {
            DataTable dt = BLL_Hotel.bind_GuestTname();
            this.DropDownList1.DataSource = dt;
            this.DropDownList1.DataValueField = "GTid";
            this.DropDownList1.DataTextField = "Tname";
            this.DropDownList1.DataBind();

        
        
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

            BLL_Hotel.Add_GuestInfo(name,GTid,sex,mobile,chargesum,pid);
            Response.Write("<script>alert('客户信息添加成功！');location.href='Guestinfo.aspx';</script>");
        }
    }
}