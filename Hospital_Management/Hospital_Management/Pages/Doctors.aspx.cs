using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Management.Pages
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataConnection db = new DataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            loadGrid();
        }

        public void loadGrid()
        {

            string DoctorQuery = @"SELECT [Doctor_ID],[Doctor_Name],[Doctor_Specialist],[Patient_ID] FROM [dbo].[Doctor]";

            DoctorGridView.DataSource = db.getData(DoctorQuery);
            DoctorGridView.DataBind();

        }
    }
}