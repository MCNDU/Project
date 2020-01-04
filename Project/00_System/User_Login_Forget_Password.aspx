<%@ Page Title="" Language="C#" MasterPageFile="~/00_System/MasterPage.Master" AutoEventWireup="true" CodeBehind="User_Login_Forget_Password.aspx.cs" Inherits="Project._00_System.User_Login_Forget_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterWebContent" runat="server">
    &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Enter_Account_LB" runat="server" Font-Size="12pt" ForeColor="Black" Text="請輸入你的帳號"></asp:Label>
        &nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="Enter_Account_TBX" runat="server" ForeColor="Black"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;
    <asp:Label ID="Enter_Email_LB" runat="server" ForeColor="Black" Text="輸入你的E-mail" Font-Size="12pt"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="Enter_Email_TBX" runat="server" ForeColor="Black"></asp:TextBox>
        <p>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Enter_Email_TBX" ErrorMessage="E-mail格式不符" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </p>

        &nbsp;&nbsp;
        <asp:Button ID="Enter_BTN" runat="server" ForeColor="Black" Text="確定" OnClick="Send_Password" />
        <p>
            <asp:Label ID="Alert_LB" runat="server" ForeColor="Black"></asp:Label>
        </p>
</asp:Content>
