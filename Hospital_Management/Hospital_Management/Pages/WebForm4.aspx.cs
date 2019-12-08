using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Management.Pages
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        DataConnection db = new DataConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            loadGrid();
        }

        public void loadGrid()
        {



            string PrescriptionQuery = @"SELECT [Pers_ID] ,[Doctor_Name] ,[Date] ,[Patient_Name]  ,[Age],[Blood_Pressure],[Pulse_Rate] ,[Patient_Problem]
                                          ,[Medicines]
                                          ,[Doctor_Advice]
                                          ,[Next_Date]
                                      FROM [dbo].[Prescription]";

            PrescriptionGridView1.DataSource = db.getData(PrescriptionQuery);
            PrescriptionGridView1.DataBind();


        }
    }
}