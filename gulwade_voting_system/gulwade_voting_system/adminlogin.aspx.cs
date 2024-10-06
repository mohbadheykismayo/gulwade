using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gulwade_voting_system
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {






                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand(@"SELECT username, password FROM admin WHERE username = @username AND password = @pass", con))
                    {
                        cmd.Parameters.AddWithValue("@username", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@pass", TextBox3.Text);

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                Session["name"] = dr["username"].ToString();

                                Response.Redirect("admin.aspx");

                            }
                            else
                            {
                                Label1.Text = ("waa qalad passwordkaaga.");
                                Label1.ForeColor = System.Drawing.Color.Red;
                                Label1.Style["font-size"] = "20px";

                            }
                        }
                    }

                }

            }
            catch (Exception ex)
            {



            }

        }
    }
}