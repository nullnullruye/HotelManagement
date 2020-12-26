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
    public partial class ReserveDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bind();
        }

        public void bind()
        {


            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            DataTable dt = BLL_Hotel.Cha_OneReserve(roomid);
            this.TextBox1.Text = dt.Rows[0]["gid"].ToString();
            this.TextBox2.Text = dt.Rows[0]["gname"].ToString();
            this.TextBox3.Text = dt.Rows[0]["mobile"].ToString();
            this.TextBox4.Text = dt.Rows[0]["Rtname"].ToString();
            this.TextBox5.Text = dt.Rows[0]["tname"].ToString();
            this.TextBox6.Text = dt.Rows[0]["number"].ToString();
            this.TextBox7.Text = dt.Rows[0]["mark"].ToString();
            this.TextBox8.Text = dt.Rows[0]["intime"].ToString();
            this.TextBox9.Text = dt.Rows[0]["charge"].ToString();
            if (dt.Rows[0]["actcharge"].ToString() == "0")
            {
                this.TextBox10.Text = "您预订时选择的是【无担保预订】，正式入驻需缴纳押金" + dt.Rows[0]["charge"] + "元。";
            }
            else {
                this.TextBox10.Text = "您预订时选择的是【担保预订】，正式入驻无需缴纳押金,取消预订需退押金还"+dt.Rows[0]["actcharge"]+"元。";
            }


        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            DataTable dt = BLL_Hotel.Cha_OneReserve(roomid);
            int gid=Convert.ToInt32(dt.Rows[0]["gid"]);
            DateTime intime = Convert.ToDateTime(dt.Rows[0]["intime"]);
            DateTime outtime = Convert.ToDateTime(dt.Rows[0]["outtime"]);
            int day = Convert.ToInt32(dt.Rows[0]["daynum"]);
            double charge = Convert.ToDouble(dt.Rows[0]["charge"]);
            BLL_Hotel.Add_Record(gid, roomid, intime, outtime, day,charge);//将预约信息表的记录转到入住信息表中
            BLL_Hotel.Qu_Reserve(roomid, "已转正入住"); //更换房间信息
            BLL_Hotel.Gai_roomstate(roomid, 2); //修改房间状态为已入住
            Response.Write("<script>alert('房间转正成功！');location.href='RoomDetail.aspx?roomid='+"+roomid+"</script>");


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
           BLL_Hotel.Qu_Reserve(roomid,"已取消离开"); //更换房间信息
           BLL_Hotel.Gai_roomstate(roomid, 3); //房间状态更新为空房
           Response.Write("<script>alert('预约已取消！');location.href='right.aspx'</script>");


        }
    }
}