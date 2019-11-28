<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AD_Prof_Assign.aspx.cs" Inherits="Project._02_Web_Page.AD_Prof_Assign" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>分配指導教授</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%; vertical-align: top;" id="table">
                <tr>
                    <td style="border-style: solid; vertical-align: top; width: 75%;">
                        <asp:MultiView ID="Data_MultiView" runat="server" ActiveViewIndex="0">
                            <asp:View ID="Student_Only_View" runat="server">
                                <asp:Button ID="Button1" runat="server" Text="只瀏覽審查委員資料" CommandArgument="1" CommandName="SwitchViewByIndex" />
                                <asp:Button ID="Button2" runat="server" CommandArgument="2" Text="瀏覽研究生及審查委員資料" CommandName="SwitchViewByIndex" />
                                <br />
                                <asp:Label ID="Doc_Title_Forward" runat="server" Text="國防大學管理學院資訊管理學系"></asp:Label>
                                <asp:DropDownList ID="Batch_DDL" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="Batch" DataTextField="Batch" DataValueField="Batch" OnSelectedIndexChanged="Batch_DDL_SelectedIndexChanged">
                                    <asp:ListItem>請選擇指導教授</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="Doc_Title__Backward" runat="server" Text="期論文計畫書審查成績冊"></asp:Label>
                                <asp:GridView ID="Student_GV" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="Student_SDS" PageSize="25" ShowHeaderWhenEmpty="True" Width="100%" AutoGenerateSelectButton="True" OnSelectedIndexChanged="Student_GV_SelectedIndexChanged">
                                    <Columns>
                                        <asp:TemplateField HeaderText="項次"></asp:TemplateField>
                                        <asp:BoundField DataField="ID" HeaderText="學號" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="Name" HeaderText="研究生姓名" SortExpression="Name" />
                                        <asp:BoundField DataField="Ch_Title" HeaderText="論文題目(中文)" SortExpression="Ch_Title" />
                                        <asp:BoundField DataField="First_Prof" HeaderText="指導教授" SortExpression="First_Prof" />
                                        <asp:BoundField DataField="First_Commit" HeaderStyle-ForeColor="Blue" HeaderText="審查委員1" SortExpression="First_Commit">
                                        <HeaderStyle ForeColor="Blue" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Second_Commit" HeaderStyle-ForeColor="Blue" HeaderText="審查委員2" SortExpression="Second_Commit">
                                        <HeaderStyle ForeColor="Blue" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Third_Commit" HeaderStyle-ForeColor="Blue" HeaderText="審查委員3" SortExpression="Third_Commit">
                                        <HeaderStyle ForeColor="Blue" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle HorizontalAlign="Center" />
                                </asp:GridView>
                            </asp:View>
                            <asp:View ID="Teacher_Only_View" runat="server">
                                <asp:Button ID="Button3" runat="server" CommandArgument="0" CommandName="SwitchViewByIndex" Text="只瀏覽研究生資料" />
                                <asp:Button ID="Button4" runat="server" CommandArgument="2" CommandName="SwitchViewByIndex" Text="瀏覽研究生及審查委員資料" />
                                <asp:GridView ID="Teacher_GV" runat="server" AutoGenerateColumns="False" DataKeyNames="ID,ID1" DataSourceID="Teacher_SDS" PageSize="15" ShowHeaderWhenEmpty="True" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="教師編號" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                                        <asp:BoundField DataField="Field" HeaderText="專長領域" SortExpression="Field" />
                                        <asp:BoundField DataField="Exam_Point" HeaderText="審查人數" SortExpression="Exam_Point" />
                                    </Columns>
                                </asp:GridView>
                            </asp:View>
                            <asp:View ID="Mix_View" runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button5" runat="server" CommandArgument="0" CommandName="SwitchViewByIndex" Text="只瀏覽研究生資料" />
                                            <asp:Button ID="Button6" runat="server" CommandArgument="1" CommandName="SwitchViewByIndex" Text="只瀏覽審查委員資料" />
                                            <asp:GridView ID="Teacher_GV_1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID,ID1" DataSourceID="Teacher_SDS" PageSize="15" ShowHeaderWhenEmpty="True" Width="100%">
                                                <Columns>
                                                    <asp:BoundField DataField="ID" HeaderText="教師編號" ReadOnly="True" SortExpression="ID" />
                                                    <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                                                    <asp:BoundField DataField="Field" HeaderText="專長領域" SortExpression="Field" />
                                                    <asp:BoundField DataField="Exam_Point" HeaderText="審查人數" SortExpression="Exam_Point" />
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Doc_Title_Forward0" runat="server" Text="國防大學管理學院資訊管理學系第"></asp:Label>
                                            <asp:DropDownList ID="Batch_DDL0" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="Batch" DataTextField="Batch" DataValueField="Batch" OnSelectedIndexChanged="Batch_DDL_SelectedIndexChanged">
                                                <asp:ListItem>請選擇指導教授</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Label ID="Doc_Title__Backward0" runat="server" Text="學期論文計畫書審查成績冊"></asp:Label>
                                            <asp:GridView ID="Student_GV_1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="Student_SDS" PageSize="25" ShowHeaderWhenEmpty="True" Width="100%" OnSelectedIndexChanged="Student_GV_SelectedIndexChanged">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="項次"></asp:TemplateField>
                                                    <asp:BoundField DataField="ID" HeaderText="學號" ReadOnly="True" SortExpression="ID" />
                                                    <asp:BoundField DataField="Name" HeaderText="研究生姓名" SortExpression="Name" />
                                                    <asp:BoundField DataField="Ch_Title" HeaderText="論文題目(中文)" SortExpression="Ch_Title" />
                                                    <asp:BoundField DataField="First_Prof" HeaderText="指導教授" SortExpression="First_Prof" />
                                                    <asp:BoundField DataField="First_Commit" HeaderStyle-ForeColor="Blue" HeaderText="審查委員1" SortExpression="First_Commit">
                                                        <HeaderStyle ForeColor="Blue" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Second_Commit" HeaderStyle-ForeColor="Blue" HeaderText="審查委員2" SortExpression="Second_Commit">
                                                        <HeaderStyle ForeColor="Blue" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Third_Commit" HeaderStyle-ForeColor="Blue" HeaderText="審查委員3" SortExpression="Third_Commit">
                                                        <HeaderStyle ForeColor="Blue" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <RowStyle HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </asp:View>
                        </asp:MultiView>
                    </td>
                    <td style="border-style: solid solid solid none; vertical-align: top; width: 25%;">
                        <table style="width: 100%; height: 100%;">
                            <tr>
                                <td>

                                    <table style="width: 100%;">
                                        <tr>
                                            <td>

                                                <asp:Label ID="Title_Student_LB" runat="server" Text="研究生" Font-Bold="True"></asp:Label>
                                                <asp:DetailsView ID="Student_DV" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="Student_SDS" Height="50px" Width="100%">
                                                    <Fields>
                                                        <asp:BoundField DataField="ID" HeaderText="研究生學號" ReadOnly="True" SortExpression="ID" />
                                                        <asp:BoundField DataField="Name" HeaderText="研究生姓名" SortExpression="Name" />
                                                        <asp:BoundField DataField="Ch_Title" HeaderText="論文題目(中文)" SortExpression="Ch_Title" />
                                                        <asp:BoundField DataField="First_Prof" HeaderText="指導教授" SortExpression="First_Prof" />
                                                        <asp:BoundField DataField="First_Commit" HeaderText="審查委員1" SortExpression="First_Commit" />
                                                        <asp:BoundField DataField="Second_Commit" HeaderText="審查委員2" SortExpression="Second_Commit" />
                                                        <asp:BoundField DataField="Third_Commit" HeaderText="審查委員3" SortExpression="Third_Commit" />
                                                    </Fields>
                                                </asp:DetailsView>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                                <asp:Label ID="Title_Commit_LB" runat="server" Text="審查委員" Font-Bold="True"></asp:Label>
                                                <asp:DetailsView ID="Teacher_DV" runat="server" AutoGenerateRows="False" DataKeyNames="ID,Batch" DataSourceID="Teacher_SDS" Height="50px" Width="100%" AllowPaging="True">
                                                    <Fields>
                                                        <asp:BoundField DataField="ID" HeaderText="教師編號" ReadOnly="True" SortExpression="ID" />
                                                        <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                                                        <asp:BoundField DataField="Department" HeaderText="所屬單位" SortExpression="Department" />
                                                        <asp:BoundField DataField="Job" HeaderText="職稱" SortExpression="Job" />
                                                        <asp:BoundField DataField="Degree" HeaderText="學歷" SortExpression="Degree" />
                                                        <asp:BoundField DataField="Exp" HeaderText="經歷" SortExpression="Exp" />
                                                        <asp:BoundField DataField="Address" HeaderText="通訊地址" SortExpression="Address" />
                                                        <asp:BoundField DataField="Field" HeaderText="專業領域" SortExpression="Field" />
                                                        <asp:BoundField DataField="Exam_Point" HeaderText="審查人數" SortExpression="Exam_Point" />
                                                    </Fields>
                                                    <PagerSettings Mode="NextPrevious" PageButtonCount="3" />
                                                </asp:DetailsView>

                                            </td>
                            </tr>
                            <asp:Label ID="TEST_LB" runat="server" Text="TEST"></asp:Label>
                        </table>



                    </td>
                </tr>
            </table>
                                <asp:SqlDataSource ID="Batch" runat="server" ConnectionString="<%$ ConnectionStrings:Project_Db %>" SelectCommand="SELECT DISTINCT [Batch] FROM [Student]"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="Teacher_SDS" runat="server" ConnectionString="<%$ ConnectionStrings:Project_Db %>" SelectCommand="SELECT * FROM [Teacher] , [ExamPoint_Log] WHERE Batch = 0;"></asp:SqlDataSource>

                                                <asp:SqlDataSource ID="Student_SDS" runat="server" ConnectionString="<%$ ConnectionStrings:Project_Db %>" SelectCommand="SELECT ID, Name, Ch_Title, First_Commit, Second_Commit, Third_Commit, First_Prof FROM Student WHERE (Batch = 0)"></asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
