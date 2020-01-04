<%@ Page Title="" Language="C#" MasterPageFile="~/01_Administrator/AD_MasterPage.master" AutoEventWireup="true" CodeBehind="AD_Examine_List.aspx.cs" Inherits="Project._01_Administrator.AD_Examine_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="WebContent" runat="server">
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" style="text-align: center" AutoGenerateColumns="False" HorizontalAlign="Center" Width="85%">
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
</asp:Content>
