﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LiveMark.aspx.cs" Inherits="HotelManage.LiveMark" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
body{text-align:center; overflow-y:hidden;overflow-X:hidden;}
.gd{font-size:14px; position:relative; top:10px;text-align: center;}
.button1{border-style: none;border-color: inherit;border-width: 0px;background: #00AA68;border-radius:5px; width:90px; height:29px; font-family:微软雅黑; color:White; font-size:18px;cursor:pointer;  }
#bk{ border: solid 2px gray;border-radius:15px; width:1170px ; height:630px; position:relative;top:-7px; background-color:#EEEEEE}
#research{ height:200px; background-color:#C8F2D5; width:100%;border-radius:15px 15px 0px 0px; font-size:15px; color:#343434;-webkit-box-shadow:#666 0px 0px 10px;-moz-box-shadow:#666 0px 0px 10px}
.bt{ width:170px; height:22px}
.button{ border-style: none;border-color: inherit;border-width: 0px;background: #00AA68;border-radius:5px;; width:90px; height:29px; font-family:微软雅黑; color:White; font-size:18px;cursor:pointer;  }
.style1{text-align: left; position:relative; left:300px}
.style2{text-align: right;}
.button1{border-style: none;border-color: inherit;border-width: 0px;background: #00AA68;border-radius:5px; width:60px; height:25px; font-family:微软雅黑; color:White; font-size:16px;cursor:pointer;  }
.tcdPageCode{text-align:left;color: #ccc; position:relative; top:19px; left:65px;  width:500px; }
.tcdPageCode a{display: inline-block;color: #00aa68;display: inline-block;height: 25px;	line-height: 25px;	padding: 0 10px;border: 1px solid #00aa68;	margin: 0 2px;border-radius: 4px;vertical-align: middle;}
.tcdPageCode a:hover{text-decoration: none;border: 1px solid #00aa68;}
.tcdPageCode span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #00aa68;	border: 1px solid #00aa68;border-radius: 4px;vertical-align: middle;}
.tcdPageCode span.disabled{	display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;	color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}
.hidden{position:relative;top:-5000px}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="bk" class="style2">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <div id="research">
        <br />
        <br />
        <br />
        <div class="style1">
        顾客编号：<asp:TextBox ID="TextBox1" runat="server" CssClass="bt"></asp:TextBox>
        &nbsp;&nbsp;
        房间编号：<asp:TextBox ID="TextBox2" runat="server" CssClass="bt"></asp:TextBox>
        <br /><br />
        顾客姓名：<asp:TextBox ID="TextBox3" runat="server" CssClass="bt"></asp:TextBox>
        &nbsp;&nbsp;
        身份证号：<asp:TextBox ID="TextBox4" runat="server" CssClass="bt"></asp:TextBox>
        <br /><br />
        手机号码：<asp:TextBox ID="TextBox5" runat="server" CssClass="bt"></asp:TextBox>
        &nbsp;&nbsp; 
        入住时间：<asp:TextBox ID="TextBox6" runat="server" CssClass="bt"></asp:TextBox>
        &nbsp;<asp:Button ID="Button1" runat="server" Text="查询" CssClass="button" 
                onclick="Button1_Click"/><asp:Button ID="Button4" runat="server" 
                 Text="Button" onclick="Button4_Click" CssClass="hidden" />
        </div>
        <br />
        </div>

       
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             Width="1038px" DataKeyNames="REid" align="center" AllowSorting="True"  hearshow="True"
            EmptyDataText="暂无数据" CssClass="gd" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onrowdatabound="GridView1_RowDataBound" onrowcommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="reid" HeaderText="记录编号" />
                <asp:BoundField DataField="gid" HeaderText="顾客编号" />
                <asp:BoundField DataField="Gname" HeaderText="顾客姓名" />
                <asp:BoundField DataField="mobile" HeaderText="联系电话" />
                <asp:BoundField DataField="number" HeaderText="房间编号" />
                <asp:BoundField DataField="intime" HeaderText="入住时间" />
                <asp:BoundField DataField="outtime" HeaderText="预计离开时间" />
                
                <asp:BoundField DataField="facttime" HeaderText="实际离开时间" />
                
                <asp:BoundField DataField="daynum" HeaderText="入住天数" />
                
                <asp:BoundField DataField="charge" HeaderText="缴付押金" />
                <asp:TemplateField HeaderText="修改记录" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="更新"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                         <asp:Button ID="Button3" runat="server" Text="详情" CommandName="xq" CommandArgument='<%#Eval("roomid")%>' CssClass="button1" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="删除记录" ShowHeader="False">
                    <ItemTemplate>
                         <a onclick="JavaScript:return confirm('确定删除吗？')"><asp:Button ID="Button2" runat="server" Text="删除" CommandName="sc" CommandArgument='<%#Eval("reid")%>' CssClass="button1"/></a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#343434" />
            <HeaderStyle BackColor="#C4DCF8" Font-Bold="True" ForeColor="#343434" />
            <PagerStyle BackColor="White" ForeColor="#343434" HorizontalAlign="Left" />
            <RowStyle ForeColor="#343434" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="#343434" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    
       </ContentTemplate></asp:UpdatePanel>
         <div style=" float:left">
          <div class="tcdPageCode">

              </div>   <asp:TextBox ID="TextBox7" runat="server"  CssClass="hidden"></asp:TextBox>
          <asp:Label
              ID="Label1" runat="server"></asp:Label></div>
    
    </div>
    </form>
</body>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery.page.js" type="text/javascript"></script>
<script type="text/jscript">

     $(".tcdPageCode").createPage(
     { 
        pageCount:<%=ye()%>,
        current:1,
        backFn:function(p){ 
        document.getElementById("<%=TextBox7.ClientID %>").value=p;
        var myLink = document.getElementById("Button4");
        myLink.click();
         
        }
    }
    );

</script>
</html>
