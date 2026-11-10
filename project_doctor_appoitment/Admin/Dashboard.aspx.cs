using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient; //for connection
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_doctor_appoitment.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string filenm; // store the image path
        int i; //fro store existing user means how many user are avilable in databse
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        string nm;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (Session["admin"] != null)
            {
                //da = new SqlDataAdapter("select*from user_tbl where Email = '" + Session["user"] + "' ", con);
                //ds = new DataSet();
                //da.Fill(ds);
                //nm = ds.Tables[0].Rows[0]["FirstName"].ToString();

                Label1.Text = "Welcome : " + Session["admin"];
            }
            else
            {
                Response.Redirect("admin_login.aspx");
            }
        }
    }
}