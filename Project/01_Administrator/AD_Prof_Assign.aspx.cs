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

            // 取得當前研究生資料傳送資料至Commit_DV
            // 以顯示分配給該名研究生之三名審查委員資料
            // 且依據順序放置於Commit_DV之1、2、3分頁
            string ST_queryString =
                "SELECT ID, Name, Ch_Title, First_Prof, First_Commit, Second_Commit, Third_Commit FROM [Student] WHERE Batch = " + int.Parse (Batch_DDL.SelectedValue) + ";";

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
                "SELECT ID, Name, Ch_Title, First_Prof, First_Commit, Second_Commit, Third_Commit FROM [Student] WHERE Batch = " + Batch + ";";

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

        //當使用者選取Student_GV之中某一特定研究生時，
        //顯示審查委員資料的三個Commit_DV會分別顯示三名委員的詳細資料
        private void GetProfDetail (DataTable dataTable, int row) {

            // semester 使用者所選學期
            // Details_DataTable 儲存查詢到的三筆審查委員資料
            var semester = int.Parse (Batch_DDL.SelectedValue);

            //定義Details_DataTable及內部資料行(要有那些欄位)
            DataTable Details_DataTable = new DataTable ();
            Details_DataTable.Columns.Add ("ID");
            Details_DataTable.Columns.Add ("Name");
            Details_DataTable.Columns.Add ("Department");
            Details_DataTable.Columns.Add ("Job");
            Details_DataTable.Columns.Add ("Degree");
            Details_DataTable.Columns.Add ("Exp");
            Details_DataTable.Columns.Add ("Address");
            Details_DataTable.Columns.Add ("Field");
            Details_DataTable.Columns.Add ("Exam_Point");

            SqlConnection connection = new SqlConnection (ConStr);
            DataSet dataSet = new DataSet ();

            for (int col = 4; col <= 6; col++) {
            
                // PF_ID 教師編號
                var PF_ID = dataTable.Rows[row][col];

                //查詢指令
                string Transform_queryString =
                "SELECT Teacher.ID, Teacher.Name, Teacher.Department, Teacher.Job, Teacher.Degree, Teacher.Exp, Teacher.Address, Teacher.Field, ExamPoint_Log.Exam_Point " +
                "FROM Teacher CROSS JOIN ExamPoint_Log " +
                "WHERE (ExamPoint_Log.Batch = " + semester + " OR ExamPoint_Log.Batch = N'0' ) AND (ExamPoint_Log.ID = " + PF_ID + ") AND (Teacher.ID = " + PF_ID + ")";
                
                //將查詢到的資料填入dataset中，名為4、5、6的三個table
                //註：table名稱乃對應Student_DV的4、5、6列
                //資料傳送路徑：SQL -> adapter -> dataset -> 三個Commit_DV
                SqlDataAdapter dataAdapter = new SqlDataAdapter ();
                dataAdapter.TableMappings.Add ("Table", col.ToString ());
                connection.Open ();

                SqlCommand command = new SqlCommand (Transform_queryString, connection) {
                    CommandType = CommandType.Text
                };
                dataAdapter.SelectCommand = command;

                dataAdapter.Fill (dataSet);

                connection.Close ();
            }

            // 將Commit_DV的資料來源綁定
            // 已填入三筆審查委員資料的dataTable
            Commit_DV_1.DataSource = dataSet.Tables["4"];
            Commit_DV_1.DataBind ();
            Commit_DV_2.DataSource = dataSet.Tables["5"];
            Commit_DV_2.DataBind ();
            Commit_DV_3.DataSource = dataSet.Tables["6"];
            Commit_DV_3.DataBind ();
        }

        //使用者可點選任一Commit_DV的下拉式選單以更換該研究生的審查委員

        /** 以上為個控制項運作時，將會呼叫使用的方法 **/
    }
}