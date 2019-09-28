using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Project._01_Master_Page
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.Panel.Height = Screen.PrimaryScreen.Bounds.Height - 205;
            if (Session["Login"] != null)
            {
                //Label1.Text = Session["Chinese_name"].ToString() + "   歡迎使用本系統";
            }
        }
            
    }
}