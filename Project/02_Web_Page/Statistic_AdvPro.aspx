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
            <table ID="Title" runat="server" style="text-align: center" Width="85%" OnLoad="Title_Load">
                <tr>
                    <td style="text-align: center"></td>
                </tr>
            </table>
            <!--容器，包含表單本體及右方之細項-->
            <table runat="server" style="text-align: center" GridLines="Both">
                <tr>
                    <td Width="70%">
                        <!--表單本體，紀錄主要資訊-->
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Student_ID" DataSourceID="SqlDataSource1" style="text-align: center" OnLoad="GridView1_Load">
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
                    </td>
                    <td Width="15%">
                        <!--表單右方之細項資訊-->
                        <table runat="server" OnLoad="Item_Load" GridLines="Both">
                            <tr>
                                <td ID ="Item_Title">
                                    <!--標頭-->
                                </td >
                            </tr>
                            <tr>
                                <td ID ="FullTime_Teacher">
                                    <!--專任老師資料-->

                                </td>
                            </tr>
                            <tr>
                                <td ID ="PartTime_Teacher">
                                    <!--兼任老師資料-->

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
