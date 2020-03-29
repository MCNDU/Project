using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace Project._00_System {
    public partial class Login1 : System.Web.UI.Page {

        //連結資料庫，命名為cnStr
        //@"資料來源=(本地資料庫)\"
        readonly String cnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                    "AttachDBFilename=|DataDirectory|Project_Db.mdf";
        
        protected void Page_Load (object sender, EventArgs e) {

            if (Session["Login"] != null) {
                Session["Login"] = null;
            }

            if (Page.IsPostBack) {
                //BtnLogin_Click ();
            }

        }

        protected void BtnLogin_Click (object sender, EventArgs e) {
            
            string sql =
                "Select * From User_Login Where [ID] = @ID " +
                "and [Password] = @Password";
            using (SqlConnection con = new SqlConnection (cnStr)) {
                using (SqlCommand cmd = new SqlCommand ()) {
                    cmd.Connection = con;
                    cmd.CommandText = sql;
                    cmd.Parameters.AddWithValue ("@ID", Server.HtmlEncode (Account_IPT.Value));
                    cmd.Parameters.AddWithValue ("@Password", Server.HtmlEncode (Password_IPT.Value));

                    con.Open ();
                    using (SqlDataReader sdr = cmd.ExecuteReader ()) {
                        if (sdr.HasRows) {

                            Session["Login"] = "OK";
                            sdr.Read ();
                            Session["ID"] = sdr["ID"].ToString ();
                            Session["Password"] = sdr["Password"].ToString ();
                            Session["Email"] = sdr["Email"].ToString ();
                            Session["Chinese_Name"] = sdr["Chinese_Name"].ToString ();
                            Session["Activated"] = sdr["Activated"].ToString();

                            if (sdr["Activated"].ToString() == "0")
                            {
                                Response.Redirect("Login_Firsttime.aspx");
                            }

                            else if (sdr.GetValue (0).ToString () == "Student") {
                                Response.Redirect ("HomePage_Student.aspx");
                            }

                            else if (sdr.GetValue (0).ToString () == "Teacher") {
                                Response.Redirect ("HomePage_Teacher.aspx");
                            }

                            else if (sdr.GetValue (0).ToString () == "Admin") {
                                Response.Redirect ("../01_Administrator/AD_1mainpage.aspx");
                            }

                            else {
                                Response.Redirect ("Login.aspx");
                            }
                        }
                        else {
                            Alert_LB.Text = "<script>window.alert(\"帳號或密碼錯誤\");</script>";
                            return;
                        }
                    }
                    con.Close ();
                }
            }
        }
    }
}