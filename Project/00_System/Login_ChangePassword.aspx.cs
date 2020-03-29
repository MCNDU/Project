using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Project._00_System
{
    public partial class Login_ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void EnterBtn_Click(object sender, EventArgs e){

            if (Newpassword_IPT.Value.Length < 6 || Newpassword_IPT.Value.Length > 12)
            {
                Alert_LB.Text += "<script>window.alert(\"密碼限制長度大於6小於12\");</script>";
                return;
            }

            foreach (char ch in Newpassword_IPT.Value)
            {
                if (char.IsDigit(ch) == false && char.IsLetter(ch) == false)
                {
                    Alert_LB.Text += "<script>window.alert(\"密碼限制字元為字母及數字\");</script>";
                    return;
                }
            }

            if (Newpassword_IPT.Value == Session["ID"].ToString())
            {
                Alert_LB.Text += "<script>window.alert(\"密碼請勿和帳號相同\");</script>";
                return;
            }

            if (Newpassword_IPT.Value != Varifypassword_IPT.Value)
            {
                Alert_LB.Text += "<script>window.alert(\"兩次輸入密碼不同\");</script>";
                return;
            }

            String cnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                    "AttachDBFilename=|DataDirectory|newdata.mdf";
            string sql_pro =
                "UPDATE teacher SET [teacher_password] = @teacher_password WHERE [teacher_id] = @teacher_id ";
            string sql_stu =
                "UPDATE student SET [student_password] = @student_password WHERE [student_id] = @student_id ";
            bool isProfessor = Session["ID"].ToString().Contains("ndmc");

            if(isProfessor)
            {
                SqlConnection con = new SqlConnection(cnStr);
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr = cmd.ExecuteReader();
                Session["ID"] = dr["teacher_id"].ToString();
                cmd.Connection = con;
                cmd.CommandText = sql_pro;
                cmd.Parameters.AddWithValue("@teacher_id", Session["ID"]);
                cmd.Parameters.AddWithValue("@teacher_password", Server.HtmlEncode(Newpassword_IPT.Value));
            }
            else
            {
                SqlConnection con = new SqlConnection(cnStr);
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr = cmd.ExecuteReader();
                Session["ID"] = dr["student_id"].ToString();
                cmd.Connection = con;
                cmd.CommandText = sql_stu;
                cmd.Parameters.AddWithValue("@student_id", Session["ID"]);
                cmd.Parameters.AddWithValue("@student_password", Server.HtmlEncode(Newpassword_IPT.Value));
            }
            

            Alert_LB.Text = "密碼已更改";
        }
    }
}