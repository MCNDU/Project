<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AD_1mainpage.aspx.cs" Inherits="ThesisMISblankversion.AD_mainpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>論文審查系統-管理員首頁</title>
    <link rel="stylesheet" href="~/css/basicstructure.css" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
         <h1 style="background-color: #66CCFF; padding-top:20px; padding-bottom: 8px; font-family:微軟正黑體 ; color:#ffffff;
            box-shadow:0px 8px 8px 0px #808080 ">&nbsp碩士論文進修審查系統</h1><p><marquee behavior="scroll" direction="left" height="29" class="margu" font-family=微軟正黑體>
          碩士論文進修審查系統
        </marquee>
           <div class="vertical-menu">
            <a href="AD_1mainpage.aspx" class="active">Home</a>
            <a href="AD_Manage_Account.aspx">研究生管理</a>
            <a href="AD_Manage_Prof.aspx">指導老師管理</a>
            <a href="AD_ChooseSemAndSt.aspx">研究生與論文計畫書</a>
            <a href="AD_GuidePoint.aspx">指導老師積點</a>
            <a href="AD_Prof_Assign.aspx">分配審查委員</a>
            <a href="AD_Examine_List.aspx">顯示審查結果</a>
            <a href="">論文口試</a>
            <a href="">論文加分</a>
            <a href="../00_System/login.aspx">登出</a>
            </div>
            <div class = "info"> </div>
    </form>
</body>
</html>
