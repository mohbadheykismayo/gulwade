using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gulwade_voting_system
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["name"] == null)
            //{
            //    // Session variables are null, redirect to the login page
            //    Response.Redirect("adminlogin.aspx"); // Replace "LoginPage.aspx" with the actual login page URL
            //}
            //else
            //{
            //    // Session variables are not null, display them in labels

            //    Label2.Text = Session["name"]?.ToString() ?? "N/A";
            //    Session.Clear();
            //}
        }

        //[WebMethod]
        //public static string candi1()
        //{
        //    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        con.Open();

        //        // Query for cand_id = 1
        //        SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM votes WHERE cand_id = 1", con);
        //        int countCand1 = Convert.ToInt32(cmd1.ExecuteScalar());

        //        // Query for cand_id = 2
        //        SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM votes WHERE cand_id = 2", con);
        //        int countCand2 = Convert.ToInt32(cmd2.ExecuteScalar());
        //        SqlCommand cmd3 = new SqlCommand("SELECT COUNT(*) FROM votes WHERE cand_id = 3", con);
        //        int countCand3 = Convert.ToInt32(cmd3.ExecuteScalar());

        //        // Create a JSON object to hold the counts
        //        var counts = new
        //        {
        //            cand1 = countCand1,
        //            cand2 = countCand2,
        //            cand3 = countCand3
        //        };

        //        // Serialize the object to JSON and return it
        //        return new JavaScriptSerializer().Serialize(counts);
        //    }
        //}






        [WebMethod]
        public static object candi1()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Query for cand_id = 1
                SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) AS Count, name FROM votes v INNER JOIN candidates c ON v.cand_id = c.cand_id WHERE v.cand_id = 1 GROUP BY c.name", con);
                SqlDataReader reader1 = cmd1.ExecuteReader();

                int countCand1 = 0;
                string nameCand1 = "";

                if (reader1.Read())
                {
                    countCand1 = Convert.ToInt32(reader1["Count"]);
                    nameCand1 = reader1["name"].ToString();
                }
                reader1.Close();

                // Repeat the same process for other candidates...

                // Query for cand_id = 2
                SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) AS Count, name FROM votes v INNER JOIN candidates c ON v.cand_id = c.cand_id WHERE v.cand_id = 2 GROUP BY c.name", con);
                SqlDataReader reader2 = cmd2.ExecuteReader();

                int countCand2 = 0;
                string nameCand2 = "";

                if (reader2.Read())
                {
                    countCand2 = Convert.ToInt32(reader2["Count"]);
                    nameCand2 = reader2["name"].ToString();
                }
                reader2.Close();

                // Repeat the same process for cand_id = 3...
                SqlCommand cmd3 = new SqlCommand("SELECT COUNT(*) AS Count, name FROM votes v INNER JOIN candidates c ON v.cand_id = c.cand_id WHERE v.cand_id = 3 GROUP BY c.name", con);
                SqlDataReader reader3 = cmd3.ExecuteReader();

                int countCand3 = 0;
                string nameCand3 = "";

                if (reader3.Read())
                {
                    countCand3 = Convert.ToInt32(reader3["Count"]);
                    nameCand3 = reader3["name"].ToString();
                }
                reader3.Close();
                // Create a JSON object to hold the counts and names
                var data = new
                {
                    labels = new string[] { nameCand1, nameCand2, nameCand3 },
                    counts = new int[] { countCand1, countCand2, countCand3 }
                };
                return new JavaScriptSerializer().Serialize(data);
                // Return a C# object, which will be automatically serialized to JSON


                // Return the JSON string

            }
        }

        [WebMethod]
        public static object candi11()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Example SQL query to retrieve count, name, and image URL for candidates with position 'gudoomiye'
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) AS Count, c.name AS Name, c.images AS ImageUrl " +
                    "FROM votes v INNER JOIN candidates c ON v.cand_id = c.cand_id " +
                    "WHERE c.postion = 'gudoomiye' GROUP BY c.name, c.images", con);

                SqlDataReader reader = cmd.ExecuteReader();

                // Lists to store data
                List<string> names = new List<string>();
                List<int> counts = new List<int>();
                List<string> imageUrls = new List<string>();

                while (reader.Read())
                {
                    counts.Add(Convert.ToInt32(reader["Count"]));
                    names.Add(reader["Name"].ToString());
                    imageUrls.Add(reader["ImageUrl"].ToString());
                    // Assuming images is a byte array, convert it to a Base64 string
               
                }

                reader.Close();

                // Create a JSON object to hold the counts, names, and image URLs
                var data = new
                {
                    labels = names.ToArray(),
                    counts = counts.ToArray(),
                    imageUrls = imageUrls.ToArray()
                };

                return new JavaScriptSerializer().Serialize(data);
            }
        }


        [WebMethod]
        public static object candi1111()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Example SQL query to retrieve count, name, and image URL for candidates with position 'ku xigeen'
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) AS Count, c.name AS Name, c.images AS ImageUrl " +
                    "FROM votes v INNER JOIN candidates c ON v.cand_id = c.cand_id " +
                    "WHERE c.postion = 'ku xigeen' GROUP BY c.name, c.images", con);

                SqlDataReader reader = cmd.ExecuteReader();

                // Lists to store data
                List<string> names = new List<string>();
                List<int> counts = new List<int>();
                List<string> imageUrls = new List<string>();

                while (reader.Read())
                {
                    counts.Add(Convert.ToInt32(reader["Count"]));
                    names.Add(reader["Name"].ToString());

                      imageUrls.Add(reader["ImageUrl"].ToString());
                }

                reader.Close();

                // Create a JSON object to hold the counts, names, and image URLs
                var data = new
                {
                    labels = names.ToArray(),
                    counts = counts.ToArray(),
                    imageUrls = imageUrls.ToArray()
                };

                return new JavaScriptSerializer().Serialize(data);
            }
        }

        [WebMethod]
        public static object candi111()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Query for cand_id = 1
                SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) AS Count, name FROM votes v INNER JOIN candidates c ON v.cand_id = c.cand_id WHERE v.cand_id = 4 GROUP BY c.name", con);
                SqlDataReader reader1 = cmd1.ExecuteReader();

                int countCand1 = 0;
                string nameCand1 = "";

                if (reader1.Read())
                {
                    countCand1 = Convert.ToInt32(reader1["Count"]);
                    nameCand1 = reader1["name"].ToString();
                }
                reader1.Close();

                // Repeat the same process for other candidates...

                // Query for cand_id = 2
                SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) AS Count, name FROM votes v INNER JOIN candidates c ON v.cand_id = c.cand_id WHERE v.cand_id = 5 GROUP BY c.name", con);
                SqlDataReader reader2 = cmd2.ExecuteReader();

                int countCand2 = 0;
                string nameCand2 = "";

                if (reader2.Read())
                {
                    countCand2 = Convert.ToInt32(reader2["Count"]);
                    nameCand2 = reader2["name"].ToString();
                }
                reader2.Close();

                // Repeat the same process for cand_id = 3...
                SqlCommand cmd3 = new SqlCommand("SELECT COUNT(*) AS Count, name FROM votes v INNER JOIN candidates c ON v.cand_id = c.cand_id WHERE v.cand_id = 6 GROUP BY c.name", con);
                SqlDataReader reader3 = cmd3.ExecuteReader();

                int countCand3 = 0;
                string nameCand3 = "";

                if (reader3.Read())
                {
                    countCand3 = Convert.ToInt32(reader3["Count"]);
                    nameCand3 = reader3["name"].ToString();
                }
                reader3.Close();
                // Create a JSON object to hold the counts and names
                var data = new
                {
                    labels = new string[] { nameCand1, nameCand2, nameCand3 },
                    counts = new int[] { countCand1, countCand2, countCand3 }
                };
                return new JavaScriptSerializer().Serialize(data);
                // Return a C# object, which will be automatically serialized to JSON


                // Return the JSON string

            }
        }
        [WebMethod]
        public static string xigeen()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Query for cand_id = 1
                SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM votes WHERE cand_id = 4", con);
                int countCand1 = Convert.ToInt32(cmd1.ExecuteScalar());

                // Query for cand_id = 2
                SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM votes WHERE cand_id = 5", con);
                int countCand2 = Convert.ToInt32(cmd2.ExecuteScalar());
                SqlCommand cmd3 = new SqlCommand("SELECT COUNT(*) FROM votes WHERE cand_id = 6", con);
                int countCand3 = Convert.ToInt32(cmd3.ExecuteScalar());

                // Create a JSON object to hold the counts
                var counts = new
                {
                    cand1 = countCand1,
                    cand2 = countCand2,
                    cand3 = countCand3
                };

                // Serialize the object to JSON and return it
                return new JavaScriptSerializer().Serialize(counts);
            }
        }







        [WebMethod]
        public static int candi()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) AS count_distinct_std_id\r\nFROM (\r\n    SELECT DISTINCT std_id\r\n    FROM votes\r\n) AS distinct_std_ids;\r\n", con);

                int totalRecords = Convert.ToInt32(cmd.ExecuteScalar());
                return totalRecords;
            }
        }
        [WebMethod]
        public static int candidates()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM  candidates", con);

                int candi = Convert.ToInt32(cmd.ExecuteScalar());
                return candi;
            }
        }










        [WebMethod]
        public static int voters()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(distinct std_id)  FROM  voters", con);

                int candi = Convert.ToInt32(cmd.ExecuteScalar());
                return candi;
            }
        }








        [WebMethod]
        public static int voters1()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM  voters", con);

                int voters = Convert.ToInt32(cmd.ExecuteScalar());
                return voters;
            }
        }
    }
}