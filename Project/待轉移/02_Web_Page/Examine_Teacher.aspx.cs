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
    public partial class Examine_Teacher : System.Web.UI.Page {

        //連結資料庫，命名為cnStr
        //@"資料來源=(本地資料庫)\"
        String cnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                    "AttachDBFilename=|DataDirectory|Project_Db.mdf";

        //計算用資料
        int Choose_Time;
        int Choose_Time_Remain;
        int Teacher_Amount = 0;
        int Student_Amount = 0;

        protected void Page_Load (object sender, EventArgs e) {

        }

        //載入文件標題
        protected void Title_Load(object sender, EventArgs e)
        {
            using (SqlConnection cn = new SqlConnection())
            {
                cn.ConnectionString = cnStr;
                SqlDataAdapter AP_Name = new SqlDataAdapter
                    ("SELECT * FROM Choosen_One", cn);
                DataSet ds = new DataSet();
                AP_Name.Fill(ds, "Choosen_One");

                DataTable dt = ds.Tables["Choosen_One"];

                String S = dt.Rows[0][2].ToString();
                //this.Title.Rows[0].Cells[0].Text = "國防大學管理學院資訊管理學系在職組" + S + "期論文計劃書審查成績冊";
            }
            Refresh_Data();
        }

        //依據當前資料，重新整理出正確資訊
        private void Refresh_Data () {

            //計算資料庫內老師、學生數量用(需精簡程式碼)
            using (SqlConnection cn = new SqlConnection())
            {
                cn.ConnectionString = cnStr;
                SqlDataAdapter Name = new SqlDataAdapter
                    ("SELECT * FROM Choosen_One", cn);
                DataSet ds = new DataSet();
                Name.Fill(ds, "Choosen_One");

                DataTable dt = ds.Tables["Choosen_One"];

                Student_Amount = dt.Rows.Count;
            }

            using (SqlConnection cn = new SqlConnection())
            {
                cn.ConnectionString = cnStr;
                SqlDataAdapter Name = new SqlDataAdapter
                    ("SELECT * FROM Adv_Pro", cn);
                DataSet ds = new DataSet();
                Name.Fill(ds, "Adv_Pro");

                DataTable dt = ds.Tables["Adv_Pro"];

                Teacher_Amount = dt.Rows.Count;
            }

            //計算得知，每名教授至少需負擔Choose_Time名學生
            //並且會有 Student_Amount*3 - Teacher_Amount * Choose_Time 名教師需額外多負擔一名學生
            Choose_Time =  Student_Amount * 3 / Teacher_Amount;
            Choose_Time_Remain = Choose_Time;
        }

        //排序用
        //class Node {

        //    //建立鏈結串列
        //    static Node [] Teacher;
        //    static LinkedList<Node> Teacher_List = new LinkedList<Node> (Teacher);

        //    //鏈結串列內資料
        //    String Teacher_Name;

        //    Node (String Teacher_Name, int Choose_Time, int Choose_Time_Remain) {
        //        this.Teacher_Name = Teacher_Name;
        //        this.Choose_Time = Choose_Time;
        //        this.Choose_Time_Remain = Choose_Time_Remain;
        //    }

        //    //加入老師資料
        //    public static void Add (string Teacher_Name, int Choose_Time, int Choose_Time_Remain) {
        //        Node insert = new Node (Teacher_Name, Choose_Time, Choose_Time_Remain);
        //    }

        //    public static void Display (string Teacher_Name) {
        //        foreach (Node Read in Teacher_List) {

        //        }
        //        //網頁上條列老師姓名
        //    }

        //}
    }
}