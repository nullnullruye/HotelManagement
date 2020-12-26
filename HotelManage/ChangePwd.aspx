<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePwd.aspx.cs" Inherits="HotelManage.ChangePwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
body{text-align:center; overflow-y:hidden;overflow-X:hidden; font-family:微软雅黑}
.gd{font-size:14px; position:relative; top:10px;text-align: center;}
#bk{ border: solid 2px gray;border-radius:15px; width:1170px ; height:630px; position:relative;top:-7px; background-color:#EEEEEE}
#research{ height:350px; background-color:#C8F2D5; width:100%;border-radius:15px 15px 0px 0px; font-size:15px; color:#343434;-webkit-box-shadow:#666 0px 0px 10px;-moz-box-shadow:#666 0px 0px 10px}
.bt{ width:170px; height:22px}
.button{ border-style:none;background:#00AA68;  width:272px;  height:40px; position:relative;left:119px;cursor:pointer;font-size:20px; font-family:微软雅黑;top: 0px;}
.style1{text-align: left; position:relative; left:300px; font-size:22px}
 .style2{text-align: right;}
 .text{margin-left: 0px;Height:40px; width:272px; font-size:20px; font-family:微软雅黑; background-color:#e9fbee; color:Black; border-style:none; border:solid 2px #00aa68;}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="bk" class="style2">


    <div id="research">
        <br />
        <br />
        <br />
        <div class="style1">
            当前操作员：<asp:TextBox ID="TextBox1" runat="server" CssClass="text"></asp:TextBox>
        &nbsp;&nbsp;
            <br />
            <br />
            原&nbsp;&nbsp; 密&nbsp;&nbsp; 码：<asp:TextBox ID="TextBox2" runat="server" 
                CssClass="text" TextMode="Password"></asp:TextBox>
        <br /><br />
            新&nbsp;&nbsp; 密&nbsp;&nbsp; 码：<asp:TextBox ID="TextBox3" runat="server" CssClass="text"  TextMode="Password"></asp:TextBox>
        &nbsp;&nbsp;
            <br />
            <br />
            确认新密码：<asp:TextBox ID="TextBox4" runat="server" CssClass="text"  TextMode="Password"></asp:TextBox>
        <br /><br />
        &nbsp; <asp:Button ID="Button1" runat="server" 
                Text="提        交" CssClass="button" 
                onclick="Button1_Click"/>
        </div>
        <br />
        </div>
    
      

    
    </div>
    </form>
</body>
</html>
