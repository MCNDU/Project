<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examine_Teacher.aspx.cs" Inherits="Project._02_Web_Page.Examine_Teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table ID="Title" runat="server" style="text-align: center" Width="85%" OnLoad="Title_Load">
                <tr>
                    <td style="text-align: center"></td>
                </tr>
            </table>
            <asp:GridView ID="GridView1" runat="server" style="text-align: center" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField HeaderText="項次">
                    <ControlStyle Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="學號" />
                    <asp:BoundField HeaderText="研究生姓名" />
                    <asp:BoundField HeaderText="論文題目(中文)" />
                    <asp:BoundField HeaderText="指導教授" />
                    <asp:BoundField HeaderText="審查委員1" />
                    <asp:BoundField HeaderText="審查委員2" />
                    <asp:BoundField HeaderText="審查委員3" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
