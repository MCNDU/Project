<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Statistic_AdvPro.aspx.cs" Inherits="Project._02_Web_Page.Statistic_AdvPro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>論文指導教授統計名冊</title>
</head>
<body>
    <form id="Statistic_AdvPro" runat="server">
        <div>
            <!--連結資料庫用-->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Project_Db %>" SelectCommand="SELECT [Student_ID], [Student_Name], [Ch_Research topics] AS Ch_Research_topics, [FAP_Name], [SAP_Name], [TAP_Name] FROM [Choosen_One]"></asp:SqlDataSource>
            <!--文件標題-->
            <asp:Table ID="Title" runat="server" HorizontalAlign="Center" Width="85%" OnLoad="Title_Load">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center"></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <!--容器，包含表單本體及右方之細項-->
            <asp:Table runat="server" HorizontalAlign="Center" GridLines="Both">
                <asp:TableRow>
                    <asp:TableCell Width="70%">
                        <!--表單本體，紀錄主要資訊-->
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Student_ID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" OnLoad="GridView1_Load">
                            <Columns>
                                <asp:TemplateField HeaderText="項次">
                                    <ItemTemplate></ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Student_ID" HeaderText="學號" ReadOnly="True" SortExpression="Student_ID" />
                                <asp:BoundField DataField="Student_Name" HeaderText="研究生姓名" SortExpression="Student_Name" />
                                <asp:BoundField DataField="Ch_Research_topics" HeaderText="論文題目(中文)" SortExpression="Ch_Research_topics" />
                                <asp:BoundField DataField="FAP_Name" HeaderText="指導教授" SortExpression="FAP_Name" />
                                <asp:BoundField DataField="SAP_Name" HeaderText="共同指導" SortExpression="SAP_Name" />
                                <asp:BoundField DataField="TAP_Name" HeaderText="共同指導" SortExpression="TAP_Name" />
                            </Columns>
                        </asp:GridView>
                    </asp:TableCell>
                    <asp:TableCell Width="15%">
                        <!--表單右方之細項資訊-->
                        <asp:Table runat="server" OnLoad="Item_Load" GridLines="Both">
                            <asp:TableRow>
                                <asp:TableCell ID ="Item_Title">
                                    <!--標頭-->
                                </asp:TableCell >
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ID ="FullTime_Teacher">
                                    <!--專任老師資料-->

                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ID ="PartTime_Teacher">
                                    <!--兼任老師資料-->

                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </div>
    </form>
</body>
</html>
