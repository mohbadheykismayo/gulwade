using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gulwade_voting_system
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            DisplaySystemStatus();


        }
        private void lgo()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"select * from voters where std_id =@stdid and password = @pass", con);

            cmd.Parameters.AddWithValue("@stdid", TextBox2.Text);

            cmd.Parameters.AddWithValue("@pass", TextBox3.Text);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["stdid"] = dr["std_id"].ToString();
                Session["name"] = dr["username"].ToString();
                dr.Close();



                // Check if the user exists in the other table
                SqlCommand cmd2 = new SqlCommand(@"SELECT * FROM votes WHERE std_id = @stdid", con);
                cmd2.Parameters.AddWithValue("@stdid", TextBox2.Text);

                SqlDataReader dr2 = cmd2.ExecuteReader();

                if (dr2.Read())
                {

                    Label1.Text = ("horey ayaa u coodese.");
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Style["font-size"] = "20px";

                }
                else
                {
                    // User exists in 'voters' table but not in the other table, redirect to homepage

                    //Response.Redirect("homepage.aspx");
                    Response.Redirect("home.aspx");

                }








            }
            else
            {
                //Response.Write("waa qalad passwordkaaga.");
                Label1.Text = ("waa qalad passwordkaaga.");
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Style["font-size"] = "20px";
            }



        }
        private void DisplaySystemStatus()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT IsSystemStarted FROM SystemStatus";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    bool isSystemStarted = Convert.ToBoolean(command.ExecuteScalar());

                    if (isSystemStarted)
                    {
                        lgo();
                    }
                    else
                    {
                        //Response.Write("waa qalad passwordkaaga.");
                        Label1.Text = ("Codeynta Wee Xirantahay.");
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Style["font-size"] = "20px";
                    }
                }
            }
        }





    }
}