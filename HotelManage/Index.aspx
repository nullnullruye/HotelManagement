<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="HotelManage.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
<style type="text/css">
body{ margin:0px; width:100%; overflow:hidden;scrolling:no;}
#top{width:100%;height:140px; scrolling:no; }
#left{position:relative;top:0px;height:650px; width:230px;}
#right{ width:1230px; height:650px; scrolling:auto; position:absolute;top:147px; left:230px ;overflow: hidden}
.button{ border-style: none;border-color: inherit;border-width: 0px;background: #00AA68;border-radius:5px; width:90px; height:29px; font-family:微软雅黑; color:White; font-size:18px;cursor:pointer;  }
.button1{border-radius:7px; border:white solid  2px; width:50px; height:26px; background-color:#00AA68; font-size:16px; font-family:微软雅黑; color:White;cursor:pointer; position:relative; top:20px}
.text{margin-left: 0px;Height:32px; width:250px; border: solid 2px #00AA68; font-size:20px; font-family:微软雅黑; background-color:#e9fbee}
.black_overlay{display: none;position: absolute;top: 0%;left: 0%;width: 100%;height: 100%;background-color: black;z-index:1001;-moz-opacity: 0.8;opacity:.80;filter: alpha(opacity=80);}
.white_content{border-radius:15px ;display: none;position: absolute;top: 40%;left: 32%;width: 35%;height:218px;border: 10px solid #00AA68;background-color: white;z-index:1002;overflow: auto; text-align:center}
.white_content_small {border-radius:15px; display: none;position: absolute;top: 20%;left: 30%;width: 40%;height: 50%;border: 10px solid #00AA68;background-color: white;z-index:1002;overflow: auto;}



</style>



<script type="text/javascript">
    //弹出隐藏层
    function ShowDiv(show_div, bg_div) {

        var Opname='<%=Session["opname"] %>';
        if (Opname != "") { 
        document.getElementById("compareIframe").src = "changeSession.aspx?sd=1"; 
        } 


        document.getElementById(show_div).style.display = 'block';
        document.getElementById(bg_div).style.display = 'block';
        var bgdiv = document.getElementById(bg_div);
        bgdiv.style.width = document.body.scrollWidth;      
        $("#" + bg_div).height($(document).height());
    };
    //关闭弹出层
    function CloseDiv(show_div, bg_div) {


        var pwd = document.getElementById("Text1").value;  //获取text的值
        var pwd1 = '<%=Session["pwd"] %>';
      
       
        if (pwd == pwd1) { 
              document.getElementById(show_div).style.display = 'none';
              document.getElementById(bg_div).style.display = 'none';
              document.getElementById("compareIframe").src = "changeSession.aspx?sd=2"; 
        
        }
        else{
            alert("管理员密码错误！");
        
        }
    };
</script>

<script type="text/jscript">

    function stop() {

        return false;

    }

    document.oncontextmenu = stop;

</script>

  <script type="text/jscript">
      document.onkeydown = function ()              //网页内按下回车触发
      {
          if (event.keyCode == 13) {
              document.getElementById("Button2").onclick();
              return false;
          }
      }
  </script>







</head>
<body onload="stop()">    


    <form id="form1" runat="server"> 
     <input id="Bt" type="button" value="锁定" onclick="ShowDiv('MyDiv','fade')" style="border-radius:7px; border:white solid  2px; width:50px; height:26px; background-color:#00AA68; font-size:16px; font-family:微软雅黑; color:White;cursor:pointer; position: absolute; top:100px; left:388px" />  
    <div>
    <div style=" height:146px">
    <frame name="index">
     <iframe  src="Top.aspx" id="top"  frameborder="0" ></iframe>
    </div> 
 <iframe  src="Left.aspx" name="left"   id="left" frameborder="0" ></iframe>
 <iframe  src="Right.aspx" name="right" id="right"  frameborder="0"></iframe>
</frame>
<iframe id="compareIframe" src="" style=" width:0px; height:0px ; border:0px "></iframe>
   
    </div>

<!--弹出层时背景层DIV-->
<div id="fade" class="black_overlay">
</div>
<div id="MyDiv" class="white_content" dir="ltr">
   <br /> <img src="images/sd.jpg" /><br>
 <br>
    <span style=" font-size:23px;  font-style:inherit;color:#00aa68; font-family:微软雅黑">&nbsp;密码：&nbsp;</span><input id="Text1" type="password" class="text"/> 
    <br>
    </br>

    &nbsp;&nbsp;&nbsp;<input id="Button2" type="button" value="确定" onclick="CloseDiv('MyDiv','fade')"  class="button" runat="server" />
    <asp:Button ID="Button3" runat="server" CssClass="button" onclick="Button2_Click" Text="退出" />


    </br>
</br>
    <%--affddf--%>
</div>
<div style="height: 67px; background-color:#00aa68 ;  background:rgba(0,0,0,0.1);text-align:center; font-family:微软雅黑; color:gray; font-size:13px; position:relative; top:20px;">
<p style=" position:relative; top:-1px"><br/>Copyright © 荆楚酒店管理系统 All Rights Reserved 荆州职业技术学院国际信息技术学院1305班黄宽<br />
    tel:13657168500&nbsp;&nbsp;&nbsp;qq:844591473&nbsp;&nbsp;&nbsp;mail:kuankuank@outlook.com</p>

</div>



    </form>
    
    <%--<span style="font-size: 16px;" onclick="CloseDiv('MyDiv','fade')">关闭</span>--%>

   
</body>
</html>







