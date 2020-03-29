<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PR_IN_personalinfo.aspx.cs" Inherits="Project._02_Professor.PR_IN_mainpage" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>論文審查系統-指導老師首頁</title>
    <link rel="stylesheet" href="~/css/basicstructure.css" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
         <h1 style="background-color: #66CCFF; padding-top:20px; padding-bottom: 8px; font-family:微軟正黑體 ; color:#ffffff;
            box-shadow:0px 8px 8px 0px #808080 ">&nbsp碩士論文進修審查系統</h1><p><marquee behavior="scroll" direction="left" height="29" class="margu" font-family=微軟正黑體>
          碩士論文進修審查系統
        </marquee>
           <div class="vertical-menu">
            <a href="PR_IN_mainpage.aspx" class="active">Home</a>
            <a href="PR_IN_personalinfo.aspx">個人資料</a>
            <a href="PR_IN_agreeinstruct.aspx">指導研究生與積點</a>
            <a href="PR_IN_viewproposalapp.aspx">論文計畫書審查</a>
            <a href="">論文口試</a>
            <a href="">論文加分</a>
            <a href="login.aspx">登出</a>
            </div>
            <div class = "info"> 
                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="teacher_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="50px" Width="337px">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="teacher_id" HeaderText="帳號" ReadOnly="True" SortExpression="teacher_id" />
                        <asp:BoundField DataField="teacher_password" HeaderText="密碼" SortExpression="teacher_password" />
                        <asp:BoundField DataField="teacher_name" HeaderText="姓名" ReadOnly="True" SortExpression="teacher_name" />
                        <asp:BoundField DataField="department" HeaderText="學系" ReadOnly="True" SortExpression="department" />
                        <asp:BoundField DataField="job" HeaderText="職稱" ReadOnly="True" SortExpression="job" />
                        <asp:BoundField DataField="degree" HeaderText="學歷" SortExpression="degree" />
                        <asp:BoundField DataField="experience" HeaderText="經歷" SortExpression="experience" />
                        <asp:BoundField DataField="address" HeaderText="地址" SortExpression="address" />
                        <asp:BoundField DataField="field" HeaderText="專業領域" SortExpression="field" />
                        <asp:BoundField DataField="teacher_email" HeaderText="信箱" SortExpression="teacher_email" />
                        <asp:BoundField DataField="teacher_phone" HeaderText="連絡電話" SortExpression="teacher_phone" />
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:connectionString_new %>" DeleteCommand="DELETE FROM [teacher] WHERE [teacher_id] = @original_teacher_id AND [teacher_name] = @original_teacher_name AND (([department] = @original_department) OR ([department] IS NULL AND @original_department IS NULL)) AND (([job] = @original_job) OR ([job] IS NULL AND @original_job IS NULL)) AND (([degree] = @original_degree) OR ([degree] IS NULL AND @original_degree IS NULL)) AND (([experience] = @original_experience) OR ([experience] IS NULL AND @original_experience IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([field] = @original_field) OR ([field] IS NULL AND @original_field IS NULL)) AND (([teacher_password] = @original_teacher_password) OR ([teacher_password] IS NULL AND @original_teacher_password IS NULL)) AND (([teacher_email] = @original_teacher_email) OR ([teacher_email] IS NULL AND @original_teacher_email IS NULL)) AND (([teacher_phone] = @original_teacher_phone) OR ([teacher_phone] IS NULL AND @original_teacher_phone IS NULL))" InsertCommand="INSERT INTO [teacher] ([teacher_id], [teacher_name], [department], [job], [degree], [experience], [address], [field], [teacher_password], [teacher_email], [teacher_phone]) VALUES (@teacher_id, @teacher_name, @department, @job, @degree, @experience, @address, @field, @teacher_password, @teacher_email, @teacher_phone)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [teacher_id], [teacher_name], [department], [job], [degree], [experience], [address], [field], [teacher_password], [teacher_email], [teacher_phone] FROM [teacher] WHERE ([teacher_id] = @teacher_id)" UpdateCommand="UPDATE [teacher] SET [teacher_name] = @teacher_name, [department] = @department, [job] = @job, [degree] = @degree, [experience] = @experience, [address] = @address, [field] = @field, [teacher_password] = @teacher_password, [teacher_email] = @teacher_email, [teacher_phone] = @teacher_phone WHERE [teacher_id] = @original_teacher_id AND [teacher_name] = @original_teacher_name AND (([department] = @original_department) OR ([department] IS NULL AND @original_department IS NULL)) AND (([job] = @original_job) OR ([job] IS NULL AND @original_job IS NULL)) AND (([degree] = @original_degree) OR ([degree] IS NULL AND @original_degree IS NULL)) AND (([experience] = @original_experience) OR ([experience] IS NULL AND @original_experience IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([field] = @original_field) OR ([field] IS NULL AND @original_field IS NULL)) AND (([teacher_password] = @original_teacher_password) OR ([teacher_password] IS NULL AND @original_teacher_password IS NULL)) AND (([teacher_email] = @original_teacher_email) OR ([teacher_email] IS NULL AND @original_teacher_email IS NULL)) AND (([teacher_phone] = @original_teacher_phone) OR ([teacher_phone] IS NULL AND @original_teacher_phone IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_teacher_id" Type="String" />
                        <asp:Parameter Name="original_teacher_name" Type="String" />
                        <asp:Parameter Name="original_department" Type="String" />
                        <asp:Parameter Name="original_job" Type="String" />
                        <asp:Parameter Name="original_degree" Type="String" />
                        <asp:Parameter Name="original_experience" Type="String" />
                        <asp:Parameter Name="original_address" Type="String" />
                        <asp:Parameter Name="original_field" Type="String" />
                        <asp:Parameter Name="original_teacher_password" Type="String" />
                        <asp:Parameter Name="original_teacher_email" Type="String" />
                        <asp:Parameter Name="original_teacher_phone" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="teacher_id" Type="String" />
                        <asp:Parameter Name="teacher_name" Type="String" />
                        <asp:Parameter Name="department" Type="String" />
                        <asp:Parameter Name="job" Type="String" />
                        <asp:Parameter Name="degree" Type="String" />
                        <asp:Parameter Name="experience" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="field" Type="String" />
                        <asp:Parameter Name="teacher_password" Type="String" />
                        <asp:Parameter Name="teacher_email" Type="String" />
                        <asp:Parameter Name="teacher_phone" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="teacher_id" SessionField="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="teacher_name" Type="String" />
                        <asp:Parameter Name="department" Type="String" />
                        <asp:Parameter Name="job" Type="String" />
                        <asp:Parameter Name="degree" Type="String" />
                        <asp:Parameter Name="experience" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="field" Type="String" />
                        <asp:Parameter Name="teacher_password" Type="String" />
                        <asp:Parameter Name="teacher_email" Type="String" />
                        <asp:Parameter Name="teacher_phone" Type="String" />
                        <asp:Parameter Name="original_teacher_id" Type="String" />
                        <asp:Parameter Name="original_teacher_name" Type="String" />
                        <asp:Parameter Name="original_department" Type="String" />
                        <asp:Parameter Name="original_job" Type="String" />
                        <asp:Parameter Name="original_degree" Type="String" />
                        <asp:Parameter Name="original_experience" Type="String" />
                        <asp:Parameter Name="original_address" Type="String" />
                        <asp:Parameter Name="original_field" Type="String" />
                        <asp:Parameter Name="original_teacher_password" Type="String" />
                        <asp:Parameter Name="original_teacher_email" Type="String" />
                        <asp:Parameter Name="original_teacher_phone" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
         </div>
    </form>
</body>
</html>
