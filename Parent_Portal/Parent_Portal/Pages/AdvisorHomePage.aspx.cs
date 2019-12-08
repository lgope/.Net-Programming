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

        string advisorId = "";
        string studentId = "";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void IdButton1_Click(object sender, EventArgs e)
        {
            advisorId = idTextBox.Text;

            StudentListLabel.Visible = true;
            CourseRegistersLabel.Visible = true;
            ImportResultsLabel.Visible = true;

            CourseRegistersTextBox.Visible = true;
            CourseRegistersButton.Visible = true;

            ImportResultsTextBox.Visible = true;
            ImportResultsButton.Visible = true;

            loadStudentListGrid(advisorId);
        }
        protected void CourseRegistersButton_Click(object sender, EventArgs e)
        {
            advisorId = idTextBox.Text;
            studentId = CourseRegistersTextBox.Text;

            loadCourseRegistrationGrid(advisorId, studentId);
        }

        protected void ImportResultsButton1_Click(object sender, EventArgs e)
        {
            advisorId = idTextBox.Text;
            studentId = ImportResultsTextBox.Text;
            loadLiveResultGrid(advisorId, studentId);
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

                        advisorId = idTextBox.Text;
                        studentId = ImportResultsTextBox.Text;

                        loadCourseRegistrationGrid(advisorId, studentId);

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
                                         WHERE [Cr_Id]=@id";
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

                    advisorId = idTextBox.Text;
                    studentId = ImportResultsTextBox.Text;

                    loadCourseRegistrationGrid(advisorId, studentId);

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
                    string query = "DELETE FROM [dbo].[CourseRegistration] WHERE [Cr_Id]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(CourseRegistrationGridView.DataKeys[e.RowIndex].Value));
                    sqlCmd.ExecuteNonQuery();

                    advisorId = idTextBox.Text;
                    studentId = ImportResultsTextBox.Text;

                    loadCourseRegistrationGrid(advisorId, studentId);

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

            advisorId = idTextBox.Text;
            studentId = ImportResultsTextBox.Text;

            loadCourseRegistrationGrid(advisorId, studentId);

        }

        protected void CourseRegistrationGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            CourseRegistrationGridView.EditIndex = -1;

            advisorId = idTextBox.Text;
            studentId = ImportResultsTextBox.Text;

            loadCourseRegistrationGrid(advisorId, studentId);
        }



        // Live Result Grid View CRUD
        protected void LiveResultGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = @"INSERT INTO [dbo].[LiveResult]
                                           ([S_Id]
                                           ,[S_Name]
                                           ,[C_Name]
                                           ,[Quize_Avg]
                                           ,[Attendance]
                                           ,[Assignment]
                                           ,[Midterm]
                                           ,[Final]
                                           ,[Total])
                                     VALUES (@S_Id, @S_Name, @C_Name, @Quize_Avg, @Attendance, @Assignment, @Midterm, @Final, @Total)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@S_Id", (LiveResultGridView.FooterRow.FindControl("S_IdTextBox1Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@S_Name", (LiveResultGridView.FooterRow.FindControl("S_NameTextBox2Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@C_Name", (LiveResultGridView.FooterRow.FindControl("C_NameTextBox3Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Quize_Avg", (LiveResultGridView.FooterRow.FindControl("Quize_AvgTextBox4Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Attendance", (LiveResultGridView.FooterRow.FindControl("AttendanceTextBox5Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Assignment", (LiveResultGridView.FooterRow.FindControl("AssignmentTextBox6Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Midterm", (LiveResultGridView.FooterRow.FindControl("MidtermTextBox7Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Final", (LiveResultGridView.FooterRow.FindControl("FinalTextBox8Footer") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Total", (LiveResultGridView.FooterRow.FindControl("TotalTextBox9Footer") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();

                        advisorId = idTextBox.Text;
                        studentId = ImportResultsTextBox.Text;
                        loadLiveResultGrid(advisorId, studentId);

                        lrSuccessMessage.Text = "New Record Added";
                        lrErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lrSuccessMessage.Text = "";
                lrErrorMessage.Text = ex.Message;
            }

        }

        protected void LiveResultGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = @"UPDATE [dbo].[LiveResult]
                                           SET [S_Id] = @S_Id
                                              ,[S_Name] = @S_Name
                                              ,[C_Name] = @C_Name
                                              ,[Quize_Avg] = @Quize_Avg
                                              ,[Attendance] = @Attendance
                                              ,[Assignment] = @Assignment
                                              ,[Midterm] = @Midterm
                                              ,[Final] = @Final
                                              ,[Total] = @Total
                                         WHERE [Id]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@S_Id", (LiveResultGridView.Rows[e.RowIndex].FindControl("S_IdTextBox") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@S_Name", (LiveResultGridView.Rows[e.RowIndex].FindControl("S_NameTextBox2") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@C_Name", (LiveResultGridView.Rows[e.RowIndex].FindControl("C_NameTextBox3") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Quize_Avg", (LiveResultGridView.Rows[e.RowIndex].FindControl("Quize_AvgTextBox4") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Attendance", (LiveResultGridView.Rows[e.RowIndex].FindControl("AttendanceTextBox5") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Assignment", (LiveResultGridView.Rows[e.RowIndex].FindControl("AssignmentTextBox6") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Midterm", (LiveResultGridView.Rows[e.RowIndex].FindControl("MidtermTextBox7") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Final", (LiveResultGridView.Rows[e.RowIndex].FindControl("FinalTextBox8") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Total", (LiveResultGridView.Rows[e.RowIndex].FindControl("TotalTextBox9") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(LiveResultGridView.DataKeys[e.RowIndex].Value));

                    sqlCmd.ExecuteNonQuery();

                    LiveResultGridView.EditIndex = -1;

                    advisorId = idTextBox.Text;
                    studentId = ImportResultsTextBox.Text;
                    loadLiveResultGrid(advisorId, studentId);

                    lrSuccessMessage.Text = "Selected Record Updated";
                    lrErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lrSuccessMessage.Text = "";
                lrErrorMessage.Text = ex.Message;
            }
        }

        protected void LiveResultGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM [dbo].[LiveResult] WHERE [Id]=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToString(LiveResultGridView.DataKeys[e.RowIndex].Value));
                    sqlCmd.ExecuteNonQuery();

                    advisorId = idTextBox.Text;
                    studentId = ImportResultsTextBox.Text;
                    loadLiveResultGrid(advisorId, studentId);

                    lrSuccessMessage.Text = "Selected Record Deleted";
                    lrErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lrSuccessMessage.Text = "";
                lrErrorMessage.Text = ex.Message;
            }
        }

        protected void LiveResultGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            LiveResultGridView.EditIndex = e.NewEditIndex;

            advisorId = idTextBox.Text;
            studentId = ImportResultsTextBox.Text;
            loadLiveResultGrid(advisorId, studentId);
        }

        protected void LiveResultGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            LiveResultGridView.EditIndex = -1;

            advisorId = idTextBox.Text;
            studentId = ImportResultsTextBox.Text;
            loadLiveResultGrid(advisorId, studentId);
        }

        public void loadStudentListGrid(string advisorId)
        {
            string studentListQuery = @"SELECT [S_Id], [S_Name], [S_Sem_No] FROM [dbo].[ParentTable] where S_Id in (SELECT [S_Id] FROM [dbo].AdvisorStudent  where A_Id = '" + advisorId + "')";

            studentListGridView.DataSource = db.getData(studentListQuery);
            studentListGridView.DataBind();
        }
        
        public void loadCourseRegistrationGrid(string advisorId, string studentId)
        {
            string crQuery = @"SELECT [Cr_Id], [S_Id],[S_Name],[C_Code],[C_Title],[Credit],[Section],[Teacher]FROM [dbo].[CourseRegistration] WHERE S_Id IN (SELECT [S_Id] = '" + studentId + "' FROM [dbo].AdvisorStudent where A_Id = '" + advisorId + "')";

            CourseRegistrationGridView.DataSource = db.getData(crQuery);
            CourseRegistrationGridView.DataBind();            
        }

        public void loadLiveResultGrid(string advisorId, string studentId)
        {

            string lrQuery = @"SELECT [Id], [S_Id],[S_Name],[C_Name],[Quize_Avg],[Attendance],[Assignment],[Midterm],[Final],[Total] FROM [dbo].[LiveResult] WHERE S_Id IN (SELECT [S_Id]  = '" + studentId + "' FROM [dbo].AdvisorStudent where A_Id = '" + advisorId + "')";


            LiveResultGridView.DataSource = db.getData(lrQuery);
            LiveResultGridView.DataBind();
        }


    }
}