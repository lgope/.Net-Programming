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
    public partial class UpdatePrescribInfo : System.Web.UI.Page
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
                string PrescriptionQuery = @"SELECT [Pers_ID] ,[Doctor_Name] ,[Date] ,[Patient_Name]  ,[Age],[Blood_Pressure],[Pulse_Rate] ,[Patient_Problem]
                                          ,[Medicines]
                                          ,[Doctor_Advice]
                                          ,[Next_Date]
                                      FROM [dbo].[Prescription]";
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(PrescriptionQuery, sqlCon);

                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                PrescribtionGridView1.DataSource = dtbl;
                PrescribtionGridView1.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                PrescribtionGridView1.DataSource = dtbl;
                PrescribtionGridView1.DataBind();
                PrescribtionGridView1.Rows[0].Cells.Clear();
                PrescribtionGridView1.Rows[0].Cells.Add(new TableCell());
                PrescribtionGridView1.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                PrescribtionGridView1.Rows[0].Cells[0].Text = "No Data Found ..!";
                PrescribtionGridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void PrescribtionGridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();

                        string Insertquery = @"INSERT INTO [dbo].[Prescription]([Doctor_Name],[Date],[Patient_Name],[Age],[Blood_Pressure],[Pulse_Rate],[Patient_Problem],[Medicines],[Doctor_Advice]
                                               ,[Next_Date])
                                               VALUES (@Doctor_Name,@Date,@Patient_Name,@Age,@Blood_Pressure,@Pulse_Rate,@Patient_Problem,@Medicines,@Doctor_Advice,@Next_Date)";

                        SqlCommand sqlCmd = new SqlCommand(Insertquery, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Doctor_Name", (PrescribtionGridView1.FooterRow.FindControl("txtDoctorNameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Date", (PrescribtionGridView1.FooterRow.FindControl("txtDateFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Patient_Name", (PrescribtionGridView1.FooterRow.FindControl("txtPatient_NameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Age", (PrescribtionGridView1.FooterRow.FindControl("txtAgeFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Blood_Pressure", (PrescribtionGridView1.FooterRow.FindControl("txtBlood_PressureFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Pulse_Rate", (PrescribtionGridView1.FooterRow.FindControl("txtPulse_RateFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Patient_Problem", (PrescribtionGridView1.FooterRow.FindControl("txtPatient_ProblemFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Medicines", (PrescribtionGridView1.FooterRow.FindControl("txtMedicinesFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Doctor_Advice", (PrescribtionGridView1.FooterRow.FindControl("txtDoctor_AdviceFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Next_Date", (PrescribtionGridView1.FooterRow.FindControl("txNext_DateFooter") as TextBox).Text.Trim());

                        sqlCmd.ExecuteNonQuery();
                        PopulateGridview();
                        PresSuccessMessage.Text = "New Record Added";
                        PresErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                PresSuccessMessage.Text = "";
                PresErrorMessage.Text = ex.Message;
            }
        }

        protected void PrescribtionGridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            PrescribtionGridView1.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void PrescribtionGridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            PrescribtionGridView1.EditIndex = -1;
            PopulateGridview();
        }

        protected void PrescribtionGridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = @"UPDATE [dbo].[Prescription] SET[Doctor_Name] = @Doctor_Name,[Date] = @Date,[Patient_Name] = @Patient_Name,[Age] = @Age,[Blood_Pressure] = @Blood_Pressure,[Pulse_Rate] = @Pulse_Rate,[Patient_Problem] = @Patient_Problem,[Medicines] = @Medicines,[Doctor_Advice] = @Doctor_Advice, [Next_Date]=@Next_Date WHERE [Pers_ID]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Doctor_Name", (PrescribtionGridView1.Rows[e.RowIndex].FindControl("txtDoctorName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Date", (PrescribtionGridView1.Rows[e.RowIndex].FindControl("txtDate") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Patient_Name", (PrescribtionGridView1.Rows[e.RowIndex].FindControl("txtPatient_Name") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Age", (PrescribtionGridView1.Rows[e.RowIndex].FindControl("txtage") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Blood_Pressure", (PrescribtionGridView1.Rows[e.RowIndex].FindControl("txtBlood_Pressure") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Pulse_Rate", (PrescribtionGridView1.Rows[e.RowIndex].FindControl("txtPulse_Rate") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Patient_Problem", (PrescribtionGridView1.Rows[e.RowIndex].FindControl("txtPatient_Problem") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Medicines", (PrescribtionGridView1.Rows[e.RowIndex].FindControl("txtMedicines") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Doctor_Advice", (PrescribtionGridView1.Rows[e.RowIndex].FindControl("txtDoctor_Advice") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Next_Date", (PrescribtionGridView1.Rows[e.RowIndex].FindControl("txtNext_Date") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(PrescribtionGridView1.DataKeys[e.RowIndex].Value));
                    sqlCmd.ExecuteNonQuery();
                    PrescribtionGridView1.EditIndex = -1;
                    PopulateGridview();
                    PresSuccessMessage.Text = "Selected Record Updated";
                    PresErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                PresSuccessMessage.Text = "";
                PresErrorMessage.Text = ex.Message;
            }
        }

        protected void PrescribtionGridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM [dbo].[Prescription] WHERE [Pers_ID]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(PrescribtionGridView1.DataKeys[e.RowIndex].Value));
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    PresSuccessMessage.Text = "Selected Record Updated";
                    PresErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                PresSuccessMessage.Text = "";
                PresErrorMessage.Text = ex.Message;
            }
        }
    }
}