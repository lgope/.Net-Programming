using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Parent_Portal.Pages
{
    public class DataConnection
    {

        String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        public DataTable getData(String query)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            // get data from sql
            SqlDataAdapter da = new SqlDataAdapter(query, conn);

            // store data at a table
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;

        }

        public int ExecuteQuery(string query)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand(query, conn);

            try
            {
                cmd.ExecuteNonQuery();
                return 1;

            }
            catch (Exception ex)
            {
                return 0;
            }


        }
    }

}