using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Project._03_Student {
    public partial class ST_Personalnfo : System.Web.UI.Page {
        String cnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                   "AttachDBFilename=|DataDirectory|Project_Db.mdf";

        protected void Page_Load (object sender, EventArgs e) {
            if (Session["Login"] != null) {
                Session["Login"] = null;
            }

            string sql =
                "Select * From User_Login Where [ID] = @ID ";

            using (SqlConnection con = new SqlConnection (cnStr)) {
                using (SqlCommand cmd = new SqlCommand ("select * from Teacher_Student where Student_ID = " + Session["ID"], con)) {
                    cmd.Connection = con;
                    cmd.CommandText = sql;
                    cmd.Parameters.AddWithValue ("@ID", Session["ID"]);

                    con.Open ();
                    cmd.Parameters.AddWithValue ("@Password", "[Password]");
                    SqlDataReader dr = cmd.ExecuteReader ();
                    dr.Read ();
                    con.Close ();
                }
            }
        }
    }
}