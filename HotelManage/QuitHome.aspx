<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuitHome.aspx.cs" Inherits="HotelManage.QuitHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title></title>
<script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready
       (

         function () {
             var divcss = { background: 'white', height: '630px' };
             var txtcss = { background: 'transparent' };
             var bt = { display: 'none' };
           
             $("#Button6").bind("click", function () {
                 $("#research").css(divcss);
                 $(".text").css(txtcss);
                 $("#TextBox7").css(txtcss);
                 $("td").css(txtcss);
                 $(".buttom").css(bt);
                 window.print();


             });






         }
       );

</script>





<style type="text/css">
table{border:solid 1px #747474}
tr{border:solid 1px #747474}
td{border:solid 1px #747474}
#table{ font-size:16px; font-family:微软雅黑; position:relative; top:50px; left:201px;border-radius:15px 15px 0px 0px;}
.tdstyle{ background-color:#c3e6ce}
.text{margin-left: 0px;Height:40px; width:272px; border:0px; font-size:20px; font-family:微软雅黑; background-color:#e9fbee}
.buttom{ background:#00AA68;  width:100px;  height:30px; cursor:pointer;font-size:20px; font-family:微软雅黑; border:1px solid #CCCCCC;border-radius:8px;}
body{text-align:center; overflow-y:hidden;overflow-X:hidden;}
.gd{font-size:14px; position:relative; top:10px;text-align: center;}
#bk{ border: solid 2px gray;border-radius:15px; width:1170px ; height:630px; position:relative;top:-7px; background-color:#EEEEEE}
#research{ height:290px; background-color:#C8F2D5; width:100%;border-radius:15px 15px 0px 0px; font-size:15px; color:#343434;-webkit-box-shadow:#666 0px 0px 10px;-moz-box-shadow:#666 0px 0px 10px}

    .style1
    {
        background-color: #c3e6ce;
        width: 150px;
    }
    .style2
    {
        background-color: #c3e6ce;
        height: 101px;
        width: 150px;
    }

</style>

</head>
<body style="text-align: center">
    <form id="form1" runat="server">

    <div id="bk" class="style2">

    <!-- $("#Button1").bind("click", function () { window.top.location = "index.aspx"; alert('退房成功！房间状态已更新为打扫状态，请尽快打扫。'); });-->


<div id="research">
    <div id="table">
    
      <table  cellpadding="0" cellspacing="0" width="805">

                  <tr>
  <td   class="tdstyle" colspan="4" height="52"><span style=" font-size:24px;">用户退房结算详情表
  
      <input id="Button6" type="button" value="预览并打印" class="buttom" style=" width:120px"/>
  
  </span></td>

  

</tr>


<tr>
  <td class="style1" >顾客编号：</td>
  <td width="270" >
      <asp:TextBox ID="TextBox1" runat="server" CssClass="text" ></asp:TextBox>
    </td>
  <td width="130"  class="tdstyle">顾客姓名：</td>
  <td width="270" height="40">
      <asp:TextBox ID="TextBox2" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td  class="style1">顾客等级：</td>
  <td class="style3">
      <asp:TextBox ID="TextBox3" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td  class="tdstyle">房间类型：</td>
  <td height="37">
      <asp:TextBox ID="TextBox4" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td  class="style1">顾客折扣：</td>
  <td class="style3">
      <asp:TextBox ID="TextBox5" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td  class="tdstyle">房间编号：</td>
  <td height="37">
      <asp:TextBox ID="TextBox6" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td   class="style1">交付押金：</td>
  <td>
      <asp:TextBox ID="TextBox8" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td   class="tdstyle">入住时间：</td>
  <td height="37">
      <asp:TextBox ID="TextBox9" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td   class="style1">结算金额：</td>
  <td>
      <asp:TextBox ID="TextBox10" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td   class="tdstyle">登记离开时间：</td>
  <td height="37">
      <asp:TextBox ID="TextBox11" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>
<tr>
  <td   class="style1">实际入住天数：</td>
  <td>
      <asp:TextBox ID="TextBox12" runat="server" CssClass="text"></asp:TextBox>
    </td>
  <td   class="tdstyle">实际离开时间：</td>
  <td height="37">
      <asp:TextBox ID="TextBox13" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>


<tr>
  <td  class="style2">退房说明：</td>
  <td colspan="3"  >
      <asp:TextBox ID="TextBox7" runat="server" Width="680" Height="101" 
          TextMode="MultiLine" Font-Names="微软雅黑" Font-Size="16pt" 
          BackColor="#e9fbee" style="margin-left: 0px" ></asp:TextBox>
    </td>
  </tr>
  <tr>
  <td colspan="4" style="height:40px"   class="tdstyle">
     <asp:Button ID="Button1" runat="server" Text="确认退房" CssClass="buttom" 
          onclick="Button1_Click" />
      &nbsp;
      <asp:Button ID="Button2" runat="server" CssClass="buttom" Text="取消" />
      </td>


</tr>
</table>
    </div>


</div>

    </div>
   
    </form>
</body>
</html>
