using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Project._02_Web_Page {
    public partial class Statistic_AdvPro : System.Web.UI.Page {

        String cnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                    "AttachDBFilename=|DataDirectory|Project_Db.mdf";
        protected void Page_Load (object sender, EventArgs e) {

        }

        protected void GridView1_Load (object sender, EventArgs e) {
            int R;

            for (R = 1; R <= this.GridView1.Rows.Count; R++) {
                this.GridView1.Rows [R-1].Cells [0].Text = R.ToString();
            }
        }

        protected void Title_Load (object sender, EventArgs e) {
            using (SqlConnection cn = new SqlConnection ()) {
                cn.ConnectionString = cnStr;
                SqlDataAdapter AP_Name = new SqlDataAdapter
                    ("SELECT * FROM Choosen_One", cn);
                DataSet ds = new DataSet ();
                AP_Name.Fill (ds, "Choosen_One");

                DataTable dt = ds.Tables ["Choosen_One"];

                String S = dt.Rows [0] [2].ToString ();
                this.Title.Rows [0].Cells [0].Text = "國防大學管理學院資訊管理學系在職組" + S + "期論文指導教授統計名冊";
            }
        }
        protected void Item_Load (object sender, EventArgs e) {
            this.Item_Title.Height = this.GridView1.Height;
        }
    }
}