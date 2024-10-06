using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gulwade_voting_system
{
    public partial class import : System.Web.UI.Page
    {

        OleDbConnection Econ;
        SqlConnection con;

        string constr, Query, sqlconn;
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        private void ExcelConn(string FilePath)
        {
            // Add IMEX=1 to handle mixed data types
            constr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 12.0 Xml;HDR=YES;IMEX=1';", FilePath);
            Econ = new OleDbConnection(constr);
        }

        private void connection()
        {
            // Initialize the SQL connection string from the config file
            sqlconn = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            con = new SqlConnection(sqlconn);
        }

        private void InsertExcelRecords(string FilePath)
        {
            // Use the updated connection string with IMEX=1 in ExcelConn
            ExcelConn(FilePath);

            // Use Econ initialized in ExcelConn
            string Query = "SELECT [std_id], [username], [password] FROM [Sheet1$]";

            using (OleDbCommand Ecom = new OleDbCommand(Query, Econ))
            {
                Econ.Open();
                DataSet ds = new DataSet();
                OleDbDataAdapter oda = new OleDbDataAdapter(Ecom);
                oda.Fill(ds);
                Econ.Close();

                // Create a DataTable from the data set
                DataTable Exceldt = ds.Tables[0];

                // Initialize the SQL connection
                connection();

                // Create SqlBulkCopy object for batch insert
                using (SqlBulkCopy objbulk = new SqlBulkCopy(con))
                {
                    objbulk.DestinationTableName = "voters";

                    // Map columns to the destination table
                    objbulk.ColumnMappings.Add("std_id", "std_id");
                    objbulk.ColumnMappings.Add("username", "username");
                    objbulk.ColumnMappings.Add("password", "password");

                    // Insert DataTable records into the database
                    con.Open();
                    objbulk.WriteToServer(Exceldt);
                    con.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Save the uploaded file to a temporary path
            string filePath = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString("N") + ".xlsx");
            FileUpload1.SaveAs(filePath);
            try
            {
                InsertExcelRecords(filePath);
            }
            finally
            {
                // Delete the file after processing
                File.Delete(filePath);
            }
        }

        [WebMethod]
        public static stdclass[] DataBind()
        {
            List<stdclass> details = new List<stdclass>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"select *from voters", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                stdclass field = new stdclass();
                field.std_id = dr["std_id"].ToString();
                field.username = dr["username"].ToString();
                field.password = dr["password"].ToString();

                details.Add(field);
            }
            return details.ToArray();
        }





        [WebMethod]
        public static string confirmDelet(string id)
        {

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"delete from voters ", con);
            //cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            return "true";


        }



        [WebMethod]
        public static string endsystem()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();


                    // Adjust the query to insert the parsed date
                    string updateQuery = "UPDATE SystemStatus SET IsSystemStarted = @IsSystemStarted";
                    using (SqlCommand cmd = new SqlCommand(updateQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@IsSystemStarted", false);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (SqlException sqlEx)
            {
                return $"SQL Error: {sqlEx.Message}";
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
        }




        [WebMethod]
        public static string startsystem()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();


                    // Adjust the query to insert the parsed date
                    string updateQuery = "UPDATE SystemStatus SET IsSystemStarted = @IsSystemStarted";
                    using (SqlCommand cmd = new SqlCommand(updateQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@IsSystemStarted", true);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (SqlException sqlEx)
            {
                return $"SQL Error: {sqlEx.Message}";
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
        }



        [WebMethod]
        public static string reset()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();


                    // Adjust the query to insert the parsed date
                    string delete1 = " delete from votes";
                    using (SqlCommand cmd = new SqlCommand(delete1, con))
                    {


                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (SqlException sqlEx)
            {
                return $"SQL Error: {sqlEx.Message}";
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
        }









        [WebMethod]
        public static string tuur()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();


                    // Adjust the query to insert the parsed date
                    string delete1 = " delete from voters";
                    using (SqlCommand cmd = new SqlCommand(delete1, con))
                    {


                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (SqlException sqlEx)
            {
                return $"SQL Error: {sqlEx.Message}";
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
        }

        public class stdclass
        {
            public string std_id { get; set; }
            public string username { get; set; }
            public string password { get; set; }

        }

    }
}