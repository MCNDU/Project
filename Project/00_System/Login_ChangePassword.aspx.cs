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

            //SqlDataSource1.Update();
            String cnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                    "AttachDBFilename=|DataDirectory|Project_Db.mdf";
            string sql =
                "UPDATE User_Login SET [Password] = @Password WHERE [ID] = @ID ";
            SqlConnection con = new SqlConnection(cnStr);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr = cmd.ExecuteReader();
            Session["ID"] = dr["ID"].ToString();
            cmd.Connection = con;
            cmd.CommandText = sql;
            cmd.Parameters.AddWithValue("@ID", Session["ID"]);
            cmd.Parameters.AddWithValue("@Password", Server.HtmlEncode(Newpassword_IPT.Value));

            Alert_LB.Text = "密碼已更改";
        }
    }
}