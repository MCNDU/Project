using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Project._01_Administrator {
    public partial class AD_Prof_Assign : System.Web.UI.Page {

        // 連結資料庫的字串
        readonly String ConStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                        "AttachDBFilename=|DataDirectory|Project_Db.mdf";

        // 儲存真實資料的ST_dataTable(儲存教師編號用作轉換)
        DataTable ST_dataTable = new DataTable ();

        /** 以下為各控制項內置的方法 **/
        // 頁面載入時，觸發此方法
        protected void Page_Load (object sender, EventArgs e) {

            // 第一次載入頁面時
            // 自動選擇最小的學期並顯示資料
            // (美觀，可避免尚未搜尋資料時的頁面空白)
            if (!IsPostBack) {
                Batch_DDL.SelectedIndex = 0;
                Batch_DDL.DataBind ();
                SemesterChanged (int.Parse (Batch_DDL.SelectedValue));
            }
        }

        // To Be Continue ==>>
        // 待修改
        private void GetProfDetail (DataTable dataTable, int row) {

            var PF_ID = dataTable.Rows[row][3];
            var Batch = int.Parse (Batch_DDL.SelectedValue);
            DataTable DT_dataTable = new DataTable ();

            string Transform_queryString =
            "SELECT Teacher.ID, Teacher.Name, Teacher.Department, Teacher.Job, Teacher.Degree, Teacher.Exp, Teacher.Address, Teacher.Field, ExamPoint_Log.Exam_Point " +
            "FROM Teacher CROSS JOIN ExamPoint_Log " +
            "WHERE (ExamPoint_Log.Batch = " + Batch + ") AND (ExamPoint_Log.ID = " + PF_ID + ") AND (Teacher.ID = " + PF_ID + ")";

            SqlConnection connection = new SqlConnection (ConStr);
            SqlDataAdapter adapter = new SqlDataAdapter (Transform_queryString, connection);

            // 將取得的資料放入dataTable
            adapter.Fill (DT_dataTable);

            // To Be Continue ==>>
            // 分頁功能
            Teacher_DV.DataSource = DT_dataTable;
            Teacher_DV.DataBind ();
        }

        protected void Batch_DDL_SelectedIndexChanged (object sender, EventArgs e) {

            // 抓取使用者所選期別並刷新資料表格
            SemesterChanged (int.Parse (Batch_DDL.SelectedValue));
        }

        // 當使用者選擇 Student_GV內某一列(Row)時，觸發此方法
        protected void Student_GV_SelectedIndexChanged (object sender, EventArgs e) {

            // 承接自控制項傳入的資料以精簡程式碼
            string ID = Student_GV.SelectedValue.ToString ();

            // 傳送資料至Studnet_DV以顯示被選擇的該名研究生資料
            Student_SDS_ForDV.SelectCommand =
            "SELECT ID, Name, Ch_Title, First_Commit, Second_Commit, Third_Commit, First_Prof FROM Student WHERE ID = " + ID + ";";
            Student_DV.DataBind ();

            int DV_Row = 3;
            int GV_Cell = 5;

            for (var pointer = 0; pointer <= 3; pointer++) {
                Student_DV.Rows[DV_Row + pointer].Cells[1].Text = Student_GV.SelectedRow.Cells[GV_Cell + pointer].Text;
            }

            // 取得當前研究生資料傳送資料至Teacher_DV
            // 以顯示分配給該名研究生之三名審查委員資料
            // 且依據順序放置於Teacher_DV之1、2、3分頁
            string ST_queryString =
                "SELECT ID, Name, Ch_Title, First_Prof, Second_Commit, Third_Commit, First_Commit FROM [Student] WHERE Batch = " + int.Parse (Batch_DDL.SelectedValue) + ";";

            Getdata (ST_dataTable, ST_queryString);
            GetProfDetail (ST_dataTable, Student_GV.SelectedIndex);
        }
        /** 以上為各控制項內置的方法 **/



        /** 以下為個控制項運作時，將會呼叫使用的方法 **/
        // 隨使用者所選學期，刷新所有資料表格的方法
        private void SemesterChanged (int Batch) {

            // 取得該期教師資料
            DataTable PF_dataTable = new DataTable ();
            string PF_queryString =
                "SELECT * FROM [Teacher] , [ExamPoint_Log] WHERE Batch = " + Batch + ";";

            Getdata (PF_dataTable, PF_queryString);
            Teacher_GV.DataSource = PF_dataTable;
            Teacher_GV.DataBind ();

            // 取得該期研究生資料 及 資料轉換功能(教師編號轉換姓名)
            string ST_queryString =
                "SELECT ID, Name, Ch_Title, First_Prof, Second_Commit, Third_Commit, First_Commit FROM [Student] WHERE Batch = " + Batch + ";";

            Getdata (ST_dataTable, ST_queryString);
            Transform (Student_GV, ST_dataTable, 3, 6);
        }

        // 讓虛擬表格取得資料的方法
        private void Getdata (DataTable dataTable, String queryString) {
            
            // 連結至資料庫並執行指令(也就是queryString)
            SqlConnection connection = new SqlConnection (ConStr);
            SqlDataAdapter adapter = new SqlDataAdapter (queryString, connection);

            // 將取得的資料放入dataTable
            adapter.Fill (dataTable);
            
            // 如果沒有相關資料，新增三行空白列(維持版面)
            if (dataTable.Rows.Count == 0) {
                for (var r = 0; r < 3; r++) {
                    dataTable.Rows.Add ();
                }
            }
        }

        // 處理學生資料的方法
        // 資料庫內，研究生指導教師、審查委員等等之資料
        // 其記錄方式均透過教師編號完成(避免有教師同名)
        // 因此在實際呈現給使用者之前，需先行轉換為與編號相對應之教師名稱
        // 轉換順序：dataTable -> 資料表查詢 -> gridView
        // 位置對應：dataTable[0][0] <=> gridView[0][2]
        private void Transform (GridView gridView, DataTable dataTable, int col_Start, int col_End) {

            gridView.DataSource = dataTable;
            gridView.DataBind ();

            int row_Sum = dataTable.Rows.Count;

            // 轉換過程為迴圈(逐列逐行轉換)
            for (int row_Current = 0; row_Current < row_Sum; row_Current++) {
                for (int col_Current = col_Start; col_Current <= col_End; col_Current++) {

                    // 如果資料為空(該研究生並沒有指導老師or審查委員)
                    // 將轉換為空字串填入表格
                    if ( String.IsNullOrEmpty (dataTable.Rows[row_Current][col_Current].ToString ()) ) {
                        gridView.Rows[row_Current].Cells[col_Current + 2].Text = "";
                    }
                    // 如果資料不為空，進行查詢並填入結果
                    else {
                        // 自dataTable中抓取教師編號
                        var PF_ID = dataTable.Rows[row_Current][col_Current];

                        // 以教師編號為索引，自資料表Teacher中抓取對應資料列
                        String Transform_queryString =
                            "SELECT Name FROM [Teacher] WHERE ID = " + PF_ID + ";";

                        SqlConnection connection = new SqlConnection (ConStr);
                        SqlCommand command = new SqlCommand (Transform_queryString, connection);
                        connection.Open ();

                        SqlDataReader dataReader = command.ExecuteReader ();
                        dataReader.Read ();

                        // 將資料列中教師姓名放置gridview中對應的位置
                        gridView.Rows[row_Current].Cells[col_Current + 2].Text = dataReader.GetString (0);
                        
                        connection.Close ();
                    }
                }
            }
        }
        /** 以上為個控制項運作時，將會呼叫使用的方法 **/
    }
}