using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project._02_Web_Page
{
    public partial class Manage_Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //傳送所選資料至DetailsView並提供修改功能
        protected void GridView_List_SelectedIndexChanged(object sender, EventArgs e)
        {
            int C;

            //依照所選資料於資料庫內所在位置，自資料庫傳送所選資料至DetailsView(以提供後續修改功能)
            for (C = 0; C < 7; C++)
            {
                DetailsView_Edit.PageIndex = GridView_List.SelectedRow.RowIndex;
            }
        }

        protected void Incert_Mode(object sender, EventArgs e)
        {
            if (DetailsView_Edit.CurrentMode == DetailsViewMode.Insert)
            {
                DetailsView_Edit.Fields.RemoveAt(0);

                
                
                ListItem Admin = new ListItem();
                ListItem Teacher = new ListItem();
                ListItem Student = new ListItem();

                DropDownList Category = new DropDownList();
                Category.Items.Add(Admin);
                Category.Items.Add(Teacher);
                Category.Items.Add(Student);

                TemplateField incert = new TemplateField();

                DetailsView_Edit.Fields.Insert(0, incert);
            }
        }
    }
}