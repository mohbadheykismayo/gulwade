using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gulwade_voting_system
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["stdid"] == null || Session["name"] == null)
            {
                // Session variables are null, redirect to the login page
                Response.Redirect("login.aspx"); // Replace "LoginPage.aspx" with the actual login page URL
            }
            else
            {
                // Session variables are not null, display them in labels
                Label1.Text = Session["stdid"]?.ToString() ?? "N/A";
                Label2.Text = Session["name"]?.ToString() ?? "N/A";
                Session.Clear();
            }
        }
        [WebMethod]
        public static List<Product> GetProducts()
        {
            List<Product> products = new List<Product>();

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string query = "SELECT cand_id, name, images FROM candidates WHERE postion = 'gudoomiye'";

            using (SqlConnection connection = new SqlConnection(cs))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Product product = new Product
                            {
                                Id = Convert.ToInt32(reader["cand_id"]),
                                Name = reader["name"].ToString(),
                                //ImageUrl = Convert.ToBase64String((byte[])reader["images"]) // Convert the varbinary to Base64
                                   ImageUrl = reader["images"].ToString()
                            };
                            products.Add(product);
                        }
                    }
                }
            }

            return products;
        }

        public class Product
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string ImageUrl { get; set; }
        }


        [WebMethod]
        public static List<Product> getxigeen()
        {
            List<Product> products = new List<Product>();

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string query = "SELECT cand_id, name, images FROM candidates WHERE postion = 'ku xigeen'";

            using (SqlConnection connection = new SqlConnection(cs))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Product product1 = new Product
                            {
                                Id = Convert.ToInt32(reader["cand_id"]),
                                Name = reader["name"].ToString(),
                                // Convert varbinary image data to Base64
                                //ImageUrl = Convert.ToBase64String((byte[])reader["images"])
                                   ImageUrl = reader["images"].ToString()
                            };
                            products.Add(product1);
                        }
                    }
                }
            }

            return products;
        }

        public class Product1
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string ImageUrl { get; set; }
        }



        [WebMethod]
        public static string SubmitData(int std, string name, int xigenValue, int productValue)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                using (SqlTransaction transaction = con.BeginTransaction())
                {
                    try
                    {
                        // Insert data into the 'votes' table
                        using (SqlCommand cmdInsert = new SqlCommand(@"
                    INSERT INTO votes (std_id, username, cand_id) 
                    VALUES (@std, @name, @cand)
                ", con, transaction))
                        {
                            cmdInsert.Parameters.AddWithValue("@std", std);
                            cmdInsert.Parameters.AddWithValue("@name", name);
                            cmdInsert.Parameters.AddWithValue("@cand", xigenValue);
                            cmdInsert.ExecuteNonQuery();
                        }

                        // Add another command to update data in another table, for example
                        using (SqlCommand cmdUpdate = new SqlCommand(@"
                    insert into  votes  (std_id, username, cand_id)   VALUES (@std, @name, @cand)
                ", con, transaction))
                        {
                            cmdUpdate.Parameters.AddWithValue("@std", std);
                            cmdUpdate.Parameters.AddWithValue("@name", name);
                            cmdUpdate.Parameters.AddWithValue("@cand", productValue);
                            cmdUpdate.ExecuteNonQuery();
                        }

                        // Commit the transaction if everything is successful
                        transaction.Commit();

                        return "true";
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions, and possibly log them
                        transaction.Rollback();
                        return "false";
                    }
                }
            }
        }
    }
}