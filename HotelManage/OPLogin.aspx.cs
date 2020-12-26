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
    public partial class OPLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string opname = this.TextBox1.Text;
            string oppwd = this.TextBox2.Text;
            DataTable dt= BLL_Hotel.OP_login(opname,oppwd);
            if (dt.Rows.Count > 0)
            {   Session["opname"] = dt.Rows[0]["oname"].ToString();
                Session["pwd"] = dt.Rows[0]["pwd"].ToString();
                Response.Redirect("index.aspx");
               
            }
            else {
                this.Label1.Text ="帐号或密码错误！";
            
            }
           
        }

    }
}