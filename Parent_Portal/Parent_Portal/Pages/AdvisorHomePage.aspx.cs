using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parent_Portal.Pages
{
    public partial class AdvisorHomePage : System.Web.UI.Page
    {
        DataConnection db = new DataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            loadGrid();
        }

        public void loadGrid()
        {
            string studentListQuery = @"SELECT [S_Id], [S_Name], [S_Sem_No] FROM [dbo].[ParentTable] where S_Id in (SELECT [S_Id] FROM [dbo].AdvisorStudent)";

            studentListGridView.DataSource = db.getData(studentListQuery);
            studentListGridView.DataBind();
        }
    }
}