using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Hospital_Management
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connectionString = @"Data Source=DESKTOP-LF18UAR\LAKSHMANSQL;Initial Catalog=Hospital_Management;Integrated Security=True";
        // DataConnection db = new DataConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
            }

        }

        public void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                string UserQuery = @"SELECT [Patient_ID],[Patient_Name],[Patient_Mobile],[Patient_Address] FROM [dbo].[Patient]";
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(UserQuery, sqlCon);

                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                UserGridView.DataSource = dtbl;
                UserGridView.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                UserGridView.DataSource = dtbl;
                UserGridView.DataBind();
                UserGridView.Rows[0].Cells.Clear();
                UserGridView.Rows[0].Cells.Add(new TableCell());
                UserGridView.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                UserGridView.Rows[0].Cells[0].Text = "No Data Found ..!";
                UserGridView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        // User Info Insert
        protected void UserGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = @"INSERT INTO [dbo].[Patient] ([Patient_ID],[Patient_Name],[Patient_Mobile],[Patient_Address]) VALUES (@Patient_ID,@Patient_Name,@Patient_Mobile,@Patient_Address)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Patient_ID", (UserGridView.FooterRow.FindControl("txtPatientIDFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Patient_Name", (UserGridView.FooterRow.FindControl("txtPatientNameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Patient_Mobile", (UserGridView.FooterRow.FindControl("txtPatientMobileFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Patient_Address", (UserGridView.FooterRow.FindControl("txtPatientAddressFooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        PopulateGridview();
                        PatientSuccessMessage.Text = "New Record Added";
                        PatientErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                PatientSuccessMessage.Text = "";
                PatientErrorMessage.Text = ex.Message;
            }
        }

        protected void UserGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            UserGridView.EditIndex = e.NewEditIndex;
            PopulateGridview();

        }

        protected void UserGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            UserGridView.EditIndex = -1;
            PopulateGridview();
        }

        protected void UserGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = @"UPDATE [dbo].[Patient] SET[Patient_ID] = @Patient_ID,[Patient_Name] = @Patient_Name,[Patient_Mobile] = @Patient_Mobile,[Patient_Address] = @Patient_Address WHERE [Patient_ID]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Patient_ID", (UserGridView.Rows[e.RowIndex].FindControl("txtPatientID") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Patient_Name", (UserGridView.Rows[e.RowIndex].FindControl("txtPatientName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Patient_Mobile", (UserGridView.Rows[e.RowIndex].FindControl("txtPatientMobile") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Patient_Address", (UserGridView.Rows[e.RowIndex].FindControl("txtPatientAddress") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(UserGridView.DataKeys[e.RowIndex].Value));
                    sqlCmd.ExecuteNonQuery();
                    UserGridView.EditIndex = -1;
                    PopulateGridview();
                    PatientSuccessMessage.Text = "Selected Record Updated";
                    PatientErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                PatientSuccessMessage.Text = "";
                PatientErrorMessage.Text = ex.Message;
            }
        }

        protected void UserGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM [dbo].[Patient] WHERE [Patient_ID]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(UserGridView.DataKeys[e.RowIndex].Value));
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    PatientSuccessMessage.Text = "Selected Record Deleted";
                    PatientErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                PatientSuccessMessage.Text = "";
                PatientErrorMessage.Text = ex.Message;
            }
        }

    }

}