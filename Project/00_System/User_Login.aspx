<%@ Page Title="" Language="C#" MasterPageFile="~/00_System/MasterPage.Master" AutoEventWireup="true" CodeBehind="User_Login.aspx.cs" Inherits="Project._00_System.User_Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterWebContent" runat="server">
    <style type="text/css">
        .body {
            font-family: sans-serif; 
            background-image: url('../Image/User_Login_BG.jpg'); 
            background-size: cover; 
            background-repeat: repeat;
            padding: 0px; 
            margin: 0px;
        }

        .div {
            position: absolute; 
            top: 50%; 
            left: 50%; 
            transform: translate(-50%,-50%); 
            width: 350px; 
            height: 450px; 
            padding: 80px 40px; 
            box-sizing: border-box; 
            background: rgba(0,0,0,0.5);
        }

        .h2 {
            font-size: x-large; 
            padding: 0; 
            margin: 0; 
            text-align: center; 
            color: rgb(0, 148, 255)
        }

        .lblid, .lblpass {
            font-weight: bold;
            color: #fff;
        }

        .txtid, .txtpass, .btnsubmit {
            width: 100%;
            margin-bottom: 20px;
        }

        .txtid, .txtpass {
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 16px;
            background-color: transparent;
        }

        .placeholder {
            color: rgb(0, 148, 255);
        }

        .btnsubmit {
            border: none;
            outline: none;
            height: 40px;
            font-size: 16px;
            color: #fff;
            background-color: rgb(0, 148, 255);
            cursor: pointer;
            border-radius: 20px;
            transition: .3s ease-in-out;
        }

        .btnsubmit:hover {
            background-color: rgb(255, 216, 0);
        }

        .btnforget, .btnchange {
            font-size: 16px;
            font-weight: 700;
            text-decoration: none;
            color: #fff;
        }

        .btnforget, .btnchange:hover {
            text-decoration: underline;
        }
    </style>
    <div class="div">

        <h2 class="h2">論文審查系統</h2>

        <form id="Login_Form" runat="server" style="height: 316px">
            <asp:Label Text="帳號" CssClass="lblid" runat="server" />
            <asp:TextBox ID="Account_TBX" runat="server" CssClass="txtid" required="帳號為您的學號" placeholder="學號" />
            <asp:Label Text="密碼" CssClass="lblpass" runat="server" />
            <asp:TextBox ID="Password_TBX" runat="server" CssClass="txtpass" required="請填寫密碼" placeholder="********" TextMode="Password" />
            <asp:Button ID="Login_BTN" Text="登入" CssClass="btnsubmit" runat="server" OnClick="Login" />

            <asp:HyperLink ID="FrogetPassword_HL" Text="忘記密碼" CssClass="btnforget" runat="server" Target="_self" NavigateUrl="User_Login_Forget_Password.aspx" />
            
            <asp:Label ID="Alert_LB" runat="server"></asp:Label>
        </form>

    </div>
</asp:Content>
