using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gulwade_voting_system
{
    public partial class home1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                // Session variables are null, redirect to the login page
                Response.Redirect("adminlogin.aspx"); // Replace "LoginPage.aspx" with the actual login page URL
            }
            else
            {
                // Session variables are not null, display them in labels

                Label1.Text = Session["name"]?.ToString() ?? "N/A";
            
            }
        }
    }
}