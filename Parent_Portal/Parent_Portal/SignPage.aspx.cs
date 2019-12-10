﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Parent_Portal.SignInUp
{
    public partial class index : System.Web.UI.Page
    {
        string connectionString = @"Data Source=DESKTOP-LF18UAR\LAKSHMANSQL;Initial Catalog=Parent_Portal;Integrated Security=True";
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signupButton_Click(object sender, EventArgs e)
        {            
        
            try
            {
                using(SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string regiQuery = @"INSERT INTO [dbo].[ParentTable] ([P_Name],[P_Email],[P_Password],[S_Id],[S_Name],[S_Sem_No])
                             VALUES ('" + ParentName.Text + "', '" + ParentEmail.Text + "', '" + ParentPass.Text + "', '" + StudentID.Text + "', '" + StudentName.Text + "', '" + StudentSemNo.Text + "')";

                    SqlCommand sqlCmd = new SqlCommand(regiQuery, sqlCon);
                    sqlCmd.ExecuteNonQuery();

                    Response.Write("<script language=javascript>alert('Register Successfully Done.')</script>");

                    ParentName.Text = "";
                    ParentEmail.Text = "";
                    ParentPass.Text = "";
                    ParenteE_pass.Text = "";
                    StudentID.Text = "";
                    StudentName.Text = "";
                    StudentSemNo.Text = "";
                }
            }
            catch (Exception ex)
            {
                
            }
        }

        protected void signin_Click(object sender, EventArgs e)
        {
            // Admin Loing
            if (user_email.Text == "Admin" && user_pass.Text == "1234")
            {
                Response.Redirect("./Pages/AdminHomePage.aspx");
            }

            // Advisor Login
            else if (Int32.TryParse(user_email.Text, out int numValue))
            {
                DataTable dtbl = new DataTable();
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {                                    
                    string AdvisorQuery = @"SELECT [A_Id],[A_Pass] FROM [dbo].[Advisor] where A_Id = '" + user_email.Text + "' and A_Pass = '" + user_pass.Text + "'";
                    sqlCon.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter(AdvisorQuery, sqlCon);

                    sqlDa.Fill(dtbl);
                }
                if (dtbl.Rows.Count <= 0)
                {
                    Response.Write("<script language=javascript>alert('Email or Pass Incorrect!')</script>");

                    user_email.Text = "";
                    user_pass.Text = "";
                }
                else
                {
                    Response.Redirect("./Pages/AdvisorHomePage.aspx");
                }
            }
            // Parent Loing
            else
            {
                DataTable dtbl = new DataTable();
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    string UserQuery = @"SELECT [P_Email],[P_Password] FROM [dbo].[ParentTable]
                                     where P_Email = '" + user_email.Text + "' and P_Password = '" + user_pass.Text + "'";
                    sqlCon.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter(UserQuery, sqlCon);

                    sqlDa.Fill(dtbl);
                }
                if (dtbl.Rows.Count <= 0)
                {
                    Response.Write("<script language=javascript>alert('Email or Pass Incorrect!')</script>");

                    user_email.Text = "";
                    user_pass.Text = "";
                }
                else
                {
                    Response.Redirect("./Pages/HomePage.aspx");
                }
            }
        }
    }
}