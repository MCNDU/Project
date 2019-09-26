using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Project._02_Web_Page
{
    public partial class User_Login : System.Web.UI.Page
    {
        //連結資料庫，命名為cnStr
        //@"資料來源=(本地資料庫)\"
        String cnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                    "AttachDBFilename=|DataDirectory|Project_Db.mdf";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] != null)
            {
                Session["Login"] = null;
            }
        }

        protected void Login(object sender, EventArgs e)
        {
            string sql =
                "Select * From User_Login Where [ID] = @ID " +
                "and [Password] = @Password";
            using (SqlConnection con = new SqlConnection(cnStr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = sql;
                    cmd.Parameters.AddWithValue("@ID", Account_TBX.Text);
                    cmd.Parameters.AddWithValue("@Password", Password_TBX.Text);

                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.HasRows)
                        {

                            Session["Login"] = "OK";
                            sdr.Read();
                            Session["ID"] = sdr["ID"].ToString();
                            Session["Password"] = sdr["Password"].ToString();
                            Session["Email"] = sdr["Email"].ToString();
                            Session["Chinese_name"] = sdr["Name"].ToString();

                            if (sdr.GetValue(0).ToString() == "Student")
                            {
                                Response.Redirect("HomePage_Student.aspx");
                            }

                            else if (sdr.GetValue(0).ToString() == "Teacher")
                            {
                                Response.Redirect("HomePage_Teacher.aspx");
                            }

                            else if (sdr.GetValue(0).ToString() == "Committee")
                            {
                                Response.Redirect("HomePage_Committee.aspx");
                            }

                            else
                            {
                                Response.Redirect("User_Login.aspx");
                            }
                        }
                        else
                        {
                            Alert_LB.Text = "<script>window.alert(\"帳號或密碼錯誤\");</script>";
                            return;
                        }
                    }
                    con.Close();
                }
            }
        }
    }
}