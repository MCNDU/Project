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

        //連結資料庫，命名為cnStr
        //@"資料來源=(本地資料庫)\"
        readonly String cnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;" +
                        "AttachDBFilename=|DataDirectory|Project_Db.mdf";

        //於方法內接收外部傳入的數值，臨時紀錄用
        DropDownList Selected_Batch_DDL;
        GridView Selected_GridView_GV;

        //頁面載入時，觸發此方法
        protected void Page_Load (object sender, EventArgs e) {

        }

        //當使用者變更下拉式選單內所選的期別時，觸發此方法
        protected void Batch_DDL_SelectedIndexChanged (object sender, EventArgs e) {

            //接收自控制項傳入的資料，
            //以讓多個控制項共用同一方法，達成精簡程式碼的目的
            Selected_Batch_DDL = (DropDownList) sender;

            Batch_DDL.DataBind ();
            Batch_DDL.SelectedValue = Selected_Batch_DDL.SelectedValue;

            int Batch = int.Parse (Selected_Batch_DDL.SelectedValue);

            //根據使用者所選期別，自資料表內調出資料
            //調出學生資料
            Student_SDS_ForGV.SelectCommand =
                "SELECT Student.ID, Name, Ch_Title, First_Commit, Second_Commit, Third_Commit, First_Prof FROM Student WHERE Batch = " + Batch + ";";
            //調出教師資料
            Teacher_SDS_ForGV.SelectCommand =
                "SELECT * FROM [Teacher] , [ExamPoint_Log] WHERE Batch = " + Batch + ";";

            //刷新頁面中四個Grid_View控制項，以更新顯示內容
            Student_GV.DataBind ();
            Teacher_GV.DataBind ();

            //計算Student_GV共有幾列資料
            int ST_DataRow = Student_GV.Rows.Count;

            //將指導教師及三名審查委員之資料(教師編號)替換為相對應的教師姓名
            int Row_Count = 0;
            int Col_Count;
            string Data_Value;

            //
            while (Row_Count < ST_DataRow) {
                for (Col_Count = 6; Col_Count <= 8; Col_Count++) {
                    Data_Value = Student_GV.Rows[Row_Count].Cells[Col_Count].ToString ();
                    //Student_GV.Rows[Row_Count].Cells[Col_Count] = ;
                }
                Row_Count++;
            }
        }

        //當使用者選擇 學生Grid|View (含Student_GV以及、Student_GV_1) 內某一列(Row)時，觸發此方法
        protected void Student_GV_SelectedIndexChanged (object sender, EventArgs e) {

            //承接自控制項傳入的資料以精簡程式碼
            Selected_GridView_GV = (GridView) sender;

            string ID = Selected_GridView_GV.SelectedValue.ToString ();

            //傳送資料至Studnet_DV以顯示被選擇的該名研究生資料
            Student_SDS_ForDV.SelectCommand =
            "SELECT ID, Name, Ch_Title, First_Commit, Second_Commit, Third_Commit, First_Prof FROM Student WHERE ID = " + ID + ";";
            Student_DV.DataBind ();

            //傳送資料至Teacher_DV以顯示分配給該名研究生之審查委員資料
            //(依據1、2、3順序放置於Teacher_DV之1、2、3分頁)

        }
    }
}