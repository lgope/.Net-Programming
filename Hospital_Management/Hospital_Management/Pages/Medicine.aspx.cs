using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Management.Pages
{
    public partial class Medicine : System.Web.UI.Page
    {
        DataConnection db = new DataConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            loadGrid();
        }

        public void loadGrid()
        {
            
            string MediceneQuery = @"SELECT [medicine_ID],[medicine_Name],[medicine_Price], [Patient_ID] FROM [dbo].[Medicine]";

            MediceneGridView.DataSource = db.getData(MediceneQuery);
            MediceneGridView.DataBind();

        }
    }
}