using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Hospital_Management.UpdateData
{
    public partial class UpdateDoctorInfo : System.Web.UI.Page
    {
        string connectionString = @"Data Source=DESKTOP-LF18UAR\LAKSHMANSQL;Initial Catalog=Hospital_Management;Integrated Security=True";

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
                string UserQuery = @"SELECT [Doctor_ID],[Doctor_Name],[Doctor_Specialist],[Patient_ID] FROM [dbo].[Doctor]";
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(UserQuery, sqlCon);

                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                DoctorGridView.DataSource = dtbl;
                DoctorGridView.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                DoctorGridView.DataSource = dtbl;
                DoctorGridView.DataBind();
                DoctorGridView.Rows[0].Cells.Clear();
                DoctorGridView.Rows[0].Cells.Add(new TableCell());
                DoctorGridView.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                DoctorGridView.Rows[0].Cells[0].Text = "No Data Found ..!";
                DoctorGridView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        // Doctor Info Insert
        protected void DoctorGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {           
            
                try
                {
                    if (e.CommandName.Equals("AddNew"))
                    {
                        using (SqlConnection sqlCon = new SqlConnection(connectionString))
                        {
                            sqlCon.Open();
                            string query = @"INSERT INTO [dbo].[Doctor] ([Doctor_ID],[Doctor_Name],[Doctor_Specialist],[Patient_ID]) VALUES (@Doctor_ID,@Doctor_Name,@Doctor_Specialist,@Patient_ID)";
                            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                            sqlCmd.Parameters.AddWithValue("@Doctor_ID", (DoctorGridView.FooterRow.FindControl("txtDoctorIDFooter") as TextBox).Text.Trim());
                            sqlCmd.Parameters.AddWithValue("@Doctor_Name", (DoctorGridView.FooterRow.FindControl("txtDoctorNameFooter") as TextBox).Text.Trim());
                            sqlCmd.Parameters.AddWithValue("@Doctor_Specialist", (DoctorGridView.FooterRow.FindControl("txtDoctorSpecialistFooter") as TextBox).Text.Trim());
                            sqlCmd.Parameters.AddWithValue("@Patient_ID", (DoctorGridView.FooterRow.FindControl("txtPatientIDFooter") as TextBox).Text.Trim());
                            sqlCmd.ExecuteNonQuery();
                            PopulateGridview();
                            DoctorSuccessMessage.Text = "New Record Added";
                            DoctorErrorMessage.Text = "";
                        }
                    }
                }
                catch (Exception ex)
                {
                    DoctorSuccessMessage.Text = "";
                    DoctorErrorMessage.Text = ex.Message;
                }
        }

        protected void DoctorGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            DoctorGridView.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void DoctorGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            DoctorGridView.EditIndex = -1;
            PopulateGridview();
        }

        protected void DoctorGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = @"UPDATE [dbo].[Doctor] SET[Doctor_ID] = @Doctor_ID,[Doctor_Name] = @Doctor_Name,[Doctor_Specialist] = @Doctor_Specialist,[Patient_ID] = @Patient_ID WHERE [Doctor_ID]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Doctor_ID", (DoctorGridView.Rows[e.RowIndex].FindControl("txtDoctorID") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Doctor_Name", (DoctorGridView.Rows[e.RowIndex].FindControl("txtDoctorName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Doctor_Specialist", (DoctorGridView.Rows[e.RowIndex].FindControl("txtDoctorSpecialist") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Patient_ID", (DoctorGridView.Rows[e.RowIndex].FindControl("txtPatientID") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(DoctorGridView.DataKeys[e.RowIndex].Value));
                    sqlCmd.ExecuteNonQuery();
                    DoctorGridView.EditIndex = -1;
                    PopulateGridview();
                    DoctorSuccessMessage.Text = "Selected Record Updated";
                    DoctorErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                DoctorSuccessMessage.Text = "";
                DoctorErrorMessage.Text = ex.Message;
            }
        }

        protected void DoctorGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM [dbo].[Doctor] WHERE [Doctor_ID]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(DoctorGridView.DataKeys[e.RowIndex].Value));
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    DoctorSuccessMessage.Text = "Selected Record Deleted";
                    DoctorErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                DoctorSuccessMessage.Text = "";
                DoctorErrorMessage.Text = ex.Message;
            }
        }
    }
}