﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ST_1mainpage.aspx.cs" Inherits="Project._03_Student.ST_1mainpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>論文審查系統-學生首頁</title>
    <link rel="stylesheet" href="~/css/basicstructure.css" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
         <h1 style="background-color: #66CCFF; padding-top:20px; padding-bottom: 8px; font-family:微軟正黑體 ; color:#ffffff;
            box-shadow:0px 8px 8px 0px #808080 ">&nbsp碩士論文進修審查系統</h1><p><marquee behavior="scroll" direction="left" height="29" class="margu" font-family=微軟正黑體>
          碩士論文進修審查系統
        </marquee>
           <div class="vertical-menu">
            <a href="ST_1mainpage.aspx" class="active">Home</a>
            <a href="ST_6personalinfo.aspx">個人資料</a>
            <a href="ST_Choose_Prof.aspx">申請指導教授</a>
            <a href="ST_searchresult.aspx">查詢及列印指導教授申請結果</a>
            <a href="ST_handinthesis.aspx">申請論文計畫書審查</a>
            <a href="ST_replycomment.aspx">論文計畫書審查意見回覆</a>
            <a href="">論文口試</a>
            <a href="">論文加分</a>
            <a href="login.aspx">登出</a>
            </div>
            <div class = "info"> </div>
    </form>
</body>
</html>