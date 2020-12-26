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
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["opname"] == null || Session["opname"].ToString() == "")
            {
                Response.Write("<script>alert('对不起，您还未登录');location.href='OPlogin.aspx';</script>");

            }

          
            if (Request.QueryString["sd"] != null) {
                ClientScript.RegisterStartupScript(this.GetType(), "sd", "ShowDiv('MyDiv','fade');", true);
            }



         
            
          

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            
            Response.Redirect("OPLogin.aspx");

            
        }


       


    }
}