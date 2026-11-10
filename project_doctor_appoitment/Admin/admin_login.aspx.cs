using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //for connection
using System.Data;
using System.Configuration;

namespace project_doctor_appoitment.Admin
{
    public partial class admin_login : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string filenm; // store the image path
        int i; //fro store existing user means how many user are avilable in databse
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            if(txt_admin_pass.Text != null && txt_admin_unm.Text!=null)
            {
               

                if(txt_admin_unm.Text=="Admin" && txt_admin_pass.Text =="admin123")
                {
                    Session["admin"] = txt_admin_unm.Text;
                    Response.Redirect("Dashboard.aspx");
                }
                
                else
                {
                    Response.Write("Wrong username or password");
                }
            }
        }
    }
}