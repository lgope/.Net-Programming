using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_Management.Pages
{
    public partial class Prescription : System.Web.UI.Page
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

            string DoctorNameQuery = @"select Doctor_Name from Doctor where Doctor_ID in (select Doctor_ID from DoctorPatient)";


            //  string PatientNameQuery = @"SELECT [Patient_ID],[Patient_Name],[Patient_Mobile],[Patient_Address] FROM [dbo].[Patient]";
            string PatientNameQuery = @"select Patient_Name from Patient where Patient_ID IN (select Patient_ID from DoctorPatient)";    
            
            string MedicineNameQuery = @"select medicine_Name from  Medicine where medicine_ID IN (select medicine_ID from PatientMedicine)";   
            
            string PatientMedicineNameQuery = @"select Patient_Name from Patient where Patient_ID IN (select Patient_ID from PatientMedicine)";            

          //  DoctorNameGridView.DataSource = db.getData(DoctorNameQuery);
           // DoctorNameGridView.DataBind();

            //PatientNameGridView.DataSource = db.getData(PatientNameQuery);
            //PatientNameGridView.DataBind();

          //  MedicineNameGridView.DataSource = db.getData(MedicineNameQuery);
           // MedicineNameGridView.DataBind();

            //PatientMedicineNameGridView.DataSource = db.getData(PatientMedicineNameQuery);
           // PatientMedicineNameGridView.DataBind();
        }
    }
}