﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PR_RE_mainpage.aspx.cs" Inherits="Project._02_Professor.PR_RE_mainpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>論文審查系統-審查委員首頁</title>
    <link rel="stylesheet" href="~/css/basicstructure.css" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
         <h1 style="background-color: #66CCFF; padding-top:20px; padding-bottom: 8px; font-family:微軟正黑體 ; color:#ffffff;
            box-shadow:0px 8px 8px 0px #808080 ">&nbsp碩士論文進修審查系統</h1><p><marquee behavior="scroll" direction="left" height="29" class="margu" font-family=微軟正黑體>
          碩士論文進修審查系統
        </marquee>
           <div class="vertical-menu">
            <a href="PR_RE_mainpage.aspx" class="active">Home</a>
            <a href="PR_RE_reviewthsisplan.aspx">論文審查</a>
            <a href="">論文口試</a>
            <a href="">論文加分</a>
            <a href="login.aspx">登出</a>
            </div>
            <div class = "info"> </div>
    </form>
</body>
</html>