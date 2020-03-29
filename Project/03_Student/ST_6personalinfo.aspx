<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ST_6personalinfo.aspx.cs" Inherits="Project._03_Student.ST_1mainpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>論文審查系統-學生首頁</title>
    <link rel="stylesheet" href="~/css/basicstructure.css" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
         <h1 style="background-color: #66CCFF; padding-top:20px; padding-bottom: 8px; font-family:微軟正黑體 ; color:#ffffff;
            box-shadow:0px 8px 8px 0px #808080 ">&nbsp碩士論文進修審查系統</h1><p><marquee behavior="scroll" direction="left" height="29" class="margu" font-family=微軟正黑體>
          碩士論文進修審查系統
        </marquee>
           <div class="vertical-menu">
            <a href="ST_1mainpage.aspx" class="active">Home</a>
            <a href="ST_6personalinfo.aspx">個人資料</a>
            <a href="ST_Choose_Prof.aspx">申請指導教授</a>
            <a href="ST_searchresult.aspx">查詢及列印指導教授申請結果</a>
            <a href="ST_handinthesis.aspx">申請論文計畫書審查</a>
            <a href="ST_replycomment.aspx">論文計畫書審查意見回覆</a>
            <a href="">論文口試</a>
            <a href="">論文加分</a>
            <a href="login.aspx">登出</a>
            </div>
            <div class = "info"> 
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="student_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="50px" Width="433px">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="student_id" HeaderText="學號" ReadOnly="True" SortExpression="student_id" />
                        <asp:BoundField DataField="student_password" HeaderText="密碼" SortExpression="student_password" />
                        <asp:BoundField DataField="name" HeaderText="姓名" ReadOnly="True" SortExpression="name" />
                        <asp:BoundField DataField="student_email" HeaderText="信箱" SortExpression="student_email" />
                        <asp:BoundField DataField="student_phone" HeaderText="連絡電話" SortExpression="student_phone" />
                        <asp:BoundField DataField="batch" HeaderText="期別" ReadOnly="True" SortExpression="batch" />
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:connectionString_new %>" DeleteCommand="DELETE FROM [student] WHERE [student_id] = @original_student_id AND [name] = @original_name AND (([student_password] = @original_student_password) OR ([student_password] IS NULL AND @original_student_password IS NULL)) AND (([student_email] = @original_student_email) OR ([student_email] IS NULL AND @original_student_email IS NULL)) AND (([student_phone] = @original_student_phone) OR ([student_phone] IS NULL AND @original_student_phone IS NULL)) AND (([batch] = @original_batch) OR ([batch] IS NULL AND @original_batch IS NULL))" InsertCommand="INSERT INTO [student] ([student_id], [name], [student_password], [student_email], [student_phone], [batch]) VALUES (@student_id, @name, @student_password, @student_email, @student_phone, @batch)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [student_id], [name], [student_password], [student_email], [student_phone], [batch] FROM [student] WHERE ([student_id] = @student_id)" UpdateCommand="UPDATE [student] SET [name] = @name, [student_password] = @student_password, [student_email] = @student_email, [student_phone] = @student_phone, [batch] = @batch WHERE [student_id] = @original_student_id AND [name] = @original_name AND (([student_password] = @original_student_password) OR ([student_password] IS NULL AND @original_student_password IS NULL)) AND (([student_email] = @original_student_email) OR ([student_email] IS NULL AND @original_student_email IS NULL)) AND (([student_phone] = @original_student_phone) OR ([student_phone] IS NULL AND @original_student_phone IS NULL)) AND (([batch] = @original_batch) OR ([batch] IS NULL AND @original_batch IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_student_id" Type="String" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_student_password" Type="String" />
                        <asp:Parameter Name="original_student_email" Type="String" />
                        <asp:Parameter Name="original_student_phone" Type="String" />
                        <asp:Parameter Name="original_batch" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="student_id" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="student_password" Type="String" />
                        <asp:Parameter Name="student_email" Type="String" />
                        <asp:Parameter Name="student_phone" Type="String" />
                        <asp:Parameter Name="batch" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="student_id" SessionField="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="student_password" Type="String" />
                        <asp:Parameter Name="student_email" Type="String" />
                        <asp:Parameter Name="student_phone" Type="String" />
                        <asp:Parameter Name="batch" Type="String" />
                        <asp:Parameter Name="original_student_id" Type="String" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_student_password" Type="String" />
                        <asp:Parameter Name="original_student_email" Type="String" />
                        <asp:Parameter Name="original_student_phone" Type="String" />
                        <asp:Parameter Name="original_batch" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
         </div>
    </form>
</body>
</html>