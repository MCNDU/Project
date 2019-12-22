<%@ Page Title="" Language="C#" MasterPageFile="~/01_Master_Page/MasterPage_Student.master" AutoEventWireup="true" CodeBehind="PersonalInformation_Student.aspx.cs" Inherits="Project._02_Web_Page.PersonalInformation_Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            height: 3px;
        }

        .auto-style4 {
            width: 182px;
        }

        .auto-style5 {
            width: 100%;
            height: 433px;
        }

        .auto-style6 {
            width: 849px;
            color: black;
        }

        .auto-style7 {
            width: 182px;
            height: 421px;
        }

        .auto-style8 {
            vertical-align: top;
            width: 849px;
            height: 421px;
        }

        .auto-style9 {
            height: 421px;
        }

        .auto-style10 {
            width: 182px;
            height: 9px;
        }

        .auto-style11 {
            width: 849px;
            height: 9px;
        }

        .auto-style12 {
            height: 9px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <p class="auto-style3">
        &nbsp;
    </p>
    <table class="auto-style5">
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style6">
                <table style="width: 1100px;">
                    <tr>
                        <td></td>
                        <td>
                            <asp:Label ID="Label9" runat="server" Font-Names="標楷體" Font-Size="15pt" Text="指導老師"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label10" runat="server" Font-Names="標楷體" Font-Size="15pt" Text="共同指導"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label11" runat="server" Font-Names="標楷體" Font-Size="15pt" Text="共同指導"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Name" runat="server" Font-Names="標楷體" Font-Size="15pt" Text="姓名"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FAP_Name" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SAP_Name" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TAP_Name" runat="server" ReadOnly="True" Text=""></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="School" runat="server" Font-Names="標楷體" Font-Size="15pt" Text="學校系(所)"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FAP_School" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SAP_School" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TAP_School" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Edu" runat="server" Font-Names="標楷體" Font-Size="15pt" Text="學歷"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FAP_Edu" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SAP_Edu" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TAP_Edu" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Exp" runat="server" Font-Names="標楷體" Font-Size="15pt" Text="經歷"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FAP_Exp" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SAP_Exp" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TAP_Exp" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Address" runat="server" Font-Names="標楷體" Font-Size="15pt" Text="通訊地址"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FAP_Address" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SAP_Address" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TAP_Address" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Phone" runat="server" Font-Names="標楷體" Font-Size="15pt" Text="連絡電話"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="FAP_Phone" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SAP_Phone" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TAP_Phone" runat="server"></asp:TextBox></td>
                    </tr>
                </table>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style8">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="Black" Height="252px" Width="763px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" CssClass="auto-style1">
                    <EditRowStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="帳號" ReadOnly="True" SortExpression="ID"></asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Chinese_Name" HeaderText="中文姓名" SortExpression="Chinese_Name" />
                        <asp:BoundField DataField="English_Name" HeaderText="英文姓名" SortExpression="English_Name" />
                        <asp:BoundField DataField="Phone" HeaderText="手機號碼" SortExpression="Phone" />
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                </asp:DetailsView>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM [User_Login] WHERE [ID] = @ID" 
                    InsertCommand="INSERT INTO [User_Login] ([Category], [Chinese_Name], [English_Name], [ID], [Password], [Email], [Phone]) 
                    VALUES (Student, @Chinese_Name, @English_Name, @ID, @Password, @Email, @Phone)" 
                    SelectCommand="SELECT * FROM [User_Login] WHERE ([ID] = @ID)" 
                    UpdateCommand="UPDATE [User_Login] SET [Password] = @Password, [Email] = @Email, [Chinese_Name] = @Chinese_Name, [English_Name] = @English_Name, [Phone] = @Phone WHERE [ID] = @ID" 
                    ProviderName="System.Data.SqlClient" DataSourceMode="DataReader">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Chinese_Name" Type="String" />
                        <asp:Parameter Name="English_Name" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="ID" SessionField="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Chinese_Name" Type="String" />
                        <asp:Parameter Name="English_Name" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style11"></td>
            <td class="auto-style12"></td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" ForeColor="Black"></asp:Label>
    <br />
</asp:Content>
