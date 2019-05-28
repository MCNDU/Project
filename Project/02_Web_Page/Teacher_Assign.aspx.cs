using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Threading.Tasks;

namespace Project._02_Web_Page {
    public partial class Teacher_Assign : System.Web.UI.Page {
        protected void Page_Load (object sender, EventArgs e) {

        }
    }

    class Node {

        //建立鏈結串列
        static Node [] Teacher;
        static LinkedList<Node> Teacher_List = new LinkedList<Node> (Teacher);

        //鏈結串列內資料
        String Teacher_Name;
        float Choose_Time_Remain ;

        //計算用資料
        int Teacher_Amount = 5;
        int Student_Amount = 10;

        //Choose_Time_Remain = Teacher_Amount / Student_Amount;

        Node (String Teacher_Name, int Choose_Time_Remain) {
            this.Teacher_Name = Teacher_Name;
            this.Choose_Time_Remain = Choose_Time_Remain;
        }

        public static void Display (string Teacher_Name) {
            foreach (Node Read in Teacher_List) {
                
            }
            //網頁上條列老師姓名
        }

        public static void Add (string Teacher_Name) {
        //    Node insert = new Node (Teacher_Name, Choose_Time_Remain);
        }
    }
}