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
    public partial class Top : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bind();
        }

            public void bind() {

             
            this.Label1.Text = Session["opname"].ToString();
        
        
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Write("<script>window.top.location.href='OPlogin.aspx';</script>");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.top.location.href='index.aspx?sd=1';</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            Response.Write("<script>window.location.href='ChangePwd.aspx';target='right'</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Write("<script>window.top.location.href='OPlogin.aspx';</script>");
        }
    }
}