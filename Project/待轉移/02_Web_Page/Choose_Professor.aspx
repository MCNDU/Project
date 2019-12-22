<%@ Page Title="" Language="C#" MasterPageFile="~/01_Master_Page/MasterPage_Student.master" AutoEventWireup="true" CodeBehind="Choose_Professor.aspx.cs" Inherits="Project._02_Web_Page.Choose_Professor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .TextBoxEdit {
            width: 175px;
            Height: 20px;
            Border: None;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Project_Db %>" SelectCommand="SELECT * FROM [Adv_Pro]"></asp:SqlDataSource>
    選擇指導教授
    <table style="width: 1400px; color: #000000;" aria-busy="True">
        <tr>
            <td>
                <asp:Table ID="Table1" runat="server" ForeColor="Black">
                    <asp:TableRow runat="server">
                        <asp:TableCell Width="175"></asp:TableCell>
                        <asp:TableCell Width="175">指導教授姓名</asp:TableCell>
                        <asp:TableCell Width="175">剩餘點數</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell Width="175">
                            <!--選擇自下拉式選單所選的指導教授_1-->
                            <!--OnClick="Choose"-->
                            <asp:Button ID="Choose_Adv_1" runat="server" Text="選擇" OnClick="Choose"/>
                        </asp:TableCell>
                        <asp:TableCell Width="175">
                            <!--自下拉式選單選擇指導教授_1-->
                            <!--對應程式：Adv_Changed-->
                            <!--OnSelectedIndexChanged="Adv_Changed"-->
                            <asp:DropDownList ID="Select_Adv_1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name" AppendDataBoundItems="True" OnSelectedIndexChanged="Adv_Changed">
                                <asp:ListItem Value="None">選擇指導教授</asp:ListItem>
                                <asp:ListItem Value="Custom">自訂指導教授</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell Width="175">
                            <!--顯示自下拉式選單選擇指導教授之剩餘點數_1-->
                            <asp:TextBox ID="Adv_PointRemain_1" runat="server" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell Width="175">
                            <!--選擇自下拉式選單所選的指導教授_2-->
                            <!--OnClick="Choose"-->
                            <asp:Button ID="Choose_Adv_2" runat="server" Text="選擇" OnClick="Choose"/>
                        </asp:TableCell>
                        <asp:TableCell Width="175">
                            <!--自下拉式選單選擇指導教授_2-->
                            <!--對應程式：Adv_Changed-->
                            <!--OnSelectedIndexChanged="Adv_Changed"-->
                            <asp:DropDownList ID="Select_Adv_2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name" AppendDataBoundItems="True" OnSelectedIndexChanged="Adv_Changed">
                                <asp:ListItem Value="None">選擇指導教授</asp:ListItem>
                                <asp:ListItem Value="Custom">自訂指導教授</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell Width="175">
                            <!--顯示自下拉式選單選擇指導教授之剩餘點數_2-->
                            <asp:TextBox ID="Adv_PointRemain_2" runat="server" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell Width="175">
                            <!--選擇自下拉式選單所選的指導教授_3-->
                            <!--OnClick="Choose"-->
                            <asp:Button ID="Choose_Adv_3" runat="server" Text="選擇" OnClick="Choose"/>
                        </asp:TableCell>
                        <asp:TableCell Width="175">
                            <!--自下拉式選單選擇指導教授_3-->
                            <!--對應程式：Adv_Changed-->
                            <!--OnSelectedIndexChanged="Adv_Changed"-->
                            <asp:DropDownList ID="Select_Adv_3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name" AppendDataBoundItems="True" OnSelectedIndexChanged="Adv_Changed">
                                <asp:ListItem Value="None">選擇指導教授</asp:ListItem>
                                <asp:ListItem Value="Custom">自訂指導教授</asp:ListItem>
                            </asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell Width="175">
                            <!--顯示自下拉式選單選擇指導教授之剩餘點數_3-->
                            <asp:TextBox ID="Adv_PointRemain_3" runat="server" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </td>
            <td>
                <!--自訂指導教授頁面_1-->
                <!--平時為隱藏狀態-->
                <asp:Table ID="Table_Costom_1" runat="server" Visible="False" GridLines="Both" HorizontalAlign="Left" Height="205px">
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">姓名</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="CAP_Name_1" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">學校系(所)</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="CAP_School_1" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">學歷</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="CAP_Edu_1" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">經歷</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="CAP_Exp_1" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">通訊地址</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="CAP_Address_1" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">聯絡電話</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="CAP_Phone_1" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width=""></asp:TableCell>
                        <asp:TableCell Width="">
                            <!--送出自行填寫的指導教授資料-->
                            <asp:Button ID="Costom_It_Yourself" runat="server" Text="自訂指導教授" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <!--自訂指導教授頁面_2-->
                <!--平時為隱藏狀態-->
                <asp:Table ID="Table_Costom_2" runat="server" Visible="False" HorizontalAlign="Left" GridLines="Both" Height="205px">
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">姓名</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">學校系(所)</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">學歷</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">經歷</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">通訊地址</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">聯絡電話</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="TextBox6" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width=""></asp:TableCell>
                        <asp:TableCell Width="">
                            <!--送出自行填寫的指導教授資料-->
                            <asp:Button ID="Button1" runat="server" Text="自訂指導教授" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <!--自訂指導教授頁面_3-->
                <!--平時為隱藏狀態-->
                <asp:Table ID="Table_Costom_3" runat="server" Visible="False" HorizontalAlign="Left" GridLines="Both" Height="205px">
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">姓名</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="TextBox7" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">學校系(所)</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="TextBox8" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">學歷</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="TextBox9" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">經歷</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="TextBox10" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">通訊地址</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="TextBox11" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width="">聯絡電話</asp:TableCell>
                        <asp:TableCell Width="">
                            <asp:TextBox ID="TextBox12" runat="server" CssClass="TextBoxEdit"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell Width=""></asp:TableCell>
                        <asp:TableCell Width="">
                            <!--送出自行填寫的指導教授資料-->
                            <asp:Button ID="Button2" runat="server" Text="自訂指導教授" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </td>
        </tr>
    </table>
    <!--顯示已選擇的指導教授-->
            <asp:Table ID="Choose_Title" runat="server" Height="25" Width="850" HorizontalAlign="Center" ForeColor="Black">
                <asp:TableRow HorizontalAlign="Left">
                    <asp:TableCell>二、指導教授基本資料</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table runat="server" BorderWidth="1px" CaptionAlign="Top" CellPadding="0" CellSpacing="0" GridLines="Both" Height="175px" HorizontalAlign="Center" Width="800px" ID="Select_AP_Table" ForeColor="Black">
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell Width="100">基本資料</asp:TableCell>
                    <asp:TableCell Width="175">指導教授</asp:TableCell>
                    <asp:TableCell Width="175">共同指導教授</asp:TableCell>
                    <asp:TableCell Width="175">共同指導教授</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell>姓名</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell>學校系(所)</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell>學歷</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell>經歷</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell>通訊地址</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell>聯絡電話</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table ID="Bottom_Here" runat="server" Height="25px" HorizontalAlign="Center" Width="800px" BorderStyle="None">
                <asp:TableRow HorizontalAlign="Right">
                    <asp:TableCell>
                        <!--重置已選擇的指導教授-->
                        <asp:Button ID="Reset" runat="server" Text="重置"  OnClick="Clean" ForeColor="Black" />
                        <!--送出已選擇的指導教授-->
                        <asp:Button ID="Submit" runat="server" Text="送出" OnClick="Update" ForeColor="Black"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
</asp:Content>
