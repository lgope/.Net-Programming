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
    public partial class UpdateMedicineInfo : System.Web.UI.Page
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
                string UserQuery = @"SELECT [medicine_ID],[medicine_Name],[medicine_Price],[User_ID] FROM [dbo].[Medicine]";
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(UserQuery, sqlCon);

                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                MediceneGridView.DataSource = dtbl;
                MediceneGridView.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                MediceneGridView.DataSource = dtbl;
                MediceneGridView.DataBind();
                MediceneGridView.Rows[0].Cells.Clear();
                MediceneGridView.Rows[0].Cells.Add(new TableCell());
                MediceneGridView.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                MediceneGridView.Rows[0].Cells[0].Text = "No Data Found ..!";
                MediceneGridView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void MediceneGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = @"INSERT INTO [dbo].[Medicine] ([medicine_Name],[medicine_Price],[User_ID]) VALUES (@medicine_Name,@medicine_Price,@User_ID)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@medicine_Name", (MediceneGridView.FooterRow.FindControl("txtmedicineNameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@medicine_Price", (MediceneGridView.FooterRow.FindControl("txtmedicinePriceFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@User_ID", (MediceneGridView.FooterRow.FindControl("txtUserIDFooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        PopulateGridview();
                        MedicineSuccessMessage.Text = "New Record Added";
                        MedicineErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                MedicineSuccessMessage.Text = "";
                MedicineErrorMessage.Text = ex.Message;
            }
        }

        protected void MediceneGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            MediceneGridView.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void MediceneGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            MediceneGridView.EditIndex = -1;
            PopulateGridview();
        }

        protected void MediceneGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = @"UPDATE [dbo].[Medicine] SET[medicine_Name] = @medicine_Name,[medicine_Price] = @medicine_Price, [User_ID] = @User_ID WHERE [medicine_ID]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@medicine_Name", (MediceneGridView.Rows[e.RowIndex].FindControl("txtmedicineName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@medicine_Price", (MediceneGridView.Rows[e.RowIndex].FindControl("txtmedicinePrice") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@User_ID", (MediceneGridView.Rows[e.RowIndex].FindControl("txtUserID") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(MediceneGridView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    MediceneGridView.EditIndex = -1;
                    PopulateGridview();
                    MedicineSuccessMessage.Text = "Selected Record Updated";
                    MedicineErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                MedicineSuccessMessage.Text = "";
                MedicineErrorMessage.Text = ex.Message;
            }
        }

        protected void MediceneGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM [dbo].[Medicine] WHERE [medicine_ID]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(MediceneGridView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    MedicineSuccessMessage.Text = "Selected Record Deleted";
                    MedicineErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                MedicineSuccessMessage.Text = "";
                MedicineErrorMessage.Text = ex.Message;
            }
        }
    }
}