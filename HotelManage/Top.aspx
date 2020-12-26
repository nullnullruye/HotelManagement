<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Top.aspx.cs" Inherits="HotelManage.Top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    	<script type = "text/javascript" src = "js/jquery.min.js"></script>
	<script type = "text/javascript" src = "js/navigation.js"></script>
	<script type = "text/javascript" src = "js/navigationT.js"></script>
	<link rel = "stylesheet" type = "text/css" href = "css/navigation.css">
	<link rel = "stylesheet" type = "text/css" href = "css/navigationT.css">
	<link rel = "stylesheet" type = "text/css" href = "css/style.css">
    <script type="text/javascript">


        function aa() {

            parent.right.location.href = "ChangePwd.aspx";

        }

        function quit() {
            var myLink = document.getElementById("Button1");
            myLink.click();
        
        }
    
    </script>

<style type="text/css">
    
 body{ margin:0px; padding:0px; overflow-y:hidden;overflow-X:hidden;}
 #admininfo{height:134px; width:250px}
 .touxiang{ width:80px; height:80px ; border: white 2px solid ;border-radius:100px;}
 #adminmenu{ position:relative;left:100px; bottom:150px;width: 409px;}
.style1{ text-align: center; }
.admin1{ font-size:18px; font-family:微软雅黑; color:White;}
.admin11{ position:relative; bottom:7px; font-size:18px; font-family:微软雅黑; color:White;}
#touxiang{ width:100px; height:125px; position:relative; top:10px; left:10px}
.button{border-radius:7px; border:white solid  2px; width:50px; height:26px; background-color:#00AA68; font-size:16px; font-family:微软雅黑; color:White;cursor:pointer; }
.button1{border-radius:7px; border:white solid  0px; width:50px; height:26px; background-color:#00AA68; font-size:16px; font-family:微软雅黑; color:White;cursor:pointer; position:relative; top:20px; background-color:transparent}
#jclogo{ position: relative;left:20px;top:8px}
#home{  position: absolute;left:500px;top:25px;  height:110px; width:700px;}
.metro_na a{border-radius:15px; border: solid 0px white}
ul{ position:relative; top:-10px;}
img{cursor:pointer;}
span{ font-family:微软雅黑; color:white}
#btt{ position:absolute; top:120px; left:80px}

</style>
</head>
<body>
    <form id="form1" runat="server">
    <div style=" background-image:url(images/topbg.png); background-repeat:no-repeat; background-size:100% 100% ;-webkit-box-shadow:#666 0px 0px 10px;-moz-box-shadow:#666 0px 0px 10px">
    <div id="admininfo">
    <div id="touxiang" class="style1">
    <img alt="" src="images/admin1.jpg" class="touxiang" /><br/>
    <span style=" font-family:微软雅黑; font-size:15px; color:white">当前用户</span>
    <asp:Label ID="Label1" runat="server" CssClass="admin11"></asp:Label>
    </div>

    <div id="adminmenu" class="style1">
    <span class="admin1">后台管理</span><br/><br/>
  
       <div id="btt">
      &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="注销" CssClass="button" 
            onclick="Button1_Click"/>

        &nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="切换" CssClass="button" 
            onclick="Button2_Click" />
        &nbsp;&nbsp;
        <%--<asp:Button ID="Button3" runat="server" Text="改密" CssClass="button"  />--%>
        <input id="Button5" type="button" value="改密"onclick="aa()" class="button" />
        &nbsp;&nbsp;
        <input id="Button3" type="button" value="" class="button1" />
      <%--  <asp:Button ID="Button4" runat="server"  CssClass="button1"  
            onclick="Button4_Click" />
       --%>
       </div><img src="images/JClogo.bmp"id="jclogo" />

 <div id="home">
 

	<div class= "metro_na">
		<div class= "nav_title"><span style=" font-family:微软雅黑;color:white">快捷导航</span></div>
		
		<ul style=" position:relative; top:-10px">
			<li>
				<a href = "right.aspx" target="right"><img src = "images/icon_home.png"/><span>欢迎页面</span></a>
			</li>
		

		
			<li>
				<a href = "#"><img src = "images/ruzhuguanli.png"/><span style=" font-family:微软雅黑;color:white">入住管理</span></a>
				<ul>
					<li><a href = "GuestInfo.aspx" target="right"><img src = "images/ruzhudengji.png"/><span>入住登记</span></a></li>
					<li><a href="GuestInfo.aspx?roomid=0" target="right"><img src = "images/shenqingtuifang.png"/><span>客房预订</span></a></li>
					<li><a href="LiveMark.aspx" target="right"><img src = "images/yudingguanli.png"/><span>入住查询</span></a></li>
					<li><a href="ReserveMark.aspx" target="right"><img src = "images/chaxunkongfang.png"/><span>预订管理</span></a></li>


				</ul>
			</li>
			
			<li>
				<a href = "#"><img src = "images/icon_gallery.png"/><span>信息查询</span></a>
				<ul>
					<li><a href = "GuestInfo.aspx" target="right"><img src = "images/gukexinxi.png"/><span>顾客信息</span></a></li>
					<li><a href = "LiveMark.aspx" target="right"><img src = "images/ruzhuxinxi.png"/><span>入住信息</span></a></li>
					<li><a href="ReserveMark.aspx" target="right"><img src = "images/fangjianxinxi.png"/><span>预约信息</span></a></li>
					


				</ul>
			</li>

			<li>
				<a href = "#"><img src = "images/icon_apps.png"/><span>顾客管理</span></a>
				<ul>
					<li><a href="GuestReg.aspx" target="right"><img src = "images/xinzengguke.png"/><span>新增顾客</span></a></li>
					<li><a href="GuestMan.aspx" target="right"><img src = "images/fangjianzhuangtai.png"/><span>顾客升级</span></a></li>
					<li><a href="GuestMan.aspx" target="right"><img src = "images/xinxixiugai.png"/><span>信息修改</span></a></li>
				


				</ul>
			</li>

            			<li>
				<a><img src = "images/icon_settings.png"/><span style="color:white">系统设置</span></a>
				
				<ul>
                <li><a href = "Reports.aspx" target="right"><img src = "images/tongjibaobiao.png"/><span>统计报表</span></a></li>
					<li><a href = "ChangePwd.aspx" target="right"><img src = "images/xiugaimima.png"/><span>修改密码</span></a></li>
                                        <li><a href="AboutProject.aspx" target="right"><img src = "images/gukeleixing.png"/><span>关于系统</span></a></li>
                    <li><a href="AboutUs.aspx" target="right"><img src = "images/fenggeguanli.png"/><span>关于我们</span></a></li>
					<li><a href = "#" onclick="quit()"><img src = "images/tuichuxitong.png"/><span>退出系统</span></a></li>
				</ul>
				
			</li>
			
		
		</ul>
	</div>
 
 
 
 
 
 
 
 </div>

    </div>
   

    </div>
    </div>
    </form>
</body>
</html>
