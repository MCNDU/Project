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
         <h1 style="background-color: #66CCFF">論文審查系統</h1>
           <div class="vertical-menu">
            <a href="AD_1mainpage.aspx" class="active">Home</a>
            <a href="AD_2points.aspx">指導老師積點</a>
            <a href="AD_3students.aspx">論文審查</a>
            <a href="AD_4oral.aspx">論文口試</a>
            <a href="AD_5addcredits.aspx">論文加分</a>
            <a href="login.aspx">登出</a>
            </div>
    </form>
</body>
</html>
