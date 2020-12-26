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
    public partial class Left : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bind();

        }


        public void bind() {
           DataTable day= BLL_Hotel.Cha_Charge(0);
           DataTable week = BLL_Hotel.Cha_Charge(7);
           DataTable month = BLL_Hotel.Cha_Charge(31);
           DataTable history = BLL_Hotel.Cha_Charge(100000000);
           if (day.Rows[0][0].ToString() != "")
           {
               this.Label1.Text = day.Rows[0][0].ToString();
           }
           this.Label2.Text = week.Rows[0][0].ToString();
           this.Label3.Text = month.Rows[0][0].ToString();
           this.Label4.Text = history.Rows[0][0].ToString();
         

        
        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Write("<script>window.top.location.href='OPlogin.aspx';</script>");
        }



      
    }
}