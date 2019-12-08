using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Management.Pages
{
    public partial class patients : System.Web.UI.Page
    {
        DataConnection db = new DataConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            loadGrid();
        }

        public void loadGrid()
        {
            string UserQuery = @"SELECT [Patient_ID],[Patient_Name],[Patient_Mobile],[Patient_Address] FROM [dbo].[Patient]";
           
            UserGridView.DataSource = db.getData(UserQuery);
            UserGridView.DataBind();
        }
    }
}