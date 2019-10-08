<%@ Page Title="" Language="C#" MasterPageFile="~/01_Master_Page/MasterPage_Admin.master" AutoEventWireup="true" CodeBehind="Manage_Account.aspx.cs" Inherits="Project._02_Web_Page.Manage_Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="list">
        <div id="left" style="float: left; width: 50%; overflow: hidden;">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Project_Db %>" SelectCommand="SELECT * FROM [User_Login]" UpdateCommand="UPDATE [User_Login] SET [Password] = @Password, [Email] = @Email, [Chinese_Name] = @Chinese_Name, [English_Name] = @English_Name, [Phone] = @Phone WHERE [ID] = @ID" ></asp:SqlDataSource>
            <asp:GridView ID="GridView_List" runat="server" AllowSorting="True" DataKeyNames="ID" DataSourceID="SqlDataSource1" HorizontalAlign="Right" Width="100%" ForeColor="Black" AutoGenerateColumns="False" AllowPaging="True" PageSize="25" OnSelectedIndexChanged="GridView_List_SelectedIndexChanged" AutoGenerateSelectButton="True">
                <Columns>
                    <asp:BoundField DataField="Category" HeaderText="權限" SortExpression="Category" />
                    <asp:BoundField DataField="Chinese_Name" HeaderText="中文名稱" SortExpression="Chinese_Name" />
                    <asp:BoundField DataField="English_Name" HeaderText="英文名稱" SortExpression="English_Name" />
                    <asp:BoundField DataField="ID" HeaderText="學號" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Password" HeaderText="密碼" SortExpression="Password" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="電話號碼" SortExpression="Phone" />
                </Columns>
            </asp:GridView>
        </div>
        <div id="right" style="margin-left: 110px;">
            <asp:DetailsView ID="DetailsView_Edit" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="Black" Height="252px" Width="550px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" CssClass="auto-style1">
                <EditRowStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
                <Fields>
                    <asp:BoundField DataField="Category" HeaderText="權限" SortExpression="Category" />
                    <asp:BoundField DataField="Chinese_Name" HeaderText="中文名稱" SortExpression="Chinese_Name" />
                    <asp:BoundField DataField="English_Name" HeaderText="英文名稱" SortExpression="English_Name" />
                    <asp:BoundField DataField="ID" HeaderText="學號" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Password" HeaderText="密碼" SortExpression="Password" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="電話號碼" SortExpression="Phone" />
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
            </asp:DetailsView>

        </div>
        <div style="clear: both;" title="自適應">
        </div>
    </div>
</asp:Content>
