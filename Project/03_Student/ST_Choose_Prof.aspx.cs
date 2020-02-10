using System;
using System.Text;
using System.Threading;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace Project._03_Student {
    public partial class ST_Choose_Prof : System.Web.UI.Page {
        //連結資料庫，命名為cnStr
        //@"資料來源=(本地資料庫)\"
        String cnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                    "AttachDBFilename=|DataDirectory|Project_Db.mdf";

        protected void Page_Load (object sender, EventArgs e) {

        }

        //重置所有指導教授
        protected void Clean (object sender, System.EventArgs e) {
            int Row, Col;

            for (Row = 1; Row <= 6; Row++) {
                for (Col = 1; Col <= 3; Col++) {
                    this.Select_AP_Table.Rows[Row].Cells[Col].Text = null;
                }
            }
        }

        protected void Update (object sender, System.EventArgs e) {
            using (SqlConnection cn = new SqlConnection ()) {
                cn.ConnectionString = cnStr;
                cn.Open ();
                //SqlCommand cmd = new SqlCommand ("", cn);
                //cmd.CommandType = CommandType.StoredProcedure;
                string search_ID_1 = CAP_Name_1.Text;
                string search_ID_2 = CAP_Name_2.Text;
                string search_ID_3 = CAP_Name_3.Text;
                if (search_ID_1 != "" && search_ID_2 == "" && search_ID_3 == "")
                {
                    string sqlStr = "SELECT ID FROM Teacher WHERE Name = '" + search_ID_1 + "'";
                    SqlCommand cmd = new SqlCommand(sqlStr, cn);
                    string x = cmd.ExecuteScalar().ToString();
                    StringBuilder SQL_str = new StringBuilder();
                    SQL_str.Append("insert into Teacher_Student(Teacher_ID,Student_ID,Comment_Professor,Permission) values('" + x + "','" + ID + "','yes','1')");
                    using (SqlCommand cmp = new SqlCommand(SQL_str.ToString(), cn))
                    {
                        cmp.ExecuteNonQuery(); //執行sql命令
                        //Finish.Visible = true;
                        //Finish.Text = "選擇指導老師成功......";  //成功訊息
                        //Response.Redirect("Personalinformation.aspx");
                    }
                }
                else if (search_ID_1 != "" && search_ID_2 != "" && search_ID_3 == "")
                {
                    string sqlFir = "SELECT ID FROM Teacher WHERE Name = '" + search_ID_1 + "'";
                    string sqlSec = "SELECT ID FROM Teacher WHERE Name = '" + search_ID_2 + "'";
                    SqlCommand cmd_F = new SqlCommand(sqlFir, cn);
                    SqlCommand cmd_S = new SqlCommand(sqlSec, cn);
                    string x = cmd_F.ExecuteScalar().ToString();
                    string y = cmd_S.ExecuteScalar().ToString();
                    StringBuilder SQL_Fir = new StringBuilder();
                    StringBuilder SQL_Sec = new StringBuilder();
                    SQL_Fir.Append("insert into Teacher_Student(Teacher_ID,Student_ID,Comment_Professor,Permission) values('" + x + "','" + ID + "','yes','0.5')");  //新增sql語法內容---insert into
                    SQL_Sec.Append("insert into Teacher_Student(Teacher_ID,Student_ID,Comment_Professor,Permission) values('" + y + "','" + ID + "','no_1','0.5')");  //新增sql語法內容---insert into
                    using (SqlCommand cmp = new SqlCommand(SQL_Fir.ToString(), cn))
                    {
                        cmp.ExecuteNonQuery(); //執行sql命令
                    }
                    using (SqlCommand cmp = new SqlCommand(SQL_Sec.ToString(), cn))
                    {
                        cmp.ExecuteNonQuery(); //執行sql命令
                    }
                    //Finish.Visible = true;
                    //Finish.Text = "選擇指導老師成功......";  //成功訊息
                    Response.Redirect("Personalinformation.aspx");

                }
                else if (search_ID_1 != "" && search_ID_2 != "" && search_ID_3 != "")
                {
                    string sqlFir = "SELECT ID FROM Teacher WHERE Name = '" + search_ID_1 + "'";
                    string sqlSec = "SELECT ID FROM Teacher WHERE Name = '" + search_ID_2 + "'";
                    string sqlTir = "SELECT ID FROM Teacher WHERE Name = '" + search_ID_3 + "'";
                    SqlCommand cmd_F = new SqlCommand(sqlFir, cn);
                    SqlCommand cmd_S = new SqlCommand(sqlSec, cn);
                    SqlCommand cmd_T = new SqlCommand(sqlTir, cn);
                    string x = cmd_F.ExecuteScalar().ToString();
                    string y = cmd_S.ExecuteScalar().ToString();
                    string z = cmd_T.ExecuteScalar().ToString();
                    StringBuilder SQL_Fir = new StringBuilder();
                    StringBuilder SQL_Sec = new StringBuilder();
                    StringBuilder SQL_Tir = new StringBuilder();
                    SQL_Fir.Append("insert into Teacher_Student(Teacher_ID,Student_ID,Comment_Professor,Permission) values('" + x + "','" + ID + "','yes','0.5')");  //新增sql語法內容---insert into
                    SQL_Sec.Append("insert into Teacher_Student(Teacher_ID,Student_ID,Comment_Professor,Permission) values('" + y + "','" + ID + "','no_1','0.5')");  //新增sql語法內容---insert into
                    SQL_Tir.Append("insert into Teacher_Student(Teacher_ID,Student_ID,Comment_Professor,Permission) values('" + z + "','" + ID + "','no_2','0.5')");  //新增sql語法內容---insert into
                    using (SqlCommand cmp = new SqlCommand(SQL_Fir.ToString(), cn))
                    {
                        cmp.ExecuteNonQuery(); //執行sql命令
                    }
                    using (SqlCommand cmp = new SqlCommand(SQL_Sec.ToString(), cn))
                    {
                        cmp.ExecuteNonQuery(); //執行sql命令
                    }
                    using (SqlCommand cmp = new SqlCommand(SQL_Tir.ToString(), cn))
                    {
                        cmp.ExecuteNonQuery(); //執行sql命令
                    }
                    //Finish.Visible = true;
                    //Finish.Text = "選擇指導老師成功......";  //成功訊息
                    Response.Redirect("Personalinformation.aspx");
                }
                else{

                }

                cn.Close();
                //cmd.Parameters.Add (new SqlParameter("@", SqlDbType.));
            }
        }

        protected void Adv_Changed (object sender, EventArgs e) {
            DropDownList ddl = (DropDownList) sender;
            string DDL_Id = ddl.ID;
            string DDL_Value = ddl.SelectedValue;
            int DDL_Index = ddl.SelectedIndex;

            Table Tb;
            TextBox TB;

            //將各下拉式選單與各自的自訂指導教授欄位相關聯
            if (DDL_Id == "Select_Adv_1") {
                Tb = this.Table_Costom_1;
                TB = this.Adv_PointRemain_1;
            }
            else if (DDL_Id == "Select_Adv_2") {
                Tb = this.Table_Costom_2;
                TB = this.Adv_PointRemain_2;
            }
            else {
                Tb = this.Table_Costom_3;
                TB = this.Adv_PointRemain_3;
            }

            //依照下拉式選單的內容，決定自訂指導教授欄位的顯示與否
            if (DDL_Value == "Custom") {
                Tb.Visible = true;
            }
            else {
                Tb.Visible = false;
            }

            //根據下拉式選單內容，自資料庫取出相對應的「剩餘點數」
            if (DDL_Index > 1) {
                int R = DDL_Index - 2;

                using (SqlConnection cn = new SqlConnection ()) {
                    cn.ConnectionString = cnStr;
                    SqlDataAdapter AP_Name = new SqlDataAdapter
                        ("SELECT * FROM Adv_Pro ", cn);
                    DataSet ds = new DataSet ();
                    AP_Name.Fill (ds, "Adv_Pro");

                    DataTable dt = ds.Tables["Adv_Pro"];

                    TB.Text = dt.Rows[R][7].ToString ();
                }
            }
        }

        protected void Choose (object sender, EventArgs e) {
            Button BT = (Button) sender;
            string BT_Id = BT.ID;

            DropDownList ddl;

            Table Tb = this.Select_AP_Table;
            int Col;


            if (BT_Id == "Choose_Adv_1" || BT_Id == "Choose_Adv_2" || BT_Id == "Choose_Adv_3") {
                if (BT_Id == "Choose_Adv_1") {
                    ddl = this.Select_Adv_1;
                    Col = 1;
                }

                else if (BT_Id == "Choose_Adv_2") {
                    ddl = this.Select_Adv_2;
                    Col = 2;
                }

                else {
                    ddl = this.Select_Adv_3;
                    Col = 3;
                }

                int DDL_Index = ddl.SelectedIndex;
                int DDL_Sum = ddl.Items.Count;

                if (DDL_Index > 1) {
                    int R = DDL_Index - 2;

                    using (SqlConnection cn = new SqlConnection ()) {
                        cn.ConnectionString = cnStr;
                        SqlDataAdapter AP_Name = new SqlDataAdapter
                            ("SELECT * FROM Adv_Pro ", cn);
                        DataSet ds = new DataSet ();
                        AP_Name.Fill (ds, "Adv_Pro");

                        DataTable dt = ds.Tables["Adv_Pro"];

                        int count;
                        for (count = 0; count <= 5; count++) {
                            Tb.Rows[count + 1].Cells[Col].Text = dt.Rows[R][count].ToString ();
                        }
                    }
                }
            }

            //點選的按鍵為「自訂指導教授」
            else {

            }
        }

        protected void Custom1 (object sender, System.EventArgs e)
        {
            FAP_Name.Text = CAP_Name_1.Text;
            FAP_School.Text = CAP_School_1.Text;
            FAP_Edu.Text = CAP_Edu_1.Text;
            FAP_Exp.Text = CAP_Exp_1.Text;
            FAP_Address.Text = CAP_Address_1.Text;
            FAP_Phone.Text = CAP_Phone_1.Text;
        }
        protected void Custom2 (object sender, System.EventArgs e)
        {
            SAP_Name.Text = CAP_Name_2.Text;
            SAP_School.Text = CAP_School_2.Text;
            SAP_Edu.Text = CAP_Edu_2.Text;
            SAP_Exp.Text = CAP_Exp_2.Text;
            SAP_Address.Text = CAP_Address_2.Text;
            SAP_Phone.Text = CAP_Phone_2.Text;
        }
        protected void Custom3(object sender, System.EventArgs e)
        {
            TAP_Name.Text = CAP_Name_3.Text;
            TAP_School.Text = CAP_School_3.Text;
            TAP_Edu.Text = CAP_Edu_3.Text;
            TAP_Exp.Text = CAP_Exp_3.Text;
            TAP_Address.Text = CAP_Address_3.Text;
            TAP_Phone.Text = CAP_Phone_3.Text;
        }
    }
}