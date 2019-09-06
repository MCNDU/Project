using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Project._02_Web_Page {
    public partial class Teacher_Assign : System.Web.UI.Page {

        //連結資料庫，命名為cnStr
        //@"資料來源=(本地資料庫)\"
        String cnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                    "AttachDBFilename=|DataDirectory|Project_Db.mdf";

        //計算用資料
        static int Teacher_Amount = 0;
        static int Student_Amount = 0;

        protected void Page_Load (object sender, EventArgs e) {

            //計算資料庫內老師、學生數量
            Number_Count ("Adv_Pro", Teacher_Amount);
            Number_Count ("Choosen_One", Student_Amount);
        }

        //計算資料庫內老師、學生數量用
        private void Number_Count (String Data_Base, int Number) {
            using (SqlConnection cn = new SqlConnection ()) {

                cn.ConnectionString = cnStr;
                SqlDataAdapter SDA_Name = new SqlDataAdapter
                    ("SELECT * FROM " + Data_Base, cn);
                DataSet ds = new DataSet ();
                SDA_Name.Fill (ds, Data_Base);

                DataTable dt = ds.Tables [Data_Base];

                Number = 0;
                while (dt.Rows [Number] [0] != null) {
                    Number++;
                }

            }
        }

        //排序用
        class Node {

            //建立鏈結串列
            static Node [] Teacher;
            static LinkedList<Node> Teacher_List = new LinkedList<Node> (Teacher);

            //鏈結串列內資料
            String Teacher_Name;
            int Choose_Time_Remain = Teacher_Amount / Student_Amount;

            Node (String Teacher_Name, int Choose_Time_Remain) {
                this.Teacher_Name = Teacher_Name;
                this.Choose_Time_Remain = Choose_Time_Remain;
            }

            public static void Display (string Teacher_Name) {
                foreach (Node Read in Teacher_List) {

                }
                //網頁上條列老師姓名
            }

            public static void Add (string Teacher_Name, int Choose_Time_Remain) {
                Node insert = new Node (Teacher_Name, Choose_Time_Remain);
            }
        }
    }
}