using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gulwade_voting_system
{
    public partial class insertcandi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static string deletexil(string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Delete job from jobs table
                    string jobQuery = "DELETE FROM candidates WHERE cand_id = @id";

                    using (SqlCommand cmd = new SqlCommand(jobQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions
                throw new Exception("Error deleting job", ex);
            }
        }



        [WebMethod]
        public static string updatexil(Itemee data1)
        {
            // Define the file path
            string filePath = HttpContext.Current.Server.MapPath("~/images/");

            if (data1.Name != null)
            {
                // Ensure the directory exists
                if (!Directory.Exists(filePath))
                {
                    Directory.CreateDirectory(filePath);
                }

                string imageFilePath = string.Empty;

                // Check if there's new image data to update
                if (!string.IsNullOrEmpty(data1.Data))
                {
                    // Validate the file upload
                    string ext = Path.GetExtension(data1.Name);
                    if (ext.Equals(".jpg", StringComparison.OrdinalIgnoreCase) || ext.Equals(".png", StringComparison.OrdinalIgnoreCase))
                    {
                        string fileName = Path.GetFileName(data1.Name);
                        imageFilePath = Path.Combine(filePath, fileName);
                        File.WriteAllBytes(imageFilePath, Convert.FromBase64String(data1.Data));
                    }
                    else
                    {
                        return "Invalid file type. Please upload a .jpg or .png file.";
                    }
                }

                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                try
                {
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();

                        // Update the item in the candidates table
                        string catquery = "UPDATE candidates SET name = @name, postion = @postion" +
                                          (string.IsNullOrEmpty(imageFilePath) ? "" : ", images = @image") +
                                          " WHERE cand_id = @id;";
                        using (SqlCommand cmd = new SqlCommand(catquery, con))
                        {
                            cmd.Parameters.AddWithValue("@name", data1.magac);
                            cmd.Parameters.AddWithValue("@postion", data1.xil);
                            cmd.Parameters.AddWithValue("@id", data1.id);

                            // Only add the image parameter if a new image was uploaded
                            if (!string.IsNullOrEmpty(imageFilePath))
                            {
                                cmd.Parameters.AddWithValue("@image", "images/" + Path.GetFileName(data1.Name)); // Save relative path
                            }

                            cmd.ExecuteNonQuery();
                        }
                    }

                    return "true";
                }
                catch (Exception ex)
                {
                    // Handle exceptions and return the error message
                    return "Error in updateitem method: " + ex.Message;
                }
            }

            return "File name is null.";
        }

        public class Itemee
        {
            public string id { get; set; }
            public string Data { get; set; }
            public string Name { get; set; }
            public string itemname { get; set; }
            public string price { get; set; }
            public string xil { get; set; }
            public string magac { get; set; }
            public string image { get; set; }

        }



        //[WebMethod]
        //public static string submitxil(FileData data)
        //{
        //    // Save image file to server
        //    string filePath = HttpContext.Current.Server.MapPath("~/Files/");
        //    if (!Directory.Exists(filePath))
        //    {
        //        Directory.CreateDirectory(filePath);
        //    }

        //    string fileName = Path.GetFileName(data.Name);
        //    string imageFilePath = Path.Combine(filePath, fileName);
        //    File.WriteAllBytes(imageFilePath, Convert.FromBase64String(data.Data));

        //    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(cs))
        //        {
        //            con.Open();

        //            // Insert into Items table
        //            string catquery = "INSERT INTO candidates (name, images, postion) VALUES (@name, @image,@xil);";
        //            using (SqlCommand cmd = new SqlCommand(catquery, con))
        //            {
        //                cmd.Parameters.AddWithValue("@name", data.magac);
        //                cmd.Parameters.AddWithValue("@xil", data.xil);



        //                cmd.Parameters.AddWithValue("@image", File.ReadAllBytes(imageFilePath));
        //                cmd.ExecuteNonQuery();
        //            }
        //        }

        //        File.Delete(imageFilePath);

        //        return "true";
        //    }
        //    catch (Exception ex)
        //    {
        //        // Handle exceptions and return the error message
        //        return "Error in submititem method: " + ex.Message;
        //    }
        //}


        [WebMethod]
        public static string submitxil(FileData data)
        {
            // Define the file path
            string filePath = HttpContext.Current.Server.MapPath("~/images/");

            try
            {
                // Validate the file upload
                if (!string.IsNullOrEmpty(data.Name) && data.Data != null)
                {
                    // Extract file extension
                    string ext = Path.GetExtension(data.Name);
                    if (ext.Equals(".jpg", StringComparison.OrdinalIgnoreCase) || ext.Equals(".png", StringComparison.OrdinalIgnoreCase))
                    {
                        // Ensure the directory exists
                        if (!Directory.Exists(filePath))
                        {
                            Directory.CreateDirectory(filePath);
                        }

                        // Save the image file to server
                        string fileName = Path.GetFileName(data.Name);
                        string imageFilePath = Path.Combine(filePath, fileName);
                        File.WriteAllBytes(imageFilePath, Convert.FromBase64String(data.Data));

                        // Save the image path to the database
                        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            con.Open();

                            // Insert into Items table
                            string catquery = "INSERT INTO candidates (name, images, postion) VALUES (@name, @image, @xil);";
                            using (SqlCommand cmd = new SqlCommand(catquery, con))
                            {
                                cmd.Parameters.AddWithValue("@name", data.magac);
                                cmd.Parameters.AddWithValue("@xil", data.xil);
                                cmd.Parameters.AddWithValue("@image", "images/" + fileName); // Save relative path

                                cmd.ExecuteNonQuery();
                            }
                        }

                        return "true";
                    }
                    else
                    {
                        return "Invalid file type. Please upload a .jpg or .png file.";
                    }
                }
                else
                {
                    return "Please upload a file.";
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions and return the error message
                return "Error in submititem method: " + ex.Message;
            }
        }


        public class FileData
        {
            public string Data { get; set; }
            public string ContentType { get; set; }
            public string ItemID;
            public string magac;
            public string xil;


            public string Name;










        }
        //protected void Button1_Click(object sender, EventArgs e)
        //{

        //    try
        //    {
        //        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        //        using (SqlConnection con = new SqlConnection(cs))
        //        {
        //            con.Open();

        //            // Validate file upload
        //            if (FileUpload1.HasFile)
        //            {
        //                string ext = Path.GetExtension(FileUpload1.FileName);
        //                if (ext.Equals(".jpg", StringComparison.OrdinalIgnoreCase) || ext.Equals(".png", StringComparison.OrdinalIgnoreCase))
        //                {
        //                    string path = Server.MapPath("images/");
        //                    FileUpload1.SaveAs(path + FileUpload1.FileName);
        //                    string imagePath = "images/" + FileUpload1.FileName;

        //                    // Insert data into the database
        //                    string query = "INSERT INTO candidates(cand_id, name, middlename, lastname, images, postion) VALUES (@cand_id, @name, @middlename, @lastname, @images, @position)";
        //                    using (SqlCommand cmd = new SqlCommand(query, con))
        //                    {
        //                        cmd.Parameters.AddWithValue("@cand_id", cand.Text);
        //                        cmd.Parameters.AddWithValue("@name", first.Text);
        //                        cmd.Parameters.AddWithValue("@middlename", second.Text);
        //                        cmd.Parameters.AddWithValue("@lastname", third.Text);
        //                        cmd.Parameters.AddWithValue("@images", imagePath);
        //                        cmd.Parameters.AddWithValue("@position", DropDownList1.Text);

        //                        cmd.ExecuteNonQuery();

        //                        // Provide feedback to the user
        //                        // You can redirect to another page or display a success message here
        //                        Response.Write("Form submitted successfully!");
        //                    }
        //                }
        //                else
        //                {
        //                    // Handle invalid file type
        //                    Response.Write("Invalid file type. Please upload a .jpg or .png file.");
        //                }
        //            }
        //            else
        //            {
        //                // Handle case where no file is uploaded
        //                Response.Write("Please upload a file.");
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Handle other exceptions
        //        Response.Write("An error occurred: " + ex.Message);
        //    }

        //}

        public class Candidate
        {
            public string name;
            public string image;
            public string position;
            public string candi;
        }

        [WebMethod]
        public static Candidate[] datadisplay()
        {
            List<Candidate> details = new List<Candidate>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM candidates", con);
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        Candidate field = new Candidate
                        {
                            candi = dr["cand_id"].ToString(),
                            name = dr["name"].ToString(),
                            position = dr["postion"] != DBNull.Value ? dr["postion"].ToString() : string.Empty, // Handle null case
                            image = dr["images"].ToString() // Ensure this is the correct column name
                        };

                        details.Add(field);
                    }
                }
            }
            catch (Exception ex)
            {
                // Log or handle the error appropriately
                throw new Exception("Error retrieving candidate data: " + ex.Message);
            }

            return details.ToArray();
        }

    }
}