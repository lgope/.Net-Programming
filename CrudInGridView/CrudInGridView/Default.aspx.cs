using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace CrudInGridView
{
    public partial class Default : System.Web.UI.Page
    {
        string connectionString = @"Data Source=DESKTOP-LF18UAR\LAKSHMANSQL;Initial Catalog=PhoneBookDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();
            }
        }

        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM PhoneBook", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvPhoneBook.DataSource = dtbl;
                gvPhoneBook.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvPhoneBook.DataSource = dtbl;
                gvPhoneBook.DataBind();
                gvPhoneBook.Rows[0].Cells.Clear();
                gvPhoneBook.Rows[0].Cells.Add(new TableCell());
                gvPhoneBook.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvPhoneBook.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvPhoneBook.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

          protected void gvPhoneBook_RowCommand(object sender, GridViewCommandEventArgs e)
           {
               try
               {
                   if (e.CommandName.Equals("AddNew"))
                   {
                       using (SqlConnection sqlCon = new SqlConnection(connectionString))
                       {
                           sqlCon.Open();
                           string query = "INSERT INTO PhoneBook (FirstName,LastName,Contact,Email) VALUES (@FirstName,@LastName,@Contact,@Email)";
                           SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                           sqlCmd.Parameters.AddWithValue("@FirstName", (gvPhoneBook.FooterRow.FindControl("txtFirstNameFooter") as TextBox).Text.Trim());
                           sqlCmd.Parameters.AddWithValue("@LastName", (gvPhoneBook.FooterRow.FindControl("txtLastNameFooter") as TextBox).Text.Trim());
                           sqlCmd.Parameters.AddWithValue("@Contact", (gvPhoneBook.FooterRow.FindControl("txtContactFooter") as TextBox).Text.Trim());
                           sqlCmd.Parameters.AddWithValue("@Email", (gvPhoneBook.FooterRow.FindControl("txtEmailFooter") as TextBox).Text.Trim());
                           sqlCmd.ExecuteNonQuery();
                           PopulateGridview();
                           SuccessMessage.Text = "New Record Added";
                           ErrorMessage.Text = "";
                       }
                   }
               }
               catch (Exception ex)
               {
                   SuccessMessage.Text = "";
                   ErrorMessage.Text = ex.Message;
               }
           }

         protected void gvPhoneBook_RowEditing(object sender, GridViewEditEventArgs e)
         {
             gvPhoneBook.EditIndex = e.NewEditIndex;
             PopulateGridview();
        }

         protected void gvPhoneBook_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
         {
             gvPhoneBook.EditIndex = -1;
             PopulateGridview();
         }

         protected void gvPhoneBook_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE PhoneBook SET FirstName=@FirstName,LastName=@LastName,Contact=@Contact,Email=@Email WHERE PhoneBookID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@FirstName", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtFirstName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@LastName", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtLastName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Contact", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtContact") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Email", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtEmail") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvPhoneBook.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvPhoneBook.EditIndex = -1;
                    PopulateGridview();
                    SuccessMessage.Text = "Selected Record Updated";
                    ErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                SuccessMessage.Text = "";
                ErrorMessage.Text = ex.Message;
            }
        }
         
         protected void gvPhoneBook_RowDeleting(object sender, GridViewDeleteEventArgs e)
          {
              try
              {
                  using (SqlConnection sqlCon = new SqlConnection(connectionString))
                  {
                      sqlCon.Open();
                      string query = "DELETE FROM PhoneBook WHERE PhoneBookID = @id";
                      SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                      sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvPhoneBook.DataKeys[e.RowIndex].Value.ToString()));
                      sqlCmd.ExecuteNonQuery();
                      PopulateGridview();
                      SuccessMessage.Text = "Selected Record Deleted";
                      ErrorMessage.Text = "";
                  }
              }
              catch (Exception ex)
              {
                  SuccessMessage.Text = "";
                  ErrorMessage.Text = ex.Message;
              }
          }
    }
}
