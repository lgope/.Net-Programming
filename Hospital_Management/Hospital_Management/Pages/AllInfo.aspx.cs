using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Hospital_Management
{
    public partial class User : System.Web.UI.Page
    {

        DataConnection db = new DataConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                loadGrid();
            }
        }

         public void loadGrid()
         {
             string UserQuery = @"SELECT [Patient_ID],[Patient_Name],[Patient_Mobile],[Patient_Address] FROM [dbo].[Patient]";
             string DoctorQuery = @"SELECT [Doctor_ID],[Doctor_Name],[Doctor_Specialist],[Patient_ID] FROM [dbo].[Doctor]";
             string MediceneQuery = @"SELECT [medicine_ID],[medicine_Name],[medicine_Price], [Patient_ID] FROM [dbo].[Medicine]";
            string PrescriptionQuery = @"SELECT [Pers_ID] ,[Doctor_Name] ,[Date] ,[Patient_Name]  ,[Age],[Blood_Pressure],[Pulse_Rate] ,[Patient_Problem]
                                          ,[Medicines]
                                          ,[Doctor_Advice]
                                          ,[Next_Date]
                                      FROM [dbo].[Prescription]";

            PrescriptionGridView1.DataSource = db.getData(PrescriptionQuery);
            PrescriptionGridView1.DataBind();

             UserGridView.DataSource = db.getData(UserQuery);
             UserGridView.DataBind();

             DoctorGridView.DataSource = db.getData(DoctorQuery);
             DoctorGridView.DataBind();

             MediceneGridView.DataSource = db.getData(MediceneQuery);
             MediceneGridView.DataBind();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string query = @"INSERT INTO [dbo].[Patient] ([Patient_ID],[Patient_Name],[Patient_Mobile],[Patient_Address]) VALUES ('" + txtPatientID.Text+ "', '" + txtPatientName.Text+"', '"+txtMobile.Text+"', '" +txtAddress.Text+"')";


            if (db.ExecuteQuery(query) == 1)
            {
                loadGrid();
            }

        }

        protected void UserGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            UserGridView.PageIndex = e.NewPageIndex;
            loadGrid();

        }

        protected void UserGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblID = (Label)UserGridView.Rows[e.RowIndex].FindControl("DoctorIDLabel1");

            string pmQuery = @"DELETE FROM [dbo].[PatientMedicine] WHERE Patient_ID=" + lblID.Text;
            string dpQuery = @"DELETE FROM [dbo].[DoctorPatient] WHERE Doctor_ID=" + lblID.Text;
            string query = @"DELETE FROM [dbo].[Patient] WHERE Patient_ID=" + lblID.Text;

            if (db.ExecuteQuery(pmQuery) == 1 && db.ExecuteQuery(dpQuery) == 1 && db.ExecuteQuery(query) == 1)
            {
                loadGrid();
            }
            else
            {

            }
        }

        protected void UserGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            UserGridView.EditIndex = e.NewEditIndex;
            loadGrid();
        }

        protected void UserGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            UserGridView.EditIndex = -1;
            loadGrid();
        }

        protected void UserGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label lblID = (Label)UserGridView.Rows[e.RowIndex].FindControl("Patient_IDLabel1");
            TextBox txtPatient_Name = (TextBox)UserGridView.Rows[e.RowIndex].FindControl("txtPatient_Name");
            TextBox TextPatient_Mobile = (TextBox)UserGridView.Rows[e.RowIndex].FindControl("TextPatient_Mobile");
            TextBox TextPatient_Address = (TextBox)UserGridView.Rows[e.RowIndex].FindControl("TextPatient_Address");

            string query = @"UPDATE [dbo].[Patient] SET [Patient_Name] = '" + txtPatient_Name.Text + "',[Patient_Mobile] = '" + TextPatient_Mobile.Text + "', [Patient_Address] = '"+ TextPatient_Address.Text+ "' WHERE Patienter_ID=" + lblID.Text;

            if (db.ExecuteQuery(query) == 1)
            {
                UserGridView.EditIndex = -1;
                loadGrid();
            }
        }












        protected void btnDoctorSubmit_Click(object sender, EventArgs e)
        {
            string query = @"INSERT INTO [dbo].[Doctor] ([Doctor_ID], [Doctor_Name], [Doctor_Specialist],[Patient_ID]) VALUES ('" + txtDoctorID.Text + "', '"+ txtDoctorName.Text + "' , '" + txtDoctorSpecialist.Text + "', '" + txtPatientID1.Text + "')";


            if (db.ExecuteQuery(query) == 1)
            {
                loadGrid();
            }
        }

        protected void btnMedicineSubmit_Click(object sender, EventArgs e)
        {
            string query = @"INSERT INTO [dbo].[Medicine] ([medicine_Name],[medicine_Price], [Patient_ID]) VALUES ('" + txtmedicine_Name.Text + "', '" + txtmedicine_Price.Text + "', '" + txtMedicinePatientID.Text + "')";


            if (db.ExecuteQuery(query) == 1)
            {
                loadGrid();
            }
        }

        protected void DoctorGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DoctorGridView.PageIndex = e.NewPageIndex;
            loadGrid();
        }

        protected void DoctorGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblID = (Label)DoctorGridView.Rows[e.RowIndex].FindControl("DoctorIDLabel1");

            string dpQuery = @"DELETE FROM [dbo].[DoctorPatient] WHERE Doctor_ID=" + lblID.Text;

            string query = @"DELETE FROM [dbo].[Doctor] WHERE Doctor_ID=" + lblID.Text;

            if (db.ExecuteQuery(dpQuery) == 1 && db.ExecuteQuery(query) == 1)
            {
                loadGrid();
            }
            else
            {

            }
        }

        protected void DoctorGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            DoctorGridView.EditIndex = e.NewEditIndex;
            loadGrid();
        }

        protected void DoctorGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            DoctorGridView.EditIndex = -1;
            loadGrid();
        }

        protected void DoctorGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label lblID = (Label)DoctorGridView.Rows[e.RowIndex].FindControl("DoctorIDLabel1");
            TextBox txtDoctorName = (TextBox)DoctorGridView.Rows[e.RowIndex].FindControl("DoctorNameTextBox1");
            TextBox txtDoctorSpecialist = (TextBox)DoctorGridView.Rows[e.RowIndex].FindControl("DoctorSpecialistTextBox2");

            string query = @"UPDATE [dbo].[Doctor] SET [Doctor_Name] = '" + txtDoctorName.Text + "',[Doctor_Specialist] = '" + txtDoctorSpecialist.Text + "' WHERE Doctor_ID=" + lblID.Text;

            if (db.ExecuteQuery(query) == 1)
            {
                DoctorGridView.EditIndex = -1;
                loadGrid();
            }
        }





        protected void btnPrescribtionSubmit_Click(object sender, EventArgs e)
        {
           string insertQuery = @"INSERT INTO [dbo].[Prescription]
           ([Doctor_Name]
           ,[Date]
           ,[Patient_Name]
           ,[Age]
           ,[Blood_Pressure]
           ,[Pulse_Rate]
           ,[Patient_Problem]
           ,[Medicines]
           ,[Doctor_Advice]
           ,[Next_Date])
     VALUES
           ('"+ txtPrescitionDoctorName + "', '"+ txtPrescitionDate + "', '"+ txtPresPatientName + "', '"+ txtage + "', '"+ TextBloodPressure + "', '"+ TextPulseRate + "', '"+ TextPatientProblems + "', '"+ TextMedicines + "', '"+ TextDoctorAdvice + "', '"+ TextNextMeetUp + "')";

            if (db.ExecuteQuery(insertQuery) == 1)
            {
                loadGrid();
            } 
        }

        
    }
}