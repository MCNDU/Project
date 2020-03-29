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
                    "AttachDBFilename=|DataDirectory|newdata.mdf";
        
        protected void Page_Load (object sender, EventArgs e) {

            if (Session["Login"] != null) {
                Session["Login"] = null;
            }

            if (Page.IsPostBack) {
                //BtnLogin_Click ();
            }

        }

        protected void BtnLogin_Click (object sender, EventArgs e) {
            
            string sql_stu =
                "Select * From student Where [student_id] = @student_id " +
                "and [student_password] = @student_password";
            string sql_pro =
                "Select * From teacher Where [teacher_id] = @teacher_id " +
                "and [teacher_password] = @teacher_password";

            bool isProfessor = Account_IPT.Value.Contains("ndmc");

            using (SqlConnection con = new SqlConnection (cnStr)) {
                using (SqlCommand cmd = new SqlCommand ()) {
                    cmd.Connection = con;
                    if(isProfessor)
                    {
                        cmd.CommandText = sql_pro;
                        cmd.Parameters.AddWithValue("@teacher_id", Server.HtmlEncode(Account_IPT.Value));
                        cmd.Parameters.AddWithValue("@teacher_password", Server.HtmlEncode(Password_IPT.Value));
                    }
                    else
                    {
                        cmd.CommandText = sql_stu;
                        cmd.Parameters.AddWithValue("@student_id", Server.HtmlEncode(Account_IPT.Value));
                        cmd.Parameters.AddWithValue("@student_password", Server.HtmlEncode(Password_IPT.Value));
                    }
                    

                    con.Open ();
                    using (SqlDataReader sdr = cmd.ExecuteReader ()) {
                        if (sdr.HasRows)
                        {

                            Session["Login"] = "OK";
                            sdr.Read();
                            if (isProfessor)
                            {
                                Session["ID"] = sdr["teacher_id"].ToString();
                                Session["Password"] = sdr["teacher_password"].ToString();
                                Session["Activated"] = sdr["Activated"].ToString();
                                Session["is_admin"] = sdr["is_admin"].ToString();

                                if (sdr["Activated"].ToString() == "0")
                                {
                                    Response.Redirect("Login_Firsttime.aspx");
                                }
                                else if (sdr["Activated"].ToString() == "1")
                                {
                                    if (sdr["is_admin"].ToString() == "1")
                                    {
                                        Response.Redirect("../02_Professor/PR_selectroleAD.aspx");
                                    }
                                    else
                                    {
                                        Response.Redirect("../02_Professor/PR_selectrole.aspx");
                                    }
                                }
                                else
                                {
                                    Response.Redirect("Login.aspx");
                                }


                            }
                            else
                            {
                                Session["ID"] = sdr["student_id"].ToString();
                                Session["Password"] = sdr["student_password"].ToString();
                                Session["Activated"] = sdr["Activated"].ToString();

                                if (sdr["Activated"].ToString() == "0")
                                {
                                    Response.Redirect("Login_Firsttime.aspx");
                                }
                                else if (sdr["Activated"].ToString() == "1")
                                {
                                    Response.Redirect("../03_Student/ST_1mainpage.aspx");
                                }
                                else
                                {
                                    Response.Redirect("Login.aspx");
                                }

                            }
                        }


                        else
                        {
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