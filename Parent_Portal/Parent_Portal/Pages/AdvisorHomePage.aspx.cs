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
    public partial class AdvisorHomePage : System.Web.UI.Page
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
            string studentListQuery = @"SELECT [S_Id], [S_Name], [S_Sem_No] FROM [dbo].[ParentTable] where S_Id in (SELECT [S_Id] FROM [dbo].AdvisorStudent)";

            string crQuery = @"SELECT [S_Id],[S_Name],[C_Code],[C_Title],[Credit],[Section],[Teacher]FROM [dbo].[CourseRegistration]";

            string lrQuery = @"SELECT [S_Id],[S_Name],[C_Name],[Quize_Avg],[Attendance],[Assignment],[Midterm],[Final],[Total] FROM [dbo].[LiveResult]";


            studentListGridView.DataSource = db.getData(studentListQuery);
            studentListGridView.DataBind();

            CourseRegistrationGridView.DataSource = db.getData(crQuery);
            CourseRegistrationGridView.DataBind();

            LiveResultGridView.DataSource = db.getData(lrQuery);
            LiveResultGridView.DataBind();
        }

        // Course Registration Grid View CRUD
        protected void CourseRegistrationGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = @"INSERT INTO [dbo].[CourseRegistration]
                                           ([S_Id]
                                           ,[S_Name]
                                           ,[C_Code]
                                           ,[C_Title]
                                           ,[Credit]
                                           ,[Section]
                                           ,[Teacher])
                                     VALUES (@S_Id, @S_Name, @C_Code, @C_Title, @Credit, @Section, @Teacher)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@S_Id", (CourseRegistrationGridView.FooterRow.FindControl("S_IdTextBox2Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@S_Name", (CourseRegistrationGridView.FooterRow.FindControl("S_NameTextBox2Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@C_Code", (CourseRegistrationGridView.FooterRow.FindControl("C_CodeTextBox3Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@C_Title", (CourseRegistrationGridView.FooterRow.FindControl("C_TitleTextBox4Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Credit", (CourseRegistrationGridView.FooterRow.FindControl("CreditTextBox5Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Section", (CourseRegistrationGridView.FooterRow.FindControl("SectionTextBox6Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Teacher", (CourseRegistrationGridView.FooterRow.FindControl("TeacherTextBox7Footer") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();

                        loadGrid();

                        crSuccessMessage.Text = "New Record Added";
                        crErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                crSuccessMessage.Text = "";
                crErrorMessage.Text = ex.Message;
            }

        }

        protected void CourseRegistrationGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = @"UPDATE [dbo].[CourseRegistration]
                                           SET [S_Id] = @S_Id
                                              ,[S_Name] = @S_Name
                                              ,[C_Code] = @C_Code
                                              ,[C_Title] = @C_Title
                                              ,[Credit] = @Credit
                                              ,[Section] = @Section
                                              ,[Teacher] = @Teacher
                                         WHERE [Id]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@S_Id", (CourseRegistrationGridView.Rows[e.RowIndex].FindControl("S_IdTextBox2") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@S_Name", (CourseRegistrationGridView.Rows[e.RowIndex].FindControl("S_NameTextBox2") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@C_Code", (CourseRegistrationGridView.Rows[e.RowIndex].FindControl("C_CodeTextBox3") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@C_Title", (CourseRegistrationGridView.Rows[e.RowIndex].FindControl("C_TitleTextBox4") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Credit", (CourseRegistrationGridView.Rows[e.RowIndex].FindControl("CreditTextBox5") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Section", (CourseRegistrationGridView.Rows[e.RowIndex].FindControl("SectionTextBox6") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Teacher", (CourseRegistrationGridView.Rows[e.RowIndex].FindControl("TeacherTextBox7") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(CourseRegistrationGridView.DataKeys[e.RowIndex].Value));
                   
                    sqlCmd.ExecuteNonQuery();

                    CourseRegistrationGridView.EditIndex = -1;
                    loadGrid();

                    crSuccessMessage.Text = "Selected Record Updated";
                    crErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                crSuccessMessage.Text = "";
                crErrorMessage.Text = ex.Message;
            }

        }

        protected void CourseRegistrationGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM [dbo].[CourseRegistration] WHERE [Id]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(CourseRegistrationGridView.DataKeys[e.RowIndex].Value));
                    sqlCmd.ExecuteNonQuery();

                    loadGrid();

                    crSuccessMessage.Text = "Selected Record Deleted";
                    crErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                crSuccessMessage.Text = "";
                crErrorMessage.Text = ex.Message;
            }

        }

        protected void CourseRegistrationGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            CourseRegistrationGridView.EditIndex = e.NewEditIndex;
            loadGrid();

        }

        protected void CourseRegistrationGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            CourseRegistrationGridView.EditIndex = -1;
            loadGrid();
        }



        // Live Result Grid View CRUD
        protected void LiveResultGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void LiveResultGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void LiveResultGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void LiveResultGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            LiveResultGridView.EditIndex = e.NewEditIndex;
            loadGrid();
        }

        protected void LiveResultGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            LiveResultGridView.EditIndex = -1;
            loadGrid();
        }
    }
}