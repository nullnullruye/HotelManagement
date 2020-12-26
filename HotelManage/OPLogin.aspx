<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OPLogin.aspx.cs" Inherits="HotelManage.OPLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

<style type="text/css">
body{ margin:0px; padding:0px; background-image:url("images/opbg1.jpg"); background-size:100% 900px;}
#login{ height:305px; width:466px;  margin:auto; margin-top:250px; background-image:url("images/hehe_副本.jpg"); border-radius:8px; }
.username{ border: solid 2px  rgba(0,0,0,0.2); background: rgba(0,0,0,0); height:33px; width:240px; position:relative; top:80px;left:110px; text-align:center}
.userpwd{ border: solid 2px  rgba(0,0,0,0.2); background: rgba(0,0,0,0); height:33px; width:240px;  position:relative; top:100px;left:110px; text-align:center}
.error{position:relative; top:170px;right:120px; font-family:微软雅黑}
.loginbuttom{ border-style:none; background:#00AA68;  width:245px;  height:40px; position:relative; top:120px;left:111px; cursor:pointer;font-size:20px; font-family:微软雅黑}
</style>
</head>

<body>
    <form id="form1" runat="server">
    <div>
    <div id="login">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
               
        <asp:TextBox ID="TextBox1" runat="server" class="username" Font-Size="18pt" 
            ForeColor="#00AA68"   placeholder="请输入帐号" > </asp:TextBox> <br/>
        <asp:TextBox ID="TextBox2" runat="server" class="userpwd" Font-Size="18pt" 
            ForeColor="#00AA68" TextMode="Password"   placeholder="请输入密码" ></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="登      录" class="loginbuttom" 
            Font-Bold="False" ForeColor="White" onclick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text="" class="error" 
            CssClass="error" Font-Bold="False" Font-Size="18pt" ForeColor="Red"></asp:Label>

           </ContentTemplate> </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>
