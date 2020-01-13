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
        String ConStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                        "AttachDBFilename=|DataDirectory|Project_Db.mdf";

        // 頁面載入時，觸發此方法
        protected void Page_Load (object sender, EventArgs e) {

        }

        // 當使用者選擇 學生Grid|View (含Student_GV以及、Student_GV_1) 內某一列(Row)時，觸發此方法
        protected void Student_GV_SelectedIndexChanged (object sender, EventArgs e) {

            // 承接自控制項傳入的資料以精簡程式碼

            string ID = Student_GV.SelectedValue.ToString ();

            // TO BE CONTINUE ==>>
            // 傳送資料至Studnet_DV以顯示被選擇的該名研究生資料
            Student_SDS_ForDV.SelectCommand =
            "SELECT ID, Name, Ch_Title, First_Commit, Second_Commit, Third_Commit, First_Prof FROM Student WHERE ID = " + ID + ";";
            Student_DV.DataBind ();
            Student_DV.Rows[3].Cells[1].Text = Student_GV.SelectedRow.Cells[5].Text;
            // 傳送資料至Teacher_DV以顯示分配給該名研究生之審查委員資料
            // (依據1、2、3順序放置於Teacher_DV之1、2、3分頁)

        }

        // 下方為重新編寫的功能，用以取代舊有功能(因應介面變化)
        
        // 讓虛擬表格取得資料的方法
        private void Getdata (GridView gridView, DataTable dataTable, String queryString) {
            
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

            // 將資料轉送至相對應之GridView
            gridView.DataSource = dataTable;
            gridView.DataBind ();
        }

        // 處理學生資料的方法
        // 資料庫內，研究生指導教師、審查委員等等之資料
        // 其記錄方式均透過教師編號完成(避免有教師同名)
        // 因此在實際呈現給使用者之前，需先行轉換為與編號相對應之教師名稱
        // 轉換順序：dataTable -> 資料表查詢 -> gridView
        // 位置對應：dataTable[0][0] <=> gridView[0][2]
        private void Transform (GridView gridView, DataTable dataTable, int col_Start, int col_End) {

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

        protected void Batch_DDL_SelectedIndexChanged (object sender, EventArgs e) {
            
            // 抓取使用者所選期別
            int Batch = int.Parse (Batch_DDL.SelectedValue);

            // 取得該期研究生資料
            String ST_queryString =
                "SELECT ID, Name, Ch_Title, First_Prof, Second_Commit, Third_Commit, First_Commit FROM [Student] WHERE Batch = " + Batch + ";";
            DataTable ST_dataTable = new DataTable ();
            
            Getdata (Student_GV, ST_dataTable, ST_queryString);

            // 資料轉換功能(教師編號轉換姓名)
            Transform (Student_GV, ST_dataTable, 3, 6);

            // 取得該期教師資料
            String PF_queryString =
                "SELECT * FROM [Teacher] , [ExamPoint_Log] WHERE Batch = " + Batch + ";";
            DataTable PF_dataTable = new DataTable ();
            
            Getdata (Teacher_GV, PF_dataTable, PF_queryString);
        }
    }
}