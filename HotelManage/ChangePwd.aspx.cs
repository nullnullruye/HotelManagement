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
    public partial class ChangePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.TextBox1.Enabled = false;
             this.TextBox1.Text= Session["opname"].ToString();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (this.TextBox3.Text != this.TextBox4.Text) {              
                Page.ClientScript.RegisterStartupScript(this.GetType(),"","alert('两次密码输入不一致！');",true);       
            }
            else if(this.TextBox2.Text!=Session["pwd"].ToString()){
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('管理员原始密码错误！');", true);   
            }
            else if (this.TextBox2.Text == "" || this.TextBox3.Text == "" || this.TextBox4.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('密码不能为空！');", true);

            }

            else {
                string name = Session["opname"].ToString();
                string pwd = this.TextBox4.Text;
                BLL_Hotel.Gai_OPPwd(name,pwd);
                Session.Clear();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('密码修改成功，请重新登录。');window.top.location.href='OPlogin.aspx';", true);
                
            
            }
        }
    }
}