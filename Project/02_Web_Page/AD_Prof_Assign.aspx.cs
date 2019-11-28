using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

 namespace Project._02_Web_Page {
    public partial class AD_Prof_Assign : System.Web.UI.Page {

        //連結資料庫，命名為cnStr
        //@"資料來源=(本地資料庫)\"
        string CnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                    "AttachDBFilename=|DataDirectory|Project_Db.mdf";

        DropDownList Selected_Batch_DDL;
        GridView Selected_GridView_GV;

        protected void Page_Load (object sender, EventArgs e) {

        }

        protected void Batch_DDL_SelectedIndexChanged (object sender, EventArgs e) {

            Selected_Batch_DDL = (DropDownList) sender;

            Batch_DDL.DataBind ();
            Batch_DDL.SelectedValue = Selected_Batch_DDL.SelectedValue;

            Batch_DDL0.DataBind ();
            Batch_DDL0.SelectedValue = Selected_Batch_DDL.SelectedValue;

            int Batch = int.Parse (Selected_Batch_DDL.SelectedValue);

            Student_SDS.SelectCommand =
                "SELECT ID, Name, Ch_Title, First_Commit, Second_Commit, Third_Commit, First_Prof FROM Student WHERE Batch = " + Batch + ";";
            Teacher_SDS.SelectCommand =
                "SELECT * FROM [Teacher] , [ExamPoint_Log] WHERE Batch = " + Batch + ";";

            Student_GV.DataBind ();
            Student_GV_1.DataBind ();
            Teacher_GV.DataBind ();
            Teacher_GV_1.DataBind ();
        }

        protected void Student_GV_SelectedIndexChanged (object sender, EventArgs e) {
            
            Selected_GridView_GV = (GridView) sender;

            using (SqlConnection cn = new SqlConnection ())
            {
                cn.ConnectionString = CnStr;
                cn.Open ();
                //測試用
                //TEST_LB.Text = Selected_GridView_GV.Rows[1].Cells[2].Text;
            }
        }
    }
}