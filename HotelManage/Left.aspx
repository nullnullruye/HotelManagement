<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Left.aspx.cs" Inherits="HotelManage.Left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
body{ margin:0px; padding:0px; overflow-y:hidden;}
.menu_list{ position:relative; top:-9px; left:-7px;}
#count{width:217px; height:170px;border-radius:15px; border: solid 2px gray; position:relative; top:-10px; left:5px} 
.tdbg{ background-color:#c3e6ce}
#table1{  font-family:微软雅黑; position:relative; left:8px}
table{border:solid 1px #747474}
tr{border:solid 1px #747474}
td{border:solid 1px #747474}
.quit{position:absolute;top:-5000px}
   </style>
    <link href="css/zzsc.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.min.js" type="text/javascript"></script>

</head>
<script type="text/javascript">
   
        function quit() {
            var myLink = document.getElementById("Button1");
            myLink.click();

        }
    
    
</script>

<script type="text/javascript">
    $(document).ready(function () {


        $("#firstpane .menu_body:eq(0)").show();
        $("#firstpane p.menu_head").click(function () {
            $(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
            $(this).siblings().removeClass("current");
        });
        $("#secondpane .menu_body:eq(0)").show();
        $("#secondpane p.menu_head").mouseover(function () {
            $(this).addClass("current").next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
            $(this).siblings().removeClass("current");
        });

    });
</script>

<body>
    <form id="form1" runat="server">
   
       

     <div id="firstpane" class="menu_list">
    <p class="menu_head current">常用菜单</p>
    <div style="display:block" class="menu_body" >
    <a href="LiveMark.aspx" target="right">登记查询</a>
    <a href="GuestInfo.aspx?roomid=0"  target="right">入住登记</a>
    <a href="GuestInfo.aspx?roomid=0" target="right">房间预定</a>
    <a href="ReserveMark.aspx" target="right">预定管理</a>
    <a href="Reports.aspx" target="right">统计报表</a>

    </div>
    <p class="menu_head">信息查询</p>
    <div style="display:none" class="menu_body" >
      <a href="LiveMark.aspx" target="right">入住信息</a>
      <a href="GuestInfo.aspx?roomid=0" target="right">顾客信息</a>
      <a href="ReserveMark.aspx" target="right">预约信息</a>
    </div>
    <p class="menu_head">客户管理</p>
    <div style="display:none" class=menu_body >
      <a href="GuestMan.aspx" target="right">客户信息</a>
      <a href="GuestReg.aspx"  target="right">新增顾客</a>
      <a href="GuestMan.aspx" target="right">删除客户</a>
      <a href="GuestMan.aspx" target="right">客户升级</a>
    </div>
    <p class="menu_head">入住管理</p>
    <div style="display:none" class=menu_body >
    <a href="LiveMark.aspx" target="right">登记查询</a>
    <a href="GuestInfo.aspx?roomid=0"  target="right">入住登记</a>
    <a href="GuestInfo.aspx?roomid=0" target="right">房间预定</a>
    <a href="ReserveMark.aspx" target="right">预定管理</a>

    </div>
    <p class="menu_head">后台设置</p>
    <div style="display:none" class=menu_body >
      <a href="ChangePwd.aspx" target="right">修改密码</a>
      <a href="#" onclick="quit()">退出系统</a>
      <a href="#" onclick="quit()">切换用户</a>     
      <a href="AboutProject.aspx" target="right">关于系统</a>
      <a href="AboutUs.aspx" target="right">关于我们</a>

    </div>
</div>

<div id="count" >
    <div style=" text-align:center" >
     <a href="reports.aspx" target="right"><img src="images/ooo.jpg"  style="border-radius:15px;"/></a>
 
    </div>
<table id="table1"   cellpadding="0" cellspacing="0" >
<tr>
  <td height="29" class="tdbg">今日收入：</td>
  <td  class="tdbg">
      <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
      元</td>
</tr>
<tr>
  <td height="29"  class="tdbg">本周收入：</td>
  <td  class="tdbg">
      <asp:Label ID="Label2" runat="server" Text="0"></asp:Label>
      元</td>
</tr>
<tr>
  <td height="29"  class="tdbg">本月收入：</td>
  <td  class="tdbg">
      <asp:Label ID="Label3" runat="server" Text="0"></asp:Label>
      元</td>
</tr>
<tr>
  <td width="94"  class="tdbg">历史收入：</td>
<td width="100"  class="tdbg" >
    <asp:Label ID="Label4" runat="server" Text="0"></asp:Label>
    元</td>
</tr>
</table>


    <asp:Button ID="Button1" runat="server" Text="Button"  CssClass="quit" 
        onclick="Button1_Click"/>
</div>
   
     <br />


   
    </form>
</body>
</html>
