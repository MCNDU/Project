using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace Project._02_Web_Page
{
    public partial class User_Login_Forget_Password : System.Web.UI.Page
    {

        String cnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                    "AttachDBFilename=|DataDirectory|Project_Db.mdf";

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Send_Password(object sender, EventArgs e)
        {

            string sql =
                "Select * From User_Login Where [ID] = @ID " +
                "and [Email] = @Email";

            using (SqlConnection con = new SqlConnection(cnStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = sql;
                    cmd.Parameters.AddWithValue("@ID", Enter_Account_TBX.Text);
                    cmd.Parameters.AddWithValue("@Email", Enter_Email_TBX.Text);

                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (!sdr.HasRows)
                        {
                            Alert_LB.Text = "<script>window.alert(\"帳號或Email錯誤\");</script>";
                            return;
                        }
                        else
                        {
                            sdr.Read();

                            using (MailMessage mm = new MailMessage("amehitomi0310@gmail.com", sdr["Email"].ToString()))
                            {
                                mm.Subject = "國防大學論文審查系統忘記密碼驗證信";
                                mm.Body = "你的密碼為:" + sdr["Password"].ToString();
                                mm.IsBodyHtml = true;
                                using (SmtpClient smtp = new SmtpClient())
                                {
                                    smtp.Host = "smtp.gmail.com";
                                    smtp.EnableSsl = true;
                                    NetworkCredential networkCred = new NetworkCredential("amehitomi0310@gmail.com", "FXSH10130201!");
                                    smtp.UseDefaultCredentials = true;
                                    smtp.Credentials = networkCred;
                                    smtp.Port = 587;
                                    smtp.Send(mm);
                                }
                            }
                            Alert_LB.Text = "驗證信已發送";
                            Alert_LB.Visible = true;
                        }
                    }
                }
            }
        }
    }
}