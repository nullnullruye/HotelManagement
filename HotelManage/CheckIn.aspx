<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckIn.aspx.cs" Inherits="HotelManage.CheckIn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<base target=_self /></base>
<title></title>
    <script src="laydate/laydate.js" type="text/javascript"></script>
<script type="text/jscript">
   function aa(){
   
   
   }
   
   
    !function ()
     {
        laydate.skin('molv'); //切换皮肤，请查看skins下面皮肤库
        laydate({ elem: '#demo' }); //绑定元素
        
    } ();
    //日期范围限制

    
    var start = {
        elem: '#start',
        format: 'YYYY-MM-DD',
        min: laydate.now(), //设定最小日期为当前日期
        max: '2099-06-16', //最大日期
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };
    var end = {
        elem: '#end',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16',
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas; //结束日选好后，充值开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);
    
    //自定义日期格式
    laydate({
        elem: '#test1',
        format: 'YYYY年MM月DD日',
        festival: true, //显示节日
        choose: function (datas) { //选择日期完毕的回调
            alert('得到：' + datas);
        }
    });
    //日期范围限定在昨天到明天
    laydate({
        elem: '#hello3',
        min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
        max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
    });
</script>

<style type="text/css">
table{border:solid 1px #747474}
tr{border:solid 1px #747474}
td{border:solid 1px #747474}
#table{ font-size:16px; font-family:微软雅黑; position:relative; top:50px; left:201px;border-radius:15px 15px 0px 0px;}
.tdstyle{ background-color:#c3e6ce}
.text{margin-left: 0px;Height:40px; width:272px; border:0px; font-size:20px; font-family:微软雅黑; background-color:#e9fbee; color:Black; border-style:none}
.buttom{ background:#00AA68;  width:100px;  height:30px; cursor:pointer;font-size:20px; font-family:微软雅黑; border:1px solid #CCCCCC;border-radius:8px;}
body{text-align:center; overflow-y:hidden;overflow-X:hidden;}
.gd{font-size:14px; position:relative; top:10px;text-align: center;}
#bk{ border: solid 2px gray;border-radius:15px; width:1170px ; height:630px; position:relative;top:-7px; background-color:#EEEEEE}
#research{ height:300px; background-color:#C8F2D5; width:100%;border-radius:15px 15px 0px 0px; font-size:15px; color:#343434;-webkit-box-shadow:#666 0px 0px 10px;-moz-box-shadow:#666 0px 0px 10px}
.error{ color:Red; font-size:18px; position:relative; right:200px;  font-family:微软雅黑}
.text1{margin-left: 0px;Height:40px; width:272px; border:0px; font-size:20px; font-family:微软雅黑; background-color:#e9fbee; color:Black; border-style:none; background-image:url("images/checkdate.png"); background-repeat:no-repeat; background-position:234px 5px }

</style>

</head>
<body style="text-align: center">
    <form id="form1" runat="server">

    <div id="bk" class="style2">




<div id="research">
    <div id="table">
    

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
               




      <table  cellpadding="0" cellspacing="0" width="765">

      <tr>
  <td   class="tdstyle" colspan="4" height="52"><span style=" font-size:24px;">用户入住信息登记表</span></td>

</tr>

<tr>
  <td class="tdstyle"  width="115" >顾客编号：</td>
  <td width="270" >
      <asp:TextBox ID="TextBox1" runat="server" CssClass="text" Enabled="False" ></asp:TextBox>
    </td>
  <td width="115"  class="tdstyle">顾客姓名：</td>
  <td width="270" height="40">
      <asp:TextBox ID="TextBox2" runat="server" CssClass="text" Enabled="False"></asp:TextBox>
    </td>
</tr>
<tr>
  <td  class="tdstyle">联系方式：</td>
  <td class="style3">
      <asp:TextBox ID="TextBox3" runat="server" CssClass="text" Enabled="False"></asp:TextBox>
    </td>
  <td  class="tdstyle">房间类型：</td>
  <td height="37">
      <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="text" 
          onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
          AutoPostBack="True">
      </asp:DropDownList>
    </td>
</tr>
<tr>
  <td  class="tdstyle">顾客等级：</td>
  <td class="style3">
      <asp:TextBox ID="TextBox5" runat="server" CssClass="text" Enabled="False" ></asp:TextBox>
    </td>
  <td  class="tdstyle">房间编号：</td>
  <td height="37">
      <asp:DropDownList ID="DropDownList2" runat="server"  CssClass="text">
      </asp:DropDownList>
    </td>
</tr>
<tr>
  <td   class="tdstyle">入住时间：</td>
  <td>

    
      <asp:TextBox ID="TextBox8" runat="server" CssClass="text1" AutoPostBack="True" 
          ontextchanged="TextBox8_TextChanged" ></asp:TextBox>
    </td>
  <td   class="tdstyle">入住天数：</td>
  <td height="37">
      <asp:TextBox ID="TextBox9" runat="server" CssClass="text" AutoPostBack="True" 
          ontextchanged="TextBox9_TextChanged"  placeholder="请输入天数" ></asp:TextBox>
    </td>
</tr>

<tr>
  <td   class="tdstyle">到期时间：</td>
  <td>
      <asp:TextBox ID="TextBox4" runat="server" CssClass="text" AutoPostBack="True"></asp:TextBox>
    </td>
  <td   class="tdstyle">交付押金：</td>
  <td height="37">
      <asp:TextBox ID="TextBox6" runat="server" CssClass="text"></asp:TextBox>
    </td>
</tr>


<tr>
  <td width="93" style="height:101px;"  class="tdstyle">备注信息：</td>
  <td colspan="3"  >
      <asp:TextBox ID="TextBox7" runat="server" Width="660" Height="101" 
          TextMode="MultiLine" Font-Names="微软雅黑" Font-Size="16pt" BackColor="#e9fbee" >暂无备注</asp:TextBox>
    </td>
  </tr>
  <tr>
  <td colspan="4" style="height:40px"   class="tdstyle">
      <asp:Button ID="Button1" runat="server" Text="提交" CssClass="buttom" 
          onclick="Button1_Click" />
      &nbsp;
 <input type="button" onclick="javascript:window.history.go(-1);"value="取消" class="buttom">
      </td>


</tr>
</table>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>


</div>

    </div>
   
    </form>
</body>
</html>
