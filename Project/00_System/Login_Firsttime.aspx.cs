using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace Project._00_System
{
    public partial class Login_Firsttime : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnEnter_Click(object sender, EventArgs e){

            string activationCode = Guid.NewGuid().ToString();
            string constr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|Project_Db.mdf";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd1 = new SqlCommand("UPDATE User_Login SET [ActivationCode] = @ActivationCode WHERE [ID] = @ID", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        //cmd1.CommandType = CommandType.Text;
                        cmd1.Parameters.AddWithValue("@ID", Session["ID"]);
                        cmd1.Parameters.AddWithValue("@ActivationCode", activationCode);
                        cmd1.Connection = con;
                        con.Open();
                        cmd1.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }

            
            using (MailMessage mm = new MailMessage("thesismis2019@gmail.com", Server.HtmlEncode(Email_IPT.Value)))
            {
                mm.From = new MailAddress("thesismis2019@gmail.com", "系統發信");
                //mm.To = new MailAddress(dr["Email"].ToString());
                mm.BodyEncoding = System.Text.Encoding.UTF8;
                mm.Subject = "國防大學碩士論文進修審查系統帳號驗證信";
                string body = "<br /><br />首次登入需要進行密碼修改，請點選以下網址進行驗證";
                body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("Login_Firsttime.aspx", "Activation.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a>";
                mm.Body = body;
                mm.IsBodyHtml = true;
                using (SmtpClient smtp = new SmtpClient())
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential networkCred = new NetworkCredential("thesismis2019@gmail.com", "1qaz2wsx#EDC");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = networkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);

                }
            }

            Alert_LB.Text = "<script>window.alert(\"郵件已傳送\");</script>";

        }
    }
}