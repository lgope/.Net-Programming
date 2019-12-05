using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace Parent_Portal.Pages
{
    public partial class AdminHomePage1 : System.Web.UI.Page
    {
        string connectionString = @"Data Source=DESKTOP-LF18UAR\LAKSHMANSQL;Initial Catalog=Parent_Portal;Integrated Security=True";
        DataConnection db = new DataConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGrid();
            }

        }

        public void loadGrid()
        {
            string ParentStudentQuery = @"SELECT [P_Id]
                                              ,[P_Name]
                                              ,[P_Email]
                                              ,[P_Password]
                                              ,[S_Name]
                                              ,[S_Sem_No]
                                          FROM [dbo].[ParentTable]";

            string AdvisorQuery = @"SELECT [Id]
                                  ,[A_Id]
                                  ,[A_Pass]
                                  ,[A_Name]
                                  ,[A_Dept]
                              FROM [dbo].[Advisor]";

            string AdvisorStudent = @"SELECT [Id]
                                      ,[A_Id]
                                      ,[P_Id]
                                  FROM [dbo].[AdvisorStudent]";

            ParentStudentGridView.DataSource = db.getData(ParentStudentQuery);
            ParentStudentGridView.DataBind();

            AdvisorGridView.DataSource = db.getData(AdvisorQuery);
            AdvisorGridView.DataBind();

            AdvisorStudentGridView.DataSource = db.getData(AdvisorStudent);
            AdvisorStudentGridView.DataBind();

        }

        protected void ParentStudentGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {               
                    Label lblID = (Label)ParentStudentGridView.Rows[e.RowIndex].FindControl("P_IdLabel");
                    string advisorStuQuery = @"DELETE FROM [dbo].[AdvisorStudent] WHERE P_Id=" + lblID.Text;
                    string studentQuery = @"DELETE FROM [dbo].[ParentTable] WHERE P_Id=" + lblID.Text;

                    if (db.ExecuteQuery(advisorStuQuery) == 1 && db.ExecuteQuery(studentQuery) == 1)
                    {
                        loadGrid();
                        ParentSuccessMessage.Text = "Sucess";
                    }
                
                
            } catch (Exception ex)
            {
                ParentErrorMessage.Text = ex.Message;
            }
            

        }

        protected void AdvisorGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string advisorQuery = @"INSERT INTO [dbo].[Advisor]([A_Id],[A_Pass],[A_Name],[A_Dept]) VALUES (@A_Id,@A_Pass,@A_Name,@A_Dept)";
                        SqlCommand sqlCmd = new SqlCommand(advisorQuery, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@A_Id", (AdvisorGridView.FooterRow.FindControl("txtA_IdFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@A_Pass", (AdvisorGridView.FooterRow.FindControl("txtA_PassFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@A_Name", (AdvisorGridView.FooterRow.FindControl("txtA_NameFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@A_Dept", (AdvisorGridView.FooterRow.FindControl("txtA_DeptFooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();

                        string asQuery = @"INSERT INTO [dbo].[AdvisorStudent] ([A_Id]) VALUES (@A_Id)";
                        SqlCommand asSqlCmd = new SqlCommand(asQuery, sqlCon);
                        asSqlCmd.Parameters.AddWithValue("@A_Id", (AdvisorGridView.FooterRow.FindControl("txtA_IdFooter") as TextBox).Text.Trim());
                        asSqlCmd.ExecuteNonQuery();

                        loadGrid();
                        AdvisorSuccessMessage.Text = "New Record Added";
                        AdvisorErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                AdvisorSuccessMessage.Text = "";
                AdvisorErrorMessage.Text = ex.Message;
            }


        }

        protected void AdvisorGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            AdvisorGridView.EditIndex = e.NewEditIndex;
            loadGrid();

        }

        protected void AdvisorGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            AdvisorGridView.EditIndex = -1;
            loadGrid();
        }

        protected void AdvisorGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = @"UPDATE [dbo].[Advisor]
                    SET [A_Id] =@A_Id ,[A_Pass] =@A_Pass ,[A_Name] =@A_Name ,[A_Dept] =@A_Dept  WHERE [Id]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@A_Id", (AdvisorGridView.Rows[e.RowIndex].FindControl("A_IdTextBox2") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@A_Pass", (AdvisorGridView.Rows[e.RowIndex].FindControl("A_PassTextBox1") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@A_Name", (AdvisorGridView.Rows[e.RowIndex].FindControl("A_NameTextBox3") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@A_Dept", (AdvisorGridView.Rows[e.RowIndex].FindControl("A_DeptTextBox4") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(AdvisorGridView.DataKeys[e.RowIndex].Value));
                    sqlCmd.ExecuteNonQuery();
                    AdvisorGridView.EditIndex = -1;
                    loadGrid();
                    AdvisorSuccessMessage.Text = "Selected Record Updated";
                    AdvisorErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                AdvisorSuccessMessage.Text = "";
                AdvisorErrorMessage.Text = ex.Message;
            }

        }

        protected void AdvisorGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                Label lblID = (Label)AdvisorGridView.Rows[e.RowIndex].FindControl("AdvisorLabel");
                string advisorStuQuery = @"DELETE FROM [dbo].[AdvisorStudent] WHERE A_Id=" + lblID.Text;

                if (db.ExecuteQuery(advisorStuQuery) == 1)
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "DELETE FROM [dbo].[Advisor] WHERE [Id]=@id";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(AdvisorGridView.DataKeys[e.RowIndex].Value));
                        sqlCmd.ExecuteNonQuery();
                        loadGrid();
                        AdvisorSuccessMessage.Text = "Selected Record Deleted";
                        AdvisorErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                AdvisorSuccessMessage.Text = "";
                AdvisorErrorMessage.Text = ex.Message;
            }

        }
    }
}