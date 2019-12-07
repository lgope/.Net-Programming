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
    public partial class ParentHomePage : System.Web.UI.Page
    {
        DataConnection db = new DataConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
                loadGrid();           
        }

        public void loadGrid()
        {           
            string crQuery = @"SELECT [S_Id],[S_Name],[C_Code],[C_Title],[Credit],[Section],[Teacher]FROM [dbo].[CourseRegistration]";

            string lrQuery = @"SELECT [S_Id],[S_Name],[C_Name],[Quize_Avg],[Attendance],[Assignment],[Midterm],[Final],[Total] FROM [dbo].[LiveResult]";

            
            RegisterCourseListGridView1.DataSource = db.getData(crQuery);
            RegisterCourseListGridView1.DataBind();

            LiveResultGridView1.DataSource = db.getData(lrQuery);
            LiveResultGridView1.DataBind();
        }
    }
}