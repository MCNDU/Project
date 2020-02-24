using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project._01_Administrator {
    public partial class AD_Prof_Assign : System.Web.UI.Page {

        /** 以下為大部分功能運作時都會用到的通用變數 **/
        // 連結資料庫的字串
        readonly String ConStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                        "AttachDBFilename=|DataDirectory|Project_Db.mdf";

        // 儲存真實資料的ST_dataTable(儲存教師編號用作轉換)
        DataTable ST_dataTable = new DataTable ();

        /** 以上為大部分功能運作時都會用到的通用變數 **/

        /** 以下為與各控制項關聯的方法 **/
        // 頁面載入時，觸發此方法
        protected void Page_Load (object sender, EventArgs e) {

            // 第一次載入頁面時
            // 自動選擇最小的學期並顯示資料
            // (美觀，可避免尚未搜尋資料時的頁面空白)
            if (!IsPostBack) {
                Semester_DDL.SelectedIndex = 0;
                Semester_DDL.DataBind ();
                SemesterChanged (int.Parse (Semester_DDL.SelectedValue));
            }
        }

        protected void Semester_DDL_SelectedIndexChanged (object sender, EventArgs e) {

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

            Commit_DV_1.DataSource = Details_DataTable;
            Commit_DV_1.DataBind ();
            Commit_DV_2.DataSource = Details_DataTable;
            Commit_DV_2.DataBind ();
            Commit_DV_3.DataSource = Details_DataTable;
            Commit_DV_3.DataBind ();

            // 抓取使用者所選期別並刷新資料表格
            SemesterChanged (int.Parse (Semester_DDL.SelectedValue));
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
                "SELECT ID, Name, Ch_Title, First_Prof, First_Commit, Second_Commit, Third_Commit FROM [Student] WHERE Batch = " + int.Parse (Semester_DDL.SelectedValue) + ";";

            Getdata (ST_dataTable, ST_queryString);
            STGV2CMDV (ST_dataTable, Student_GV.SelectedIndex);
        }

        // 使用者可點選任一Commit_DV的下拉式選單以更換該研究生的審查委員
        // 修改資料庫 -> 所有控制重新進行讀取(刷新) -> 完成
        protected void Commit_DDL_SelectedIndexChanged (object sender, EventArgs e) {

            DropDownList ddl = (DropDownList) sender;
            Control control = ddl.Parent.Parent.Parent.Parent;

            // 找出觸發此功能的控制項位在哪個DetailsView
            // 已決定要修改Student資料表中的哪一行
            // DV_1 => 8 、 DV_2 => 9 、 DV_3 => 10
            string col = "First_Prof";

            if (control.Equals (Commit_DV_1) == true) {
                col = "First_Commit";
            }
            else if (control.Equals (Commit_DV_2) == true) {
                col = "Second_Commit";
            }
            else if (control.Equals (Commit_DV_3) == true) {
                col = "Third_Commit";
            }

            // 修改student資料表審查委員的命令
            string Commit_updateCommand =
                "UPDATE [Student] " +
                "SET " + col + " = " + ddl.SelectedValue +
                "WHERE ID = " + Student_GV.SelectedValue.ToString () + ";";

            SqlConnection connection = new SqlConnection (ConStr);
            SqlCommand command = new SqlCommand (Commit_updateCommand, connection);
            connection.Open ();

            command.ExecuteNonQuery ();

            connection.Close ();

            // TODO：加入「加點」機制(為特定教師增加1審查人數，且被替換的人亦須減去1點)
            // 資料庫 -> +- -> 強制更新

            // 修改ExamPoint_Log中，審查委員的審查人數
            string Point_updateCommand =
                "UPDATE [ExamPoint_Log] " +
                "SET Exam_Point = Exam_Point + 1 " +
                "WHERE (ID = 2) AND (Batch = " + Semester_DDL.SelectedValue + ");";

            SqlCommand command_1 = new SqlCommand (Point_updateCommand, connection);
            connection.Open ();

            command_1.ExecuteNonQuery ();

            connection.Close ();

            // 修改資料庫後，強制觸發以下兩事件，以即時更新頁面
            Semester_DDL_SelectedIndexChanged (Semester_DDL, new EventArgs ());
            Student_GV_SelectedIndexChanged (Student_GV, new EventArgs ());
        }
        /** 以上為與各控制項關聯的方法 **/



        /** 以下為上方功能運作時，將會呼叫使用的方法 **/
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
            Transform (Student_GV, ST_dataTable);
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
        private void Transform (GridView gridView, DataTable dataTable) {

            gridView.DataSource = dataTable;
            gridView.DataBind ();

            int row_Sum = dataTable.Rows.Count;

            // 轉換過程為迴圈(逐列逐行轉換)
            for (int row_Current = 0; row_Current < row_Sum; row_Current++) {
                for (int col_Current = 3; col_Current <= 6; col_Current++) {

                    // 如果資料為空(該研究生並沒有指導老師or審查委員)
                    // 將轉換為空字串填入表格
                    if (String.IsNullOrEmpty (dataTable.Rows[row_Current][col_Current].ToString ())) {
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
        //Student GridView To Commit DetailsView -> STGV2CMDV
        private void STGV2CMDV (DataTable dataTable, int row) {

            DataSet dataSet = new DataSet ();

            //將查詢到的資料填入dataset中，名為4、5、6的三個table
            //註：table名稱乃對應Student_DV的4、5、6列
            //資料傳送路徑：SQL -> adapter -> dataset -> 三個Commit_DV
            for (int col = 4; col <= 6; col++) {

                // PF_ID 教師編號
                var PF_ID = dataTable.Rows[row][col];

                GetProfDetail (PF_ID, dataSet, col.ToString ());
            }

            // 將Commit_DV的資料來源綁定
            // 已填入三筆審查委員資料的dataSet
            Commit_DV_1.DataSource = dataSet.Tables["4"];
            Commit_DV_1.DataBind ();
            Commit_DV_2.DataSource = dataSet.Tables["5"];
            Commit_DV_2.DataBind ();
            Commit_DV_3.DataSource = dataSet.Tables["6"];
            Commit_DV_3.DataBind ();
        }

        private void GetProfDetail (object PF_ID, DataSet dataSet, string TableName) {

            // semester 使用者所選學期
            var semester = int.Parse (Semester_DDL.SelectedValue);

            SqlConnection connection = new SqlConnection (ConStr);

            //查詢指令
            string Transform_queryString =
            "SELECT Teacher.ID, Teacher.Name, Teacher.Department, Teacher.Job, Teacher.Degree, Teacher.Exp, Teacher.Address, Teacher.Field, ExamPoint_Log.Exam_Point " +
            "FROM Teacher CROSS JOIN ExamPoint_Log " +
            "WHERE (ExamPoint_Log.Batch = " + semester + " OR ExamPoint_Log.Batch = N'0' ) AND (ExamPoint_Log.ID = " + PF_ID + ") AND (Teacher.ID = " + PF_ID + ")";

            //將查詢到的資料填入dataset中，名為4、5、6的三個table
            //註：table名稱乃對應Student_DV的4、5、6列
            //資料傳送路徑：SQL -> adapter -> dataset -> 三個Commit_DV
            SqlDataAdapter dataAdapter = new SqlDataAdapter ();
            dataAdapter.TableMappings.Add ("Table", TableName);
            connection.Open ();

            SqlCommand command = new SqlCommand (Transform_queryString, connection) {
                CommandType = CommandType.Text
            };
            dataAdapter.SelectCommand = command;

            dataAdapter.Fill (dataSet);

            connection.Close ();
        }
        /** 以上為上方功能運作時，將會呼叫使用的方法 **/
    }
}